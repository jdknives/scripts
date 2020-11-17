package main

import (
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"os/exec"
	"strings"

	"github.com/creack/pty"
)

var username string = "skycoin"

type Repo struct {
	Name    string `json:"name"`
	HTMLUrl string `json:"html_url"`
}

func main() {

	url := fmt.Sprintf("https://api.github.com/users/%s/repos", username)

	client := http.Client{}

	resp, err := client.Get(url)
	if err != nil {
		log.Fatal(err)
	}

	defer resp.Body.Close()

	var ret = make([]Repo, 0)

	byteSlice, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatal(err)
	}

	err = json.Unmarshal(byteSlice, &ret)
	if err != nil {
		log.Fatal(err)
	}

	for _, v := range ret {
		err := cloneRepoIfNotExist(v)
		if err != nil {
			log.Fatal(err)
		}
	}

	fmt.Fprint(os.Stdout, "Cloned %d repos from %s:", len(ret), username)

}

func cloneRepoIfNotExist(repo Repo) error {

	dir := fmt.Sprintf("./%s", repo.Name)

	if _, err := os.Stat(dir); os.IsNotExist(err) {

		args := fmt.Sprintf("clone %s", repo.HTMLUrl)

		cmd := exec.Command("git", strings.Fields(args)...)

		f, err := pty.Start(cmd)
		if err != nil {
			panic(err)
		}

		io.Copy(os.Stdout, f)

		return nil
	}

	fmt.Println("Pulling:", repo.Name)

	cmd := exec.Command("git", "pull")
	cmd.Dir = "./" + repo.Name
	f, err := pty.Start(cmd)
	if err != nil {
		panic(err)
	}

	io.Copy(os.Stdout, f)

	return nil
}

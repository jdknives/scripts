package main

import (
	"fmt"
	"log"
	"os"
	"strconv"
)

func main() {

	for i := 0; i <= 52; i++ {
		title := fmt.Sprintf("CW-" + strconv.Itoa(i) + ".md")
		file, err := os.Create(title)
		if err != nil {
			log.Fatal(err)
		}

		fmt.Fprint(file, "## Work Report \n ### Monday \n\n ### Tuesday \n\n ### Wednesday\n\n ### Thursday \n\n ### Friday \n\n ### Saturday")

		file.Close()
	}

}

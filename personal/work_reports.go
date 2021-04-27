package main

import (
	"fmt"
	"log"
	"os"
	"strconv"
)

func main() {

	for i := 16; i <= 52; i++ {
		title := fmt.Sprintf("CW-" + strconv.Itoa(i) + ".md")
		file, err := os.Create(title)
		if err != nil {
			log.Fatal(err)
		}

		fmt.Fprintf(file, "# Calendar Week %v \n ## Work Report \n ### Monday \n\n ### Tuesday \n\n ### Wednesday\n\n ### Thursday \n\n ### Friday \n\n ### Saturday \n", i)

		file.Close()
	}

}

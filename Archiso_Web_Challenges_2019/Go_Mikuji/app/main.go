package main

import (
	"fmt"
	"io"
	"log"
	"math/rand"
	"net/http"
	"os"
	"path"
	"path/filepath"
	"strings"
)

func main() {
	cwd, err := os.Getwd()

	if err != nil {
		log.Fatal(err)
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("rpath", r.URL.Path)
		fmt.Println("base", path.Base(r.URL.Path))
		name := filepath.FromSlash(filepath.Join(cwd, "public", path.Base(r.URL.Path)))
		fmt.Println("JOIN", name)
		path := strings.Replace(name, "\\", "/", -1)
		fmt.Println("Replace", name)
		f, err := os.Open(path)

		if err != nil {
			http.NotFound(w, r)
			return
		}

		defer f.Close()
		io.Copy(w, f)
	})

	http.HandleFunc("/public/omikuji", func(w http.ResponseWriter, r *http.Request) {
		results := []string{"大吉", "中吉", "小吉", "凶", "大凶"}
		fmt.Fprintf(w, "<html><head><title>Go Mikuji | Fortune</title><meta charset=\"utf-8\"></head><body><h1>Go Mikuji</h1><p>Today's fortune: %s</p></body></html>", results[rand.Intn(len(results))])
	})

	http.ListenAndServe(":8080", nil)
}

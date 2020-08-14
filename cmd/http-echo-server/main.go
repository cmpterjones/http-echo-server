package main

import (
	"io/ioutil"
	"log"
	"net/http"
)

func indexHandler(w http.ResponseWriter, req *http.Request) {
	body, err := ioutil.ReadAll(req.Body)
	if err != nil {
		log.Printf("Error reading request body: %v", err)
		http.Error(w, "Could not read body", http.StatusBadRequest)
	} else if len(body) == 0 {
		w.WriteHeader(http.StatusNoContent)
	} else {
		w.Write(body)
	}
	log.Printf("%s - %s - %s", req.Method, req.URL, body)
	req.Body.Close()
}

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("/", indexHandler)
	log.Print("Starting up...")

	s := &http.Server{
		Addr:    ":8080",
		Handler: mux,
	}
	log.Fatal(s.ListenAndServe())
}

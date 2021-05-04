package main

import (
	"fmt"
)

func main() {
	if checkPassword(getPassword()) {
		fmt.Println("OK. Password:", getPassword())
	}
}

func checkPassword(password string) bool {
	if len(password) != 32 {
		return false
	}

	s := "861836f13e3d627dfa375bdb8389214e"
	key := "JSG]AE\x03T]\x02Z\nSWE\r\x05\x00]UT\x10\x01\x0eAUWKEPF\x01"

	for i := 0; i < 32; i++ {
		a := password[i]
		esi := s[i]
		xor := a ^ esi
		if key[i] != xor {
			return false
		}
	}

	return true
}

func getPassword() string {
	// esp_0x4c := 32
	// if len(password) != 32 {
	// 	return false
	// }

	s := "861836f13e3d627dfa375bdb8389214e"
	key := "JSG]AE\x03T]\x02Z\nSWE\r\x05\x00]UT\x10\x01\x0eAUWKEPF\x01"

	pass := ""
	for i := 0; i < 32; i++ {
		pass += string(s[i] ^ key[i])
	}

	// for i := 0; i < esp_0x4c; i++ {
	// 	a := password[i]
	// 	esi := s[i]
	// 	xor := string(a ^ esi)
	// 	if esp_0x24[i] != xor {
	// 		return false
	// 	}
	// }
	return pass
}

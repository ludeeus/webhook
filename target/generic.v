module target

import net.http


pub fn generic(url string, data string){
	if data == "" {
		println("The target 'generic' require '--data'")
		exit(1)
	}
	response := http.post_json(url, data) or { panic("") }
	if response.status_code !in [200, 202, 204, 206] {
		println(response.text)
		exit(1)
	}
}
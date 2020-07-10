module target

import net.http


pub fn teams(url string, title string, message string){
	mut data := ""
	if title != "" {
		data = '{"@type": "MessageCard", "title": "${title}", "text": "${message}"}'
	} else {
		data = '{"@type": "MessageCard", "text": "${message}"}'
	}
	response := http.post_json(url, data) or { panic("") }
	if response.status_code != 200 {
		println(response.text)
		exit(1)
	}
}
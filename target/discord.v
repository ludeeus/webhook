module target

import net.http

pub fn discord(url, title, message, username string) {
	mut data := ''
	if title != '' {
		data = '{"username": "$username", "embeds": [{"title": "$title", "description": "$message"}]}'
	} else {
		data = '{"username": "$username", "content": "$message"}'
	}
	response := http.post_json(url, data) or {
		panic('')
	}
	if response.status_code != 204 {
		println(response.text)
		exit(1)
	}
}

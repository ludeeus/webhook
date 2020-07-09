module main

import cli
import os
import target

const (
	implemented = ['discord']
	version     = 'MASTER'
)

fn main() {
	mut cmd := cli.Command{
		name: 'Webhook notifier'
		description: 'V powered CLI Webhook notifier'
		version: version
	}
	mut send_cli := cli.Command{
		name: 'send'
		description: 'Send a message to a target with a webhook'
		execute: send
	}
	send_cli.add_flag(cli.Flag{
		flag: .string
		value: 'Webhook notifier'
		name: 'username'
		description: 'The username that should be used for the post'
	})
	send_cli.add_flag(cli.Flag{
		flag: .string
		required: true
		name: 'message'
		description: 'The message that should be posted'
	})
	send_cli.add_flag(cli.Flag{
		flag: .string
		value: ''
		name: 'title'
		description: 'The title that should be posted'
	})
	send_cli.add_flag(cli.Flag{
		flag: .string
		required: true
		name: 'url'
		description: 'The webhook URL to post against'
	})
	send_cli.add_flag(cli.Flag{
		flag: .string
		value: 'discord'
		name: 'notifier'
		description: 'The type of target (defaults to "discord")'
	})
	cmd.add_command(send_cli)
	cmd.parse(os.args)
}

fn send(cmd cli.Command) {
	title := cmd.flags.get_string('title') or {
		panic('')
	}
	message := cmd.flags.get_string('message') or {
		panic('')
	}
	username := cmd.flags.get_string('username') or {
		panic('')
	}
	notifier := cmd.flags.get_string('notifier') or {
		panic('')
	}
	url := cmd.flags.get_string('url') or {
		panic('')
	}
	match notifier {
		'discord' { target.discord(url, title, message, username) }
		else { println('The notifier $notifier is currently not supported') }
	}
	exit(0)
}

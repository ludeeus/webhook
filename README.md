# Webhook notifier

[V](https://github.com/vlang/v) powered CLI Webhook notifier

## Purpose

- Try out something with [V](https://github.com/vlang/v)
- Get a small binary I can use in github actions in other projects

## Installation

```bash
git clone https://github.com/ludeeus/webhook
v -prod . -o webhook-notifier
./webhook-notifier
```

## Usage

```bash
Usage: Webhook notifier [FLAGS] [COMMANDS]

V powered CLI Webhook notifier

Flags:
  -h  --help          Prints help information
  -v  --version       Prints version information

Commands:
  help                Prints help information
  send                Send a message to a target with a webhook
  version             Prints version information

```

## Supported targets

- Discord (default)
- Microsoft Teams

## Docker

This is also available as a minimalistic docker container (> 4MB) [ludeeus/webhook
](https://hub.docker.com/r/ludeeus/webhook)

To get started just run:

```bash
docker run ludeeus/webhook
```

Full example:

```bash
docker run ludeeus/webhook send --url "https://discordapp.com/api/webhooks/xxxxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxx" --message "Test message with webhook notifier" --title "Powered by V"
```

## License

Licensed under [MIT](LICENSE)

## Contributing

Contribution is welcome. Please read [Code of Conduct](.github/CODE_OF_CONDUCT.md).
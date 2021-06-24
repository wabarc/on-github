# Wayback on GitHub

Read this in other languages: English | [简体中文](./README.zh-CN.md)

Host wayback service on GitHub using Actions.

## Configurations

Wayback service use environment variables as default.

#### WAYBACK_DAEMON

Enable daemon service, e.g WAYBACK_DAEMON=telegram,web

Supported services:

- **telegram**
- **web**
- **mastodon**
- **twitter**
- **irc**
- **matrix**

#### WAYBACK_TELEGRAM_TOKEN (required)

Telegram Bot API Token.

#### WAYBACK_TO

Enable archiving service, separate by comma.

Slot values are:

- ia: Internet Archive
- is: archive.today
- ip: IPFS
- ph: Telegra.ph

More configuration options and details, see [wabarc/wayback#configuration-parameters](https://github.com/wabarc/wayback#configuration-parameters)

## Example

```yaml
- name: Wayback on GitHub
  uses: wabarc/on-github@v1.0.0
  env:
    DEBUG: 'true'
    WAYBACK_DAEMON: 'web'
```

## License

This software is released under the terms of the MIT. See the [LICENSE](https://github.com/wabarc/on-github/blob/main/LICENSE) file for details.

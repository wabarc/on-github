# Wayback on GitHub

Read this in other languages: English | [简体中文](./README.zh-CN.md)

Host wayback service on GitHub using Actions.

## Configurations

Wayback service use environment variables as default.

#### WAYBACK_DAEMON

Enable daemon service, supports **telegram**, **web**, **mastodon**, **twitter**, e.g WAYBACK_DAEMON=telegram,web

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
- uses: wabarc/on-github@v0.0.1
  env:
    WAYBACK_TELEGRAM_TOKEN: ${{ secrets.WAYBACK_TELEGRAM_TOKEN }}
```

## License

This software is released under the terms of the MIT. See the [LICENSE](https://github.com/wabarc/on-github/blob/main/LICENSE) file for details.

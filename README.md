# Wayback on GitHub

Read this in other languages: English | [简体中文](./README.zh-CN.md)

Host wayback service on GitHub using Actions.

## Configurations

Wayback service use environment variables as default.

#### WAYBACK_DAEMON

Enable daemon service, supports **telegram**, **web**, e.g WAYBACK_DAEMON=telegram,web

#### WAYBACK_TELEGRAM_TOKEN (required)

Telegram Bot API Token.

#### WAYBACK_ENABLE_IA

Enable Internet Archive.

More configuration options and details, see [wabarc/wayback#configuration-parameters](https://github.com/wabarc/wayback#configuration-parameters)

## Example

```yaml
- uses: wabarc/on-github@v0.0.1
  env:
    WAYBACK_TELEGRAM_TOKEN: ${{ secrets.WAYBACK_TELEGRAM_TOKEN }}
```

## License

This software is released under the terms of the MIT. See the [LICENSE](https://github.com/wabarc/on-github/blob/main/LICENSE) file for details.

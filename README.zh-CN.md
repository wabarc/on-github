# Wayback on GitHub

阅读其它语言版本: [English](./README.md) | 简体中文

基于 GitHub Actions 运行 `wayback` 服务.

## 配置

`wabarc/on-github` 支持通过以下系统环境变量控制 `wayback` 服务的运行。

#### WAYBACK_TELEGRAM_TOKEN (required)

Telegram Bot API Token.

#### WAYBACK_TO

启用的备份项，多个用英文逗号分隔，支持如下项目：

- ia: Internet Archive
- is: archive.today
- ip: IPFS
- ph: Telegra.ph

更多配置选项参见 [wabarc/wayback#configuration-parameters](https://github.com/wabarc/wayback#configuration-parameters)

## 示例

以下部分位于 `Actions` 任务的步骤节点：

```yaml
- name: Wayback on GitHub
  uses: wabarc/on-github@v1.0.0
  env:
    DEBUG: 'true'
    WAYBACK_DAEMON: 'web'
```

完整配置：

```yaml
name: Wayback On GitHub

on:
  schedule:
    - cron: '0 */6 * * *'

jobs:
  wayback:
    runs-on: ubuntu-latest
    timeout-minutes: 360
    continue-on-error: true
    steps:
    - name: Run wayback service
      uses: wabarc/on-github@v0.0.1
      env:
        WAYBACK_TELEGRAM_TOKEN: ${{ secrets.WAYBACK_TELEGRAM_TOKEN }}
```

## 开源协议

MIT

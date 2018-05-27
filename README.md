# bts-bot

http://balancerensa.net/

[![Build Status](https://travis-ci.org/bts3/bts-bot.svg?branch=master)](https://travis-ci.org/bts3/bts-bot)

PR 歓迎です :rabbit: :sparkles:

## 実装されているコマンド

- `!echo`: オウム返しする
- `!usagi` 「かわいい」と返す
- `!iokuji`: いおくじ
- `!image`: Google で画像検索した結果から適当に一つ選んで出します
- `!scale`: ものさし

## 手元で動かす

- Ruby 2.5+
- 環境変数 `CLIENT_ID` に Discord bot のクライアント ID を、環境変数 `SECRET_TOKEN` にトークンを入れた状態にする

```
$ export CLIENT_ID=...          # Your Discord bot client ID (required)
$ export SECRET_TOKEN=...       # Your Discord bot token (required)
$ export GOOGLE_CSE_ID=...      # Google Custom Search ID (optional, required by Image plugin)
$ export GOOGLE_CSE_API_KEY=... # Google Custom Search API key (optional, required by Image plugin)
$ bundle install -j4
$ bundle exec exe/bts_bot
```

## Docker イメージ

bTS メンバーなら誰でも push できるようにしたい..

```
$ docker build -t mozamimy/bts-bot .
$ docker push mozamimy/bts-bot:latest
```

## デプロイ

とりあえず [Arukas](https://arukas.io/) で雑に動かしてます。bTS メンバーなら誰でもデプロイできる仕組みにしたい。

## ライセンス

MIT

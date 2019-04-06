---
title: Git 情報変数
linktitle: Git 変数
description: コンテンツファイル毎の最新 Git リビジョン情報を取得します。
date: 2017-03-12
publishdate: 2017-03-12
lastmod: 2017-03-12
categories: [variables and params]
keywords: [git]
draft: false
menu:
  docs:
    parent: "variables"
    weight: 70
weight: 70
sections_weight: 70
aliases: [/extras/gitinfo/]
toc: false
wip: false
---

{{% note "`.GitInfo` Performance Considerations"  %}}
Hugo の Git 統合はかなりパフォーマンスが良いはずですが、ビルド時間が長くなる*かも*しれません。これは Git の履歴サイズによります。
{{% /note %}}

## `.GitInfo` の必須要件

1. Hugo サイトが Git が有効化されたディレクトリー内にあること
2. Git がインストールされており、システムの `PATH` が通っていること
3. Hugo プロジェクトの`.GitInfo` が有効になっていること。コマンドラインで`--enableGitInfo` フラグをつけるか、[サイトの設定ファイル][configuration]に `enableGitInfo` を `true` で設定することで有効にできます

## `.GitInfo` オブジェクト

`GitInfo` オブジェクトには以下のフィールドがあります。

.AbbreviatedHash
: 短縮形のコミットハッシュ（例：`866cbcc`）

.AuthorName
: 作者名。`.mailmap` に従います。

.AuthorEmail
: 作者のメールアドレス。`.mailmap` に従います。

.AuthorDate
: 作成日時

.Hash
: コミットハッシュ（例：`866cbccdab588b9908887ffd3b4f2667e94090c3`）

.Subject
: コミットメッセージの件名（例：`tpl: Add custom index function`）

## `.Lastmod`

`.GitInfo` 機能が有効になっている場合、（`Page` の）`.Lastmod` は Git の、例えば`.GitInfo.AuthorDate` から取得されます。この挙動は[日付のフロントマター設定](/getting-started/configuration/#configure-front-matter)を追加することで変更できます。

[configuration]: /getting-started/configuration/

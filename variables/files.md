---
title: ファイル変数
linktitle:
description: "`.File` 変数でコンテンツファイルのファイルシステム関連データを取得できます。"
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [variables and params]
keywords: [files]
draft: false
menu:
  docs:
    parent: "variables"
    weight: 40
weight: 40
sections_weight: 40
aliases: [/variables/file-variables/]
toc: false
---

{{% note "Rendering Local Files" %}}
Hugo のファイル関連機能を利用するショートコードやテンプレートの作成については、[ローカルファイルテンプレート](/templates/files/)を御覧ください。
{{% /note %}}

`.File` オブジェクトには以下のフィールドがあります。

.File.Path
: コンテンツディレクトリからのオリジナル相対パス。（例：`posts/foo.en.md`）

.File.LogicalName
: ページを表すコンテンツファイル名。（例：`foo.en.md`）

.File.TranslationBaseName
: 拡張子やオプションの言語識別子なしのファイル名。（例：`foo`）

.File.ContentBaseName
: TranslationBaseName または、リーフバンドルの場合はフォルダー名。

.File.BaseFileName
: 拡張子なしのファイル名。（例：`foo.en`）


.File.Ext
: コンテンツファイルの拡張子（例：`md`）。`.File.Extension` でも同じように呼び出せます。`.`が含まれないことに注意してください。

.File.Lang
: [多言語対応][multilingual]が有効になっている場合は、そのファイルに関連付けられた言語名。（例：`en`）

.File.Dir
: `content/posts/dir1/dir2/` であれば、ディレクトリの相対パスが返されます。（例：`posts/dir1/dir2/`）

[Multilingual]: /content-management/multilingual/

---
title: サイトマップテンプレート
# linktitle: Sitemap
description: Hugo には Sitemap protocol v0.9 に沿ったビルトインテンプレートが付属していますが、必要に応じてオーバーライドすることができます
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [templates]
keywords: [sitemap, xml, templates]
menu:
  docs:
    parent: "templates"
    weight: 160
weight: 160
sections_weight: 160
draft: false
aliases: [/layout/sitemap/,/templates/sitemap/]
toc: false
---

`sitemap.xml` は、1 つのサイトマップテンプレートを使って生成されます。
Hugo にはこのテンプレートファイルが付属しています。*`sitemap.xml` をカスタマイズしたいのでなければ、ユーザは特に何もする必要はありません。*

サイトマップは `Page` であるため、サイトマップ固有の変数と併せ、すべての[ページ変数][pagevars]をテンプレート内で使用することができます。

`.Sitemap.ChangeFreq`
: ページの更新頻度

`.Sitemap.Priority`
: ページの優先度

`.Sitemap.Filename`
: サイトマップのファイル名

もし `/layouts/sitemap.xml` にファイルが存在する場合、Hugo は付属の内部テンプレート `sitemap.xml` の代わりにこちらを使用します。

## サイトマップテンプレート

Hugo にはサイトマップテンプレートがビルトインされていますが、必要に応じて `layouts/sitemap.xml` もしくは `layouts/_default/sitemap.xml` のどちらかに独自のテンプレートを置くことができます。

多言語サイトの場合、サイトマップインデックスも作成します。
`layouts/sitemapindex.xml` もしくは `layouts/_default/sitemapindex.xml` のどちらかに、カスタムレイアウトを指定することができます。

## Hugoのsitemap.xml

このテンプレートは [Sitemap Protocol](http://www.sitemaps.org/protocol.html) バージョン 0.9 に沿っています。

```xml
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
  xmlns:xhtml="http://www.w3.org/1999/xhtml">
  {{ range .Data.Pages }}
  <url>
    <loc>{{ .Permalink }}</loc>{{ if not .Lastmod.IsZero }}
    <lastmod>{{ safeHTML ( .Lastmod.Format "2006-01-02T15:04:05-07:00" ) }}</lastmod>{{ end }}{{ with .Sitemap.ChangeFreq }}
    <changefreq>{{ . }}</changefreq>{{ end }}{{ if ge .Sitemap.Priority 0.0 }}
    <priority>{{ .Sitemap.Priority }}</priority>{{ end }}{{ if .IsTranslated }}{{ range .Translations }}
    <xhtml:link
                rel="alternate"
                hreflang="{{ .Lang }}"
                href="{{ .Permalink }}"
                />{{ end }}
    <xhtml:link
                rel="alternate"
                hreflang="{{ .Lang }}"
                href="{{ .Permalink }}"
                />{{ end }}
  </url>
  {{ end }}
</urlset>
```

{{% note %}}
レンダリング時、Hugo は自動的に以下のヘッダ行を追加します。
これは有効な HTML ではないため、テンプレートには含めないでください。

`<?xml version="1.0" encoding="utf-8" standalone="yes" ?>`
{{% /note %}}

## Hugoのsitemapindex.xml

これは多言語モードでサイトマップインデックスを作成するために使用されます。

```xml
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
	{{ range . }}
	<sitemap>
	   	<loc>{{ .SitemapAbsURL }}</loc>
		{{ if not .LastChange.IsZero }}
	   	<lastmod>{{ .LastChange.Format "2006-01-02T15:04:05-07:00" | safeHTML }}</lastmod>
		{{ end }}
	</sitemap>
	{{ end }}
</sitemapindex>
```

## `sitemap.xml`の設定

`<changefreq>`, `<priority>`, `filename` のデフォルト値は、サイトの設定ファイルで指定することができます。

例：
{{< code-toggle file="config" >}}
[sitemap]
  changefreq = "monthly"
  priority = 0.5
  filename = "sitemap.xml"
{{</ code-toggle >}}

コンテンツファイル内の front matter で同名フィールドを指定することで、レンダリング時にこれらの値をオーバーライドすることができます。


[pagevars]: /variables/page/

<!--
Filename:       README.md
Author:         Shiro Takeda
e-mail          <shiro.takeda@gmail.com>
First-written:  <2006/12/04>
Time-stamp:     <2022-02-05 16:43:18 st>
-->

jecon.bst
==============================

"jecon.bst"は（主に）経済学用の BibTeX スタイルファイルです。以下のような特徴があります。

* 「著者（年）」形式（author-year format) で引用できます。
*  経済学でよく利用されるような参考文献（reference）の形式を実現できます（ただし、
  特定の雑誌向けというわけではないです）。
* 英語の文献だけでなく、日本語の文献も適切に処理できます。
* 他の BibTeX 用のスタイルファイルよりも表示形式のカスタマイズが簡単にできます。


## ファイル

| ファイル                                 | 説明                                                       |
|:-----------------------------------------|:-----------------------------------------------------------|
| `jecon.bst`                              | これが bst ファイルです。                                  |
| [`jecon-example.pdf`](jecon-example.pdf) | 使い方などを書いたファイルです。まずこれを読んでください。 |
| `jecon-example.tex`                      | `jecon-example.pdf` の元の LaTeX のファイル。              |
| `jecon-example.bib`                      | 文献のファイルです。                                       |
| `jecon-example-unicode.bib`              | 文献のファイルです（ユニコード文字を含むもの）。           |
| `jecon-example-old.bib`                  | 文献のファイルです（姓名の順序が昔の形式）。               |
| [`customization`](customization)         | jecon.bst のカスタマイズの例を置いてあるフォルダです。     |
| [`CHANGES.md`](CHANGES.md)               | 変更点を説明したファイルです。                             |
| `README.md`                              | このファイルです。                                         |


## 使い方

* 使い方は [`jecon-example.pdf`](jecon-example.pdf) を読んでください。
* カスタマイズして使いたい方は [`customization`](customization) フォルダの中のファイルを参考にしてください。このフォルダには `jecon.bst` をカスタマイズしたファイルが多数含まれています。


## 注

* `jecon-example.tex` をコンパイルするときには LaTeX エンジンとして `lualatex`、BibTeX エンジンとしては `upbibtex` を使うようにしてください。（TeX Live 2020までの）古い upbibtex、あるいは pbibtex を使いたい場合は、[`jecon-example.pdf`](jecon-example.pdf) の「BibTeXエンジンの選択」という節を見てください。


* `bst.sei.mei.order`のデフォールト値を `#1` に変更しました。これは bibファイルにおいて日本語であっても「{姓,名}」という書き方で指定するということを意味します。これは最近の文献データベースや文献管理ソフトで、日本語であっても外国人と同様の扱いをしているものが多いためです。昔からの伝統的な書き方で指定したければ、`bst.sei.mei.order`に `#0`を指定してください。



<!--
--------------------
Local Variables:
mode: markdown
fill-column: 80
coding: utf-8-dos
End:
-->


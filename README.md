<!--
Filename:       README.md
Author:         Shiro Takeda
e-mail          <shiro.takeda@gmail.com>
First-written:  <2006/12/04>
Time-stamp:     <2019-01-22 14:07:33 st>
-->

jecon.bst
==============================

jecon.bst (経済学用のBibTeX style file) の私家修正版です。
本家の ver. 5.6 に準拠しています.

本家: <http://shirotakeda.org/ja/tex-ja/jecon-ja.html>

本家との違い:
* book エントリについて, 邦訳書情報, DOI の表示順だったものを逆に. 
* DOI のリンクを `dx.doi.org` から `doi.org` に変更.
* arXiv へのリンクも表示するように.
	+ bib ファイルに `eprinttype={arxiv}`, `archivePrefix={arXiv}`, `eprint={19xx.xxxx}` と書けば表示.
	+ DOI/URL の表示オプションを廃止し, 常に DOI > ArXiv > URL の優先順位で表示させるように変更.
* URL について, 長いものは見づらいのでデフォルトで短縮するように変更

## ファイル

| ファイル                                    | 説明                                                         |
|:--------------------------------------------|:-------------------------------------------------------------|
| `jecon.bst`                                 | これが bst ファイルです。                                    |
| `jecon-example.tex`                         | 使い方等の説明をしたファイルです。                           |
| [`jecon-example.pdf`](jecon-example.pdf) | `jecon-example.tex` をPDFにしたものです。                    |
| `jecon-example.bib`                         | 文献のファイルです。                                         |
| `jecon-example-old.bib`                     | 文献のファイルです。                                         |
| `unicode`                                   | ユニコード文字の利用について説明したファイルがあるフォルダ。 |
| `customization`                             | カスタマイズの例を置いてあるフォルダ。                       |
| [`CHANGES.md`](CHANGES.md)                | 変更点を説明したファイルです。                               |
| `README.md`                                 | このファイルです。                                           |

<!--
--------------------
Local Variables:
mode: markdown
fill-column: 80
coding: utf-8-dos
End:
-->


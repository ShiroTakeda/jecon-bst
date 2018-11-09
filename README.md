<!--
Filename:       README.md
Author:         Shiro Takeda
e-mail          <shiro.takeda@gmail.com>
First-written:  <2006/12/04>
Time-stamp:     <2017-02-16 18:33:03 st>
-->

jecon.bst
==============================

jecon.bst (経済学用のBibTeX style file) の私家修正版です。

本家: <http://shirotakeda.org/ja/tex-ja/jecon-ja.html>

本家との違い:
* 著者の姓名表記順を和文・欧文で統一しました.
  + 和文著者名であっても `author={姓, 名 and ...}` または `author={名 姓 and ...}` と表記する必要があります.
  + 文献管理ソフトとの連携を容易にするための変更です.
  + この設定は本家マニュアルに書いてあるように簡単に変更できます.
* DOI の表記から, `http:/dx.doi.org/` を省略しました.
  + リンクをフルで表記するのは冗長なため. また, `dx.doi.org` を `doi.org` に変更しています.

## ファイル

| ファイル                                 | 説明                                                         |
|:-----------------------------------------|:-------------------------------------------------------------|
| `jecon.bst`                              | これが bst ファイルです。                                    |
| `jecon-example.tex`                      | 使い方等の説明をしたファイルです。                           |
| [`jecon-example.pdf`](jecon-example.pdf) | `jecon-example.tex` をPDFにしたものです。                    |
| `jecon-example.bib`                      | 文献のファイルです。                                         |
| `jecon-example-reverse.bib`              | 文献のファイルです。                                         |
| `unicode`                                | ユニコード文字の利用について説明したファイルがあるフォルダ。 |
| `customization`                          | カスタマイズの例を置いてあるフォルダ。                       |
| [`CHANGES.md`](CHANGES.md)               | 変更点を説明したファイルです。                               |
| `README.md`                              | このファイルです。                                           |


<!--
--------------------
Local Variables:
mode: markdown
fill-column: 80
coding: utf-8-dos
End:
-->


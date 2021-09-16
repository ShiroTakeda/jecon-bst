<!--
Author:         Shiro Takeda
e-mail          <shiro.takeda@gmail.com>
First-written:  <2016-03-16>
Time-stamp:     <2021-09-16 10:48:07 st>
-->

このフォルダの説明
==============================

+ このフォルダには、`jecon.bst` をカスタマイズした bst ファイルが置いてあります。
+ 自分でカスタマイズしたい人は例として参考にしてください。
+ `jecon-use-pbibtex.tex` 以外の tex ファイルは全て LaTeX エンジンに lualatex、BibTeX エンジンに upbibtex を使ってコンパイルするようになっています。

## ファイル

| 利用している bst ファイル | LaTeX ファイル                                     | PDFファイル                                        | 説明                                                                  |
|:--------------------------|:---------------------------------------------------|:---------------------------------------------------|:----------------------------------------------------------------------|
| `jecon.bst`               | [`jecon-default.tex`](jecon-default.tex)           | [`jecon-default.pdf`](jecon-default.pdf)           | そのままの `jecon.bst` を利用したもの。                               |
| `jecon-a.bst`             | [`jecon-a.tex`](jecon-a.tex)                       | [`jecon-a.pdf`](jecon-a.pdf)                       | 括弧などの装飾をできるだけなくしたもの。                              |
| `jecon-b.bst`             | [`jecon-b.tex`](jecon-b.tex)                       | [`jecon-b.pdf`](jecon-b.pdf)                       | いろいろ変えてみたもの。                                              |
| `jecon-tategaki.bst`      | [`jecon-tategaki.tex`](jecon-tategaki.tex)         | [`jecon-tategaki.pdf`](jecon-tategaki.pdf)         | 数字を漢数字にして、縦書きにしたもの。                                |
| `jecon-no-sort.bst`       | [`jecon-no-sort.tex`](jecon-no-sort.tex)           | [`jecon-no-sort.pdf`](jecon-no-sort.pdf)           | 引用順にそのまま並べる形式。                                          |
| `jecon-reverse.bst`       | [`jecon-reverse.tex`](jecon-reverse.tex)           | [`jecon-reverse.pdf`](jecon-reverse.pdf)           | 日本語の著者名の姓名の順序が普通の順序のbibファイルを処理するケース。 |
| `jecon.bst`               | [`jecon-number.tex`](jecon-number.tex)             | [`jecon-number.pdf`](jecon-number.pdf)             | 「著者名（年）」ではなく、番号で引用するケース。                      |
| `jecon.bst`               | [`jecon-many-authors.tex`](jecon-many-authors.tex) | [`jecon-many-authors.pdf`](jecon-many-authors.pdf) | 著者数が非常に多いケース。                                            |
| `jecon.bst`               | [`jecon-cjk.tex`](jecon-cjk.tex)                   | [`jecon-cjk.pdf`](jecon-cjk.pdf)                   | 「源ノ角ゴシックCJK」+「源ノ明朝CJK」で日中韓の文字を混在させたもの   |
| `jecon-pbibtex.bst`       | [`jecon-use-pbibtex.tex`](jecon-use-pbibtex.tex)   | [`jecon-use-pbibtex.pdf`](jecon-use-pbibtex.pdf)   | LaTeX エンジンに platex、BibTeX エンジンに pbibtex を使うもの。       |


<!--
--------------------
Local Variables:
mode: markdown
fill-column: 90
coding: utf-8-dos
End:
-->


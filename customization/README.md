<!--
Author:         Shiro Takeda
e-mail          <shiro.takeda@gmail.com>
First-written:  <2016-03-16>
Time-stamp:     <2021-09-12 16:06:17 st>
-->

このフォルダの説明
==============================

+ このフォルダには、`jecon.bst` をカスタマイズした bst ファイルが置いてあります。
+ 自分でカスタマイズしたい人は例として参考にしてください。
+ `jecon-use-pbibtex.tex` 以外の tex ファイル以外は全て LaTex エンジンに lualatex、BibTeX エンジンに upbibtex を使ってコンパイルするようになっています。

## ファイル

| bst ファイル         | PDFファイル                                        | 説明                                                                  |
|:---------------------|:---------------------------------------------------|:----------------------------------------------------------------------|
| `jecon.bst`          | [`jecon-default.pdf`](jecon-default.pdf)           | そのままの `jecon.bst`。                                              |
| `jecon-a.bst`        | [`jecon-a.pdf`](jecon-a.pdf)                       | 括弧などの装飾をできるだけなくしたもの。                              |
| `jecon-b.bst`        | [`jecon-b.pdf`](jecon-b.pdf)                       | いろいろ変えてみたもの。                                              |
| `jecon-tategaki.bst` | [`jecon-tategaki.pdf`](jecon-tategaki.pdf)         | 数字を漢数字にして、縦書きにしたもの。                                |
| `jecon-no-sort.bst`  | [`jecon-no-sort.pdf`](jecon-no-sort.pdf)           | 引用順にそのまま並べる形式。                                          |
| `jecon-reverse.bst`  | [`jecon-reverse.pdf`](jecon-reverse.pdf)           | 日本語の著者名の姓名の順序が普通の順序のbibファイルを処理するケース。 |
|                      | [`jecon-number.pdf`](jecon-number.pdf)             | 「著者名（年）」ではなく、番号で引用するケース。                      |
|                      | [`jecon-many-authors.pdf`](jecon-many-authors.pdf) | 著者数が非常に多いケース                                              |
|                      | [`jecon-cjk.pdf`](jecon-cjk.pdf)                   | 「源ノ角ゴシックCJK」+「源ノ明朝CJK」で日中韓の文字の混在             |
|                      | [`jecon-use-pbibtex.pdf`](jecon-use-pbibtex.pdf)   | LaTex エンジンに platex、BibTeX エンジンに pbibtex を使うもの         |



<!--
--------------------
Local Variables:
mode: markdown
fill-column: 90
coding: utf-8-dos
End:
-->


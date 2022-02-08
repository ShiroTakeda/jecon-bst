<!--
Filename:       CHANGES.txt
Author:         Shiro Takeda
e-mail          <shiro.takeda@gmail.com>
First-written:  <2006/12/04>
Time-stamp:     <2022-02-08 22:50:10 st>
-->

jecon.bst の変更履歴．
==============================

## 変更点（上が新しい）

## Ver. 6.5.1

* `bst.sei.mei.one.jp`、`bst.sei.mei.two.jp` に関連するバグを修正。



## Ver. 6.5

* 2022-02-04: 文献ソートのバグを修正。



## Ver. 6.4

* 2021-09-16: bib ファイルで yomi フィールドを指定すると、並べ替えの際に author
  や editor ではなく、yomi の値を用いる設定になっているが、yomi ではなく、
  sortname フィールドでも同じように動作するように変更。
  
  sortname フィールドは biblatex で並べ替えに利用されるフィールド。biblatex とデー
  タベースを共通化しやすいように、この変更を加えた。
  
* 2021-09-18: bib ファイルを少し修正。

* 2021-09-18: jecon-example.tex の説明を少し修正。


## Ver. 6.3

* 2021-09-12: jecon-exapmle.tex をコンパイルする際に、LaTeX のエンジンとして
  lualatex、BibTeX エンジンとして upbibtex を使うように修正。
  
  ただし、これは platex や pbibtex は使えないということではないです（プリアンプ
  ルなどを書き換えれば (u)platex、xelatex などでもコンパイル可能です）
  
  同時にサンプルの文献としてユニコード文字を含んだ文献を含めるようにした。クラス
  ファイルには jlreq を利用しています。
  
* 2021-09-12: jecon.bst も upbibtex を利用するという前提に修正。

  ただし、（TeX Live 2020までの）古い upbibtex、あるいは pbibtex を使うための設
  定として `bst.pbibtex.version` という関数を追加した。古い upbibtex、あるいは
  pbibtex を利用したいときには、`jecon-exapmle.pdf` の「BibTeXエンジンの選択」と
  いう節を参照。これに伴ない`bst.use.unicode` は除去。
  
  platex + pbibtex を使うサンプル（jecon-use-pbibtex.tex）を customize フォルダ
  に追加。
  
* 2021-09-12: 以上の変更に伴ないこれまでユニコード文字を使うための説明を含んでい
  た unicode フォルダを除去した。代わりに customize フォルダに `jecon-cjk.tex`
  というサンプルを追加。これは日本語、中国語、韓国語の文献を混在させたケース。
  
* 2021-09-12: customize フォルダの中のファイルも上の変更に合せてアップデート。

* 2021-09-12: bib ファイルの language フィールドを langid フィールドに修正。これ
  は biblatex の指定に合わせるため。その値も日本語の場合 ja から japanese に変更。
  ただし、そもそも langid フィールドの指定は特殊なケースを除いては必要はなし。



## Ver. 6.2.1

* 2021-01-23: クラスファイルの変更。jlreq や jsarticle に変更。

* 2021-01-23: 英語文献に翻訳書情報を付ける際のバグを修正。


## Ver. 6.2

* 2020-11-15: ユニコード文字用の修正。日本語、中国語、韓国語を同時に利用している
  サンプルのファイル "jecon-unicode-lualatex-cjk.tex" を unicode フォルダに追加。
  それにともない、"multi-lang.bib"と"jecon-unicode-lualatex-cjk.pdf"も追加。

* 2020-11-01: month の指定では省略形（jan, febなど）が利用できるが、その指定は

  month = jan
  
  のような形式で、"" や {} で囲んではいけないことになっていた。これを
  
  month = "jan"
  
  のように指定されていても、Janurary に変換するように修正した。
  
  


## Ver. 6.1

* 2020-07-10: 邦訳書情報のノート用のフィールド `jnote` を追加。また、邦訳書情報
  を最後に持ってくるように位置を修正。詳しくは `jecon-example.pdf` の「邦訳書の
  情報も付ける場合」という節を見てください。


## Ver. 6.0

* 2020-06-23: 著者数が非常に多いときの処理の変更。

  研究分野によっては、著者数が非常に多い場合がある。そのような場合、参考文献部分
  に全ての著者を表示することはできないので、jecon.bst では以下のような処理をおこ
  なうように修正した。
       
  「N1 人以上の著者がいる場合には、参考文献部分において最初の N2 人の著者名のみ
  表示し、残りは「et al.」や「他」で省略する」
       
   N1 の値は `bst.max.author.num` で設定（デフォールト値は 8）、N2 は
   `bst.max.author.num.display` で設定（デフォールト値は 3）。
   
   詳しくは jecon-example.pdf の「著者数が非常に多いケース」の節、また、
   customize フォルダの jecon-many-authors.tex を参照。

* 2020-03-29: 「編」や「ed.」が出ないというバグの修正。

* 2020-03-04: カスタマイズのサンプルの jecon-number.tex を追加。「著者（年）」で
  はなく、番号での引用をおこなっている例。これは natbib package のオプションによ
  り実現するもの。

* 2020-01-31: natbib.sty を読み込んでいないときに警告を出すように修正。

* 2019-10-14: customization/README.md の修正。

* 2019-10-14: README.md の説明を修正。

* 2019-10-14: customization フォルダから jecon-jet.bst は削除。

* 2019-10-14: 目次に参考文献が表示されるように修正。

* 2019-10-14: DOI に TeX の制御文字が含まれるとエラーになる問題への対処。

* 2019-08-06: Book で DOI が連続して2回表示されるバグを修正。

* 2019-02-06: incolletion タイプで、巻、版、章、ページ数の情報を出版社の情報の前に変更。

* 2019-01-22: ライセンスの変更。ライセンスを「the LaTeX Project Public License」
  に変更しました。
  
* 2019-01-22: `bst.dashify.off` のデフォールトの設定を `#0` に変更。つまり、page
  番号における "-" を "--" に修正するという動作をデフォールトに。


## Ver. 5.5.1

* タイポの修正


## Ver. 5.5

* `bst.doi.pre`と`bst.doi.pre.jp`の定義を少し変更。

* `bst.sei.mei.order`のデフォールト値を `#1` に変更。つまり、bibファイルでは日本
  人であっても「{姓,名}」という書き方で指定するということ。これは最近の文献デー
  タベースや文献管理ソフトで、日本人であっても外国人と同様の扱いをしているものが
  多いため。昔からの伝統的な書き方で指定したければ、`bst.sei.mei.order`に `#0`
  を指定すればよい。
  
 * `bst.url.doi` のデフォールト値を `#2` に変更。DOI と URLの両方があるときには、
   DOIのみを表示するという設定。


## Ver. 5.4 (2017-11-13)

* `jecon.bst` では upbibtex の利用により unicode 文字も扱える（詳しくは
  `jecon-unicode-xelatex.pdf`）。しかし、pbibtex と upbibtex における
  `$substring` 命令の動作の違いにより、upbibtex を利用した場合適切に処理できない
  ケースがあった。このバグを修正した（つもり）。


## Ver. 5.3.1 (2017-07-08)

* `bst.doi.pre.jp` と `bst.doi.post.jp` の指定が効果を持っていなかったバグを修正。


## Ver. 5.3 (2017-07-01)

* URL フィールドと DOI フィールドの両方があるときの表示方法の選択をできるように
  修正。`bst.url.doi` という関数の値によって表示を変更する。

  + #0 -> URL と DOI の両方を表示
  + #1 -> URL のみ表示
  + #2 -> DOI のみ表示

  `bst.url.doi` がどのような値でも `bst.show.doi` や `bst.show.url` が #0 なら
  DOI や URL は表示されないです。

* 巻（volume）がなくて、号（number）があるという文献でも、上手く処理できるように
  修正。


## Ver. 5.2 (2017-02-16)

* ファイル名に underscore (_) があると不具合が生じるケースがあるので、underscore
  を全てハイフン (-) の置き換えた。
  
* `jecon_unicode_xelatex.tex` に説明を追加。


## Ver. 5.1.1 (2016-09-22)

* `\it` 命令を `\textit` に変更。`\it` 命令は使わない方がよいみたいなので。

* unpulished タイプのバグを修正。

* `jecon_unicode_xelatex.tex` に説明を追加。


## Ver. 5.1 (2016-03-26)

* コードの整形・整理と [jecon_example.pdf](jecon_example.pdf) の修正だけです。機
  能の変更はないです。


## Ver. 5.0 (2016-03-02)

* 翻訳者を指定する translator フィールドと監訳者を指定する kanyaku フィールドを
  追加。

  author フィールドと同様に指定します。翻訳者と監訳者を分ける必要がなければ、ど
  ちらも translator に入れておけばよいと思います。一緒に `bst.translator.pre.jp`
  等の関数も追加。

  似たようなフィールドで jauthor や jkanyaku 等がありますが、translator や
  kanyaku は邦訳書の場合に翻訳者、監訳者を入れることを念頭に置いてます。原著とは
  別に邦訳書を独立した文献として登録する場合です。jauthor や jkanyaku は英語の文
  献の情報に邦訳書の情報もおまけでつけるときに使います。

* ユニコード文字の利用に対応しました。利用方法は `jecon_unicode_xelatex.pdf` とい
  うファイルで説明しています。

* 文献ファイルでユニコード文字を利用しても適切に処理できるように修正。詳しい方法
  については「`jecon_unicode_xelatex.pdf`」を読んでください。

* カスタマイズ例の `jecon_number.pdf` を削除。番号での引用は代わりに
  `jecon_jet.pdf`で使うようにしました。

* これまでファイルの文字コードを Shift JIS にしているファイルも含めていましたが、
  もう止めました。UTF-8 の文字コードのものだけ配布します。

* 例として付けているファイルの名前を変更。


## Ver. 4.0.1 (2016-02-16)

* 日本語の文献であるが、著者名がアルファベットの文献の場合に、著者名が適切に処理
  されないバグを修正。



## Ver. 4.0 (2016-02-3)

* `bst.year.backward` という関数を廃止し、`bst.year.position` を新たに追加。
  この関数で year を表示する場所を細かく指定できます。
 
  0 ->  year は author のすぐ後に表示されます。  
  非ゼロ -> article タイプ以外では year は 最後（note フィールドの前）に表示されます。

  Article タイプのエントリーでは次のように変わります。

  + #1 -> year は最後に表示されます。
  + #2 -> year は journal name の後に表示されます。
  + #3 -> year は volume の後に表示されます。

* `bst.bysame.definition.jp` という関数を追加。これは日本語文献用の
  \bysame（\bysamejpという名前のコマンド）の定義をする関数。英語用と同じでもいい
  のですが、英語用の定義から少し変更してあります。

* \bysame による著者名の省略に新しいスタイルを追加。

  例えば、次の3つの文献があるとします。

  Mazda, A., Subaru, B., and Honda, C., (2011) "ABC"  
  Mazda, A., Subaru, B., and Honda, C., (2011) "DEF"  
  Mazda, A., Subaru, B., and Toyota, D., (2011) "GHI"

  これまでの `jecon.bst` では `bst.use.bysame` に非ゼロを設定しておくことで、こ
  れらの文献は以下のように表示されました。

  [スタイル1]  
  Mazda, A., Subaru, B., and Honda, C., (2011) "ABC"  
  ----, (2011) "DEF"  
  Mazda, A., Subaru, B., and Toyota, D., (2011) "GHI"

  つまり、\bysame による著者名の省略は著者名が完全に一致するときのみ行なわれます。

  新しい `jecon.bst` では次のようなスタイルも選べます。

  [スタイル2]  
  Mazda, A., Subaru, B., Honda, C., (2011) "ABC"  
  ----, ----, and ----, (2011) "DEF"  
  ----, ----, and Toyota, D., (2011) "GHI"

  つまり、著者名の一部だけが同じという場合でも \bysame による省略が適用されるス
  タイルです（これは jecon_b.pdf で利用されています）。

  新しい `jecon.bst` では関数 `bst.use.bysame` の設定として次の3つを選択可能。

  + #0: これは bysame 命令を利用しないケース（著者名の省略は全くなし）
  + #1: スタイル1のような省略方法 (これがデフォールト)
  + #2: スタイル2のような省略方法

  詳しくは `jecon_example.pdf` の「著者名の省略方法の変更」の部分を見てください。

* サンプルのファイルに `jecon_jet.bst` を追加。これは JET (Journal of Ecnomic
  Theory) のようなスタイル。


## Ver. 3.2 (2015-01-24)

* authorフィールド等で"and others"を利用したときのバグを修正。

* `bst.url.pre`, `bst.url.post`, `bst.url.pre.jp`, `bst.url.post.jp`のデフォール
  トの指定を修正。

  
## Ver. 3.1 (2014-01-27)

* `bst.sei.mei.order`という関数を追加（デフォールトでは0を指定）。普通のbibファイ
  ルでは日本人名を記述するとき外国人名と姓名の順序を逆にする。例えば、authorが
  Barack Obamaなら

        author = {Obama, Barack}
        author = {Barack Obama}

  のどちらかで指定するのに対し、日本人名のときは

        author = {晋三, 安倍}
        author = {安倍 晋三}

  という指定をする。`bst.sei.mei.order`に非ゼロを指定すると、日本人名も外国人名と
  同じ姓名の順序、つまり

        author = {安倍, 晋三}
        author = {晋三 安倍}

  と指定されているものとして処理をする。

  mendeleyのような文献管理ソフトを通じてbibファイルを生成しているときには、日本
  人名も外国人名と同様に扱われる場合が多い。そのようなときには
  `bst.sei.mei.order`に非ゼロを指定することで正常に処理をする。これはauthor,
  editor, yomi, jauthor, jkanyakuフィールドにおける日本人名の指定に適用されます。
  詳しいことは`jecon_example.pdf`の「bibファイルにおける日本語での人名の書き方」の
  節を参照してください。


## Ver. 3.0 (2013-07-09)

* URLフィールドに対応。新しい `jecon.bst` では URL フィールドで指定した URL が表示
  されます。関数 `bst.show.url` に非ゼロを指定すると表示、ゼロを指定すると非表示
  になります（デフォールトは表示です）。URLフィールドはnoteフィールドの前に表示
  されます。

* `bst.url.pre` と `bst.url.post` という関数を追加。これには URL フィールドの前
  と後に付ける文字列を指定します。同様に `bst.url.pre.jp` と `bst.url.post.jp`を
  追加。こちらは日本語文献用です。

* accessフィールドに対応。URLにアクセスした日付を指定するaccessフィールドに対応。
  このaccessフィールドは普通のbibファイルにはないフィールドです（`jecon.bst`でのみ
  有効）。accessフィールドに指定した日付がURLフィールドの後に表示されます。

* accessフィールドの対応に合わせて `bst.access.pre`、`bst.access.post`、
  `bst.access.pre.jp`、`bst.access.post.jp` という関数を追加。accessフィールドの
  前と後に付ける文字列を指定します。jp付きは日本語文献用。

* 例えば、bibファイルで次のように指定していたとします。

        url          = {http://shirotakeda.org/en/tex/econ-bst.html},
        access       = {4th July, 2013}

  デフォールトでは、この指定によって、次のような表示になります。

      URL: http://shirotakeda.org/en/tex/econ-bst.html, accessed on 4th July, 2013.
  
* DOIフィールドに対応。DOIフィールドとは DOI (degital object identifier) を指定
  しておくフィールド。これは普通の bib ファイルにはないフィールド。
  これに合わせて、`bst.show.doi` という関数を追加。非ゼロを設定すると DOI を表
  示、ゼロを設定すると非表示。

* `bst.doi.pre`、`bst.doi.post`、`bst.doi.pre.jp`、`bst.doi.post.jp`を追加。これ
  はDOIフィールドの前と後に付ける文字列を指定。jp付きは日本語文献用。

* `bst.post.note` と `bst.post.note.jp` を追加。これはnoteフィールドの後に付ける
  文字列を指定。

* 新しい文献のタイプ "online" を追加。これはウェブページ等を登録するためのタイプ。
  普通のbibファイルにはない。ただし、表示の設定についてはmiscタイプと今のところ
  全く同じ。
  

## Ver. 2.7 (2009-12-18)

* ソートのルールを変更

  これまでのルールでは，文献ソートのキーとしてまず full author name を利用していた．
  例えば，

  Hatoyama, Fukuda, Abe (2009) "apple"  
  Hatoyama, Aso, Fukuda, Abe (2007) "orange."  
  Hatoyama, Abe, Fukuda, Koizumi (2009) "grape."

  というような文献があった場合，full author が第一のキーとして利用されるため

  Hatoyama, Abe, Fukuda, Koizumi (2009) "grape."  
  Hatoyama, Aso, Fukuda, Abe (2007) "orange."  
  Hatoyama, Fukuda, Abe (2009) "apple."

  という順番になった (First author は同じ，Second author では Fukuda より
  Aso，Aso より Abe が優先)． 

  新しいルールで は，full author ではなく abbreviated author name を利用する．つ
  まり， 

  Hatoyama et al. (2009) "apple."  
  Hatoyama et al. (2007) "orange."  
  Hatoyama et al. (2009) "grape."

  と解釈して並びかえる．よって，著者は同じとなり，年，タイトルで順番が決まるので

  Hatoyama, Aso, Fukuda, Abe (2007) "orange."  
  Hatoyama, Fukuda, Abe (2009) "apple."  
  Hatoyama, Abe, Fukuda, Koizumi (2009) "grape."

  という順番になる．


* 同じ年の文献に対するアルファベットのインデックスの付け方．

  これまでのルールでは，全ての著者が同じ場合にのみ同じ著者による文献と認識するよ
  うにしていた．例えば，

  Hatoyama, Abe, Fukuda, Koizumi (2009) "grape."  
  Hatoyama, Fukuda, Abe (2009) "apple."

  は違う著者による文献と認識していた．このため 2009 には a, b 等のアルファベッ
  トのインデックスが付かない．しかし，これでは引用部分で省略形を利用した場合，ど
  ちらの文献も Hatoyama et al. (2009) となり区別できなくなってしまう．

  これを避けるため新しいルールでは，3 人以上著者がいる文献では first author が一
  緒なら同じ著者とみなし，同じ年の文献にアルファベットのインデックスを付けるよう
  に変更．上の例では

  Hatoyama, Fukuda, Abe (2009a) "apple."  
  Hatoyama, Abe, Fukuda, Koizumi (2009b) "grape."

  となる．これにより引用部分で省略形を用いても区別できるようになった．


* bst.hide.title という関数を追加。title を表示するか否か。隠す(表示しない) なら
  0 以外、隠さない(表示する)なら 0 を指定。



## Ver. 2.6.2 (2009-06-23)

* ソートの順番がおかしいバグを修正．

* perod & comma が重複する際の処理のバグを修正．



## Ver. 2.6.1 (2009-06-07)

* 日本語文献の author，editor で姓・名の両方の指定がないもの (姓のみ，あるいは「総務
  省」，「財務省」等の形式) が，引用部分で表示されないバグを修正．これは ver. 2.6 で入っ
  たバグ．

* 利用していない or 必要ないコード (関数等) を除去。



## Ver. 2.6 (2008-12-22)

* ピリオド "." やカンマ "," が連続してしまうようなときには、二つ目のピリオ
  ド、カンマを表示しないように修正。これまでの `jecon.bst` では区切文字にピ
  リオドとカンマを併用することで問題が生じる場合 (ピリオド、カンマがかぶる
  等) があったが、この修正により併用しても上手く表示されるようになっていま
  す (詳しくは `jecon_example.pdf` の「区切り文字 (ピリオド、カンマ) について」
  の項を参照してください)。

* bst.and.others.num という関数を追加。何人以上の著者がいるときに引用部分
  で et al.で省略するかを指定。デフォールトでは、3人以上のときに略す (つま
  り、#3 を指定)。

  
## Ver. 2.5 (2008-10-09)

* bst.hide.number という関数を追加。0 以外を指定すると number filed を隠す
  (表示しない)。

  
## Ver. 2.4 (2008-08-03)

* bst.sort.year を追加。非ゼロを指定しておくと、まず year をキーにソートす
  るようになる。詳しくは `jecon_example.pdf` を参照。

* ファイルの文字コードを全てutf-8に変更した。コンパイルするには platex も
  jbibtex も "--kanji=utf8" オプション付きで実行する必要がある。

        platex --kanji=utf8 jecon_example.tex
        jbibtex --kanji=utf8 jecon_example.aux

  Winshellを使っている人はコマンドラインのオプションに --kanji=utf8 に加え
  れば、utf-8モードになります。

  utf-8 に対応していない古いTeXシステムでコンパイルしたい、あるいは対応は
  しているがこれまで通り Shif-JIS でコンパイルしたいという場合には、すべて
  のファイルの文字コードを Shif-JIS に変換してやればよい。
  
  Windowsでutf-8のファイルをShift-JISに変換するには、一度メモ帳でファイル
  を開き、Shift-JISで保存しなおせばよい。


## Ver. 2.3 (Sat Jan 29 2008)

* incollection で指定される editor (book の editor) についても
  bst.author.name の設定 (姓名の順序の設定) が反映されるように修正．

* bst.kuten.jp と bst.touten.jp を追加．句点と読点を指定する．デフォールト
  はそれぞれ "．" と "，" としてある．"。" や "、" に変更したい人はこれを
  変更する．

* bst.and.others と bst.and.others.jp を追加．三人以上の著者がいるときの略
  仕方を指定 (citeするときに利用されるもの．デフォールトはそれぞれ 
  "et~al." と "他")．

* bst.dashify.off を追加．0 以外を指定すれば，page を繋ぐ "-" を "--" に変更しない．

* bst.harvarditem.off を追加．0 以外を指定すれば，\harvarditem を出力しな
  い．

* bst.thebibliography.begin と bst.thebibliography.end を追加．
  thebibliography 環境の文字列を指定．


## Ver. 2.2 (Wed Nov 07 2007)

* bst.cite.and, bst.cite.ands, bst.cite.and.jp という関数を追加．「引用部
  分」での author 名の間に入る文字列を指定．


## Ver. 2.1 (Wed Dec 27, 2006)

* bst.no.sort という関数を追加．0 以外を指定すると引用された順番のまま参考
  文献を作成する．

* bst.sort.entry.type という関数を追加．0 以外を指定すると文献をタイプ別に
  分けて列挙する．これは absorder よりも優先．

* absorder と order と month フィールドの最大値を 99 から 999 に変更．

* bst.kansuji.jp という関数を追加．0 以外を指定すると日本語文献に含まれる
  数字を漢数字に変換する． 

* bst.tatebo.definition という関数を追加．bst.kansuji.jp が非ゼロのときに，
  pages でのページ数とページ数を結ぶ線の定義を指定する．pages = "100-200" と
  指定しているときに，"-" に置き換わる線の定義． 

* bst.year.backward という関数を追加．0 以外を指定すると「年」の表示位置を
  後方へ移動する． 

* bst.hoyakusho.pre.jp と bst.hoyakusho.post.jp を追加．

* 邦訳書で author 名が「Alphabet ＋ 姓」の文献も bst.author.name の値によっ
  て姓・名の順序が変わるように修正． 


## Ver. 2.0 (Sun Oct  1, 2006)

* 文献ソートのキーを修正。

       absorder -> author, editor, or yomi -> year -> order -> month -> title

  の順番で判断。

  absorder と order は `jecon.bst` 独自のフィールド。0-99 の値を指定できる。詳しい
  ことは `jecon_example.pdf` を参照。

* bst.notuse.absorder.field という関数を加える。これにゼロ以外の値を設定して置け
  ば、並べ替えの際に absorder field の値を利用しない。

* bst.notuse.order.field という関数を加える。これにゼロ以外の値を設定して置けば、
  並べ替えの際に order field の値を利用しない。

* bst.mixed.order という関数を追加。同じ年に同じ著者の英語、日本語文献の両方があ
  り、かつ日本語文献の yomi に英語文献の著者と同じものが指定してあるときに、両者
  を混ぜて表示するためのオプション。

* bst.hide.month という関数を追加。month を表示するか否か。隠す(表示しない) なら
  0 以外、隠さない(表示する)なら 0 を指定。隠す場合でも month フィールドの値は並
  べ替えのキーとしては利用される。

* bst.use.number.index という関数を追加。これの値に 0 以外を指定すると、
  reference 部分で `plain.bst` のように文献の前に番号を付けることができる(引用部
  分は変わらない)。

* bst.number.index.pre と bst.number.index.post という関数を追加。number indexの
  前と後にはいる文字列を指定する。

* bst.number.index.digit という関数を追加。number index の最大の桁を指定。とりあ
  えず 3 を指定して置けばよい。

* bst.sei.mei.one.jp という関数を追加。これは日本語文献での著者 (author, editor)
  の姓・名の間に入れる文字列を指定。ただし、姓・名のどちらか一方が一文字のもの。

* bst.sei.mei.two.jp という関数を追加。これは日本語文献での著者 (author, editor)
  の姓・名の間に入れる文字列を指定。ただし、姓・名のどちらも二文字以上のもの。

* bst.reverse.year という関数を追加。0 以外を指定すると新しい年の文献を前
  にもってくる。0 なら普通の並び順。 

* bst.bysame.definition という関数を追加。この中身に \bysame の定義を指定する。

## Ver. 1.15 (Sat Jan 28, 2006)

Reference での並び順を変更。

* Krugman, Paul R. と Krugman, Paul R. and Obstfeld, Maurice という著者の二つの文
  献があったとき、これまでは reference で前者(単著)のほうが後者(共著)よりも後ろに
  表示されていたが、これを逆になるようにした。


## Ver. 1.14 (Fri Dec  2, 2005)

* bst.title.lower.case という関数を加える。これの値を 0 以外にすると、title の先
  頭文字以外を小文字に変換する (book の tile は除く。元々小文字ならなにも変わらな
  い)。


## Ver. 1.13 (Sun Nov  6, 2005)

* bst.author.name というカスタマイズ用関数を加える。これの値を変えることで、
  author name での「姓」「名」の順序を入れかえれる。

* bst.first.name.initial というカスタマイズ用関数を加える。これの値を変えることで、
  first name をイニシャルだけに略せる。

## Ver. 1.12 (Wed Aug 24, 2005)

* bst.year.pre.jp と bst.year.post.jp の指定が反映されないというバグを修正。

* crossref エントリーを無視するように修正。

* コメント加える。


## Ver. 1.11 (Mon Mar 28, 2005)

* "P. A. サミュエルソン" のような「alphabet(名の頭文字) + 姓」の author も適切に
  処理するようにした。

* その他、細かいバグを直す。


## Ver. 1.10 (Fri Dec 10, 2004)

* alphabet で yomi を記入しているケースで文献の順序がおかしくなるバグを修正する。 


## Ver. 1.9 (Thu Oct  7, 2004)

* jauthor, jkanyaku のバグを直す。


## Ver. 1.8 (Thu Sep  2, 2004)

* バグをとる。

* \bysame を使うかどうか選択できるようにする。


## Ver. 1.7 (Tue Aug 31, 2004)

* バグをとる。

* カスタマイズしやすいように修正 → bst.xxx.yyy という形式の関数をたくさん導入。


## Sun Jul  4, 2004

* Referrence で同じ著者が続く場合には、名前を --- で省略するという形式に変更。こ
  れには樋口耕一さんによる `nissya.bst` を参考にさせていただきました。


## Sat Jun 26, 2004

* inproceedings でもページ数が出るように修正。

* その他細かい部分を修正。


## Tue Jan 14, 2003

* 「、」を「，」に変えた．


## Fri Nov 15, 2002

* 誤植直した．

* 「版」の後に「、」が入るのを消した．

* 3 人以上の著者がいる文献を全員の名前を挙げて引用できるようにした．


<!--
--------------------
Local Variables:
mode: markdown
fill-column: 80
coding: utf-8-dos
End:
-->


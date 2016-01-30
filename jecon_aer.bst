% jecon.bst: 経済学用 BibTeX style file.
%
% First-written:       <2002/11/03>
% Time-stamp:	       <2015-01-23 00:17:37 st>
% Version 3.2
%
% これは，飯田修さんによって作成された jpolisci.bst を経済学用に
% 武田史郎が改変したものです．
% 改変には
%
% aer.bst, jfm.bst, jplain.bst
% 萩平哲さんによる <http://www.med.osaka-u.ac.jp/pub/anes/www/latex/bibtex.html>
% 樋口耕一さんによる nissya.bst <http://koichi.nihon.to/psnl/>
%
% 等を参考にさせていただきました。これらの有益なプログラム、ページを作成してくだ
% さった方々に感謝します。
%
% 元の jpolisci.bst の著作権は飯田さんにあります．わたしが改変した部分の著作権は
% どうでもいいです．好きなように扱ってください．
%
% オリジナルの jpolisci.bst は，<http://www.bol.ucla.edu/~oiida/jpolisci/> で入手
% することができます．(注：2006年現在ではもうこのページは存在しないようです．どこ
% で入手できるかはわかりません)．
%
% コメント，要望は武田史郎まで．
%
% 変更履歴 (Changelog) は CHANGES.txt ファイルを見てください．

% version 指定
FUNCTION {jecon.version} { "3.2" }

% Debug mode．0 以外を指定すると様々な情報を表示させることが可能．
FUNCTION {jecon.debug}
{ #0 }    % Debug mode off.
% { #1 }    % Debug mode on.


%
% 以下は元の jpolisci.bst のヘッダー部分です．
%
%%%%%% ここから Original header.
%
% JPOLISCI: a bibliography style for papers in political sicence
%           and other fields that cite Japanese literature.
%           Vertical writing (tate-gaki) compatible.

	% Version 20000910 for JBibTeX versions 0.30 or later,
        % and pLaTeX2e or later.
	% Copyright (C) 2000, all rights reserved.
	%
	% This file was derived from jbtxbst.doc.
	%
	% Copying of this file is authorized only if either
	% (1) you make absolutely no changes to your copy, including name, or
	% (2) if you do make changes, you name it something other than
	% jbtxbst.doc, jplain.bst, junsrt.bst, jalpha.bst, jabbrv.bst,
	% tipsj.bst, jipsj.bst, tieice.bst, jname.bst, jorsj.bst, jglsj.bst,
        % seg.bst, jpolisci.bst.
	%
	% This restriction helps ensure that all standard styles are identical.
	% The file jbtxbst.doc has the documentation for this style.
	%

        % Author:
        %
        % 飯田修 Osamu Iida
        % email: oiida@newmail.net
        % URL  : http://www.bol.ucla.edu/~oiida/jpolisci/ (in Japanese)
        %
        % Bug reports, technical suggestions and any other comments
        % will be appreciated.
        % 

        % Acknowledgement:
        %
        % The following files were referred to while creating this file:
        %
        %   jglsj.bst  (by 千葉智章 Tomoaki Chiba)
        %     Function "format.lab.name" in jpolisci.bst derived from
        %     it with small modifications only. The author appreciates it.
        %
        %   seg.bst (by Martin Karrenbach)
        %     A method for making two sorts of labels is based on this
        %     file's feats.
        %
        %   jalpha.bst (by 松井正一 Shoichi Matsui)
        %     jpolisci.bst principally owes its functionality to it.
        %
        %   藤田眞作『続 LaTeX2e 階梯・縦組編』（アジソン・ウェスレイ、1998 年）。
        %
        % Friends in BBSes at IR-web <http://pws.prserv.net/oi/ -- now
        % obsolete> and KH's Web Site <http://home.att.ne.jp/wind/polisci/>
        % gave me titles of Japanese political science journals which are
        % included in MACROs.

        % This file is distributed with absolutely no warranty.
        % The author doesn't assume any kind of responsibility for
        % any inconvenience caused by using this file.

        % Last modified: 2000/12/05

%%%%%% Original header ここまで。
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	用語

%% 「エントリー」：一つの文献のこと．エントリーのタイプとは article，book 等の
%% 文献の種類のこと．

%% 「フィールド」：エントリー内で指定されている title, author, year 等のこと．

%% 「キーワード」：\cite命令の引数となる各エントリーに指定されている文字列のこ
%% と．

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	カスタマイズのための関数
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \bysame を使うか否か。使わないなら 0、使うなら 0 以外を指定 (bst ファイ
% ルでは整数を表すとき数字に # を付ける)。
% \bysame とは、参考文献部分同じ著者名が連続するときに --- で省略するもの。
%
FUNCTION {bst.use.bysame}
% { #0 } % Not use \bysame
{ #1 } 	% #0 以外 -> Use \bysame

% \bysame の定義。\bysame を使ったときの横棒の形式を変えるには以下の定義を修正
% する。
%
FUNCTION {bst.bysame.definition}
{ "\hskip.3em \leavevmode\rule[.5ex]{3em}{.3pt}\hskip0.5em" } 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Economics の reference では, first author 名は「姓, 名」の順番で表記し、
% second author 以下は「名 姓」とするという場合が多いが、これを変更するための関数。
% Editor にも適用。日本語文献は関係なし。
%
FUNCTION {bst.author.name}
{ #0 }	% #0 か #1 か #2 を選択可。
% { #1 }
% { #2 }

% [#0 のケース] これ普通の経済学風。
% Fujita, Masahisa, Paul R. Krugman, and Anthony J. Venables. 

% [#1 のケース] 全員「姓, 名」のケース。
% Fujita, Masahisa, Krugman, Paul R., and Venables, Anthony J.

% [#2 のケース] 全員「名 姓」のケース。
% Masahisa Fujita, Paul R. Krugman, and Anthony J. Venables.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Author (editor) 名の first name を頭文字だけに略す。
%
FUNCTION {bst.first.name.initial}
{ #0 }	% #0 -> 略さない。
% { #1 }	% #0 以外 -> first name を頭文字に略す。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Title の先頭文字以外を小文字に変換する (book の tile は除く。元々小文
% 字ならなにも変わらない)。
%
FUNCTION {bst.title.lower.case}
{ #0 }	% #0 なら小文字に変換しない (そのまま)
% { #1 }	% #0 以外なら、小文字に変換する。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 同じ年に同じ著者の英語、日本語文献の両方があり、かつ日本語文献の yomi
% に英語文献の著者と同じものが指定してあるときに、両者を混ぜて表示するた
% めのオプション。
% yomiを日本語で書いているなら関係なし．
FUNCTION {bst.mixed.order}
{ #0 } % #0 -> 混ぜない．普通はこちら．
% { #1 } 		% #0 以外 -> 混ぜる。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% month を表示するか否か。隠す(表示しない)なら 0 以外、隠さない(表示する)なら 
% 0 を指定。隠す場合でも month フィールドの値は並べ替えのキーとしては利用され
% る。これも普通は変更しない．
FUNCTION {bst.hide.month}
{ #0 } % #0 -> 表示する．普通はこちら．
% { #1 } 	% #0 以外 -> 隠す (表示しない)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% number filed を表示するか否か。隠す(表示しない)なら 0 以外、隠さない(表示す
% る)なら 0 を指定。これも普通は変更しない．
FUNCTION {bst.hide.number}
{ #0 } % #0 -> 表示する．普通はこちら．
% { #1 } 	% #0 以外 -> 隠す (表示しない)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% これの値に 0 以外を指定すると、reference 部分で plain.bst のように文献
% の前に number index ([1]のようなもの)を付けることができる (引用部分は
% author-yearで変わらない)。
%
FUNCTION {bst.use.number.index}
{ #0 } % Not use number index
% { #1 } 	% #0 以外 -> Use number index

% number index の前に付ける文字列 (bst.use.number.indexに0以外を指定していると
% きのみ有効)．
%
FUNCTION {bst.number.index.pre}
{ "[" }

% number index の後に付ける文字列。 \hskip1.0em は空白の大きさ。空白の長さは自
% 分で調整したほうがよい。 (bst.use.number.indexに0以外を指定しているときのみ
% 有効)．
FUNCTION {bst.number.index.post}
{ "]\hskip1.0em " }

% number index の最大の桁数 (文献が100個以上なら3、100個より少ないなら2、10個よ
% り少なければ1を指定)。とりあえず 3 を指定しておけば問題ないが、3 だとインデン
% トが大き目になる。値は 1, 2, 3 のどれかを指定．
%
FUNCTION {bst.number.index.digit}
{ "3" }

% 以下は、number index を表示するときに見た目を調整するための関数。computer
% modern 以外のフォントを使用するようなときは要調整。
%
% Reference 部分の文献の2行目以降のインデント幅の値を指定．
%
% bst.number.index.digit の値によってインデント幅は変わるので，それぞれのケース
% について指定する．
%
% bst.number.index.digit = 1 のときの設定
FUNCTION {bst.number.index.bibhang.one}
{ "2.05em" }
% bst.number.index.digit = 2 のときの設定
FUNCTION {bst.number.index.bibhang.ten}
{ "2.55em" }
% bst.number.index.digit = 3 のときの設定
FUNCTION {bst.number.index.bibhang.hund}
{ "3.05em" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% year の表示位置を変更。
%
% 0 なら author のすぐ後に year を表示。0 以外なら year は後ろにもってくる。後
% ろとは note フィールドがなければ一番最後，note フィールドがあれば note フィー
% ルドを表示する前．
FUNCTION {bst.year.backward}
{ #0 }
% { #1 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 日本語文献の数字を漢数字にする．
%
% 縦書き用です．
%
% 0 以外なら漢数字に変換。
FUNCTION {bst.kansuji.jp}
{ #0 }	% 変換しない。
% { #1 }          % 漢数字に変換する。

% bst.kansuji.jp が非ゼロのときに，pages でのページ数とページ数を結ぶ線の定義
% を指定する．pages = 100-200 と指定しているときに，"-" に置き換わる線の定義．
%
% 縦書きの表示を指定しているときでも - は横棒のまま表示されます．これを縦棒に
% 表示するための指定です．
% 
FUNCTION {bst.tatebo.definition}
{ "\hskip.1em \leavevmode\rule[0ex]{1em}{.3pt}\hskip0.1em" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 0 以外を指定すると新しい年の文献を前にもってくる。
%
% 0 なら普通の並び順。通常は 0 のままでいいでしょう．
%
FUNCTION {bst.reverse.year}
{ #0 }        % 普通の並び順 (古い文献ほど上)
% { #1 }        % 普通とは逆 (新しい文献ほど上)

% 0 以外なら year を優先的なキーとしてソート(並べ替え)をする。
% 
% 普通では古い文献ほど上に並べられるが、bst.reverse.year が非ゼロなら新しい文
% 献ほど上となる。
%
FUNCTION {bst.sort.year}
{ #0 }        % この場合、year は author に次ぐソートのキー (普通のケース)
% { #1 }        % この場合、year は最優先されるソートのキー

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 引用順で参考文献を並べる設定．
%
% 0 以外を指定すると引用をしたそのままの順で reference に文献を並べる．\bysame 
% と一緒に利用すると表示がおかしくなるケースあり．
%
FUNCTION {bst.no.sort}
{ #0 }	% 文献の順番を普通にソートする．
% { #1 }	% 引用順に並べる．

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 文献の並べ替えのとき文献エントリーのタイプ別 (article, book, incollection 等)
% にまとめるための設定．
%
FUNCTION {bst.sort.entry.type}
{ #0 } 		% #0 -> タイプ別にまとめない．
% { #1 } 		% まとめる．
%
% この設定は absorder よりも優先します．どういう順番で並べるか (article, book,
% incollection 等をどう並べるか) は bst.sort.entry.type.order という関数の設定
% で決まります．デフォールトでは alphabet 順にしてあります (article, book,
% booklet, comment,..., unpublished 順)．詳しくは jecon-sample.pdf を参照。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 文献の並べ替えのとき absorder filed の値を利用するか否か。利用するなら
% 0、利用しないなら 0 以外を指定。
%
FUNCTION {bst.notuse.absorder.field}
{ #0 } 		% #0 -> 利用する。
% { #1 } 		% #0 以外 -> 利用しない。
%
% Reference での文献並べ替えの優先順序については 
% 
% absorder -> author (or yomi) -> year -> order -> month -> title
%
% としてある。詳しくは jecon-sample.pdf を参照。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 文献の並べ替えのとき order filed の値を利用するか否か。利用するなら
% 0、利用しないなら 0 以外を指定。
FUNCTION {bst.notuse.order.field}
{ #0 } 		% #0 -> 利用する。
% { #1 } 		% #0 以外 -> 利用しない。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%	and

%%% 二人の authors, editors の間の文字列
%
% "Mr.A _ Mr.B " の "_" の部分に入る文字列
%
FUNCTION {bst.and}
{ " and " }

%%% 三人以上の authors, editors の間の文字列
%
% "Mr.A, Mr.B _ Mr.C" の "_" の部分に入る文字列
%
FUNCTION {bst.ands}
{ ", and " }

% 複数の authors, editors の間の文字列 (日本語文献用)
%
% "A氏 _ B氏 _ C氏" の "_" の部分に入る文字列
%
FUNCTION {bst.and.jp}
{ "・" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%	「引用部分」での author 名の間に入る文字列

%%% 二人の authors, editors の間の文字列
%
% 引用部分の "Mr.A _ Mr.B " の "_" の部分に入る文字列
%
FUNCTION {bst.cite.and}
{ " and " }

%%% 三人以上の authors, editors の間の文字列
%
% 引用部分の "Mr.A, Mr.B _ Mr.C" の "_" の部分に入る文字列
%
FUNCTION {bst.cite.ands}
{ " and " }

% 複数の authors, editors の間の文字列 (日本語文献用)
%
% 引用部分の "A氏 _ B氏 _ C氏" の "_" の部分に入る文字列
%
FUNCTION {bst.cite.and.jp}
{ "・" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%	author 名を略す際の文字列

%%% 英語用
%
FUNCTION {bst.and.others}
{ " et~al." }

%%% 日本語用
%
FUNCTION {bst.and.others.jp}
{ "他" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	author 

% author の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.author.pre}
{ "\textbf{" }

% author の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.author.post}
{ "}" }

% author の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.author.pre.jp}
{ "" }

% author の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.author.post.jp}
{ "" }

%%% 日本語文献の author, editor の姓・名の間に入れる文字列 
% (姓名のどちらか一方が一文字のケース)
%
FUNCTION {bst.sei.mei.one.jp}
{ "" }
% { "　" }

%%% 日本語文献の author, editor の姓・名の間に入れる文字列 
% (姓・名とも二文字以上のケース)
%
FUNCTION {bst.sei.mei.two.jp}
{ "" }
% { " " }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	year

% year の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.year.pre}
{ ". " }

% year の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.year.post}
{ ". " }

% year の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.year.pre.jp}
{ " " }

% year の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.year.post.jp}
{ ". " }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	title (book 以外)

% title の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.title.pre}
{ "``" }

% title の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.title.post}
{ ".''" }

% title の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.title.pre.jp}
{ "「" }

% title の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.title.post.jp}
{ "」，" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	book 用 title

% book の title 前に付ける文字列 (英語文献用)
%
FUNCTION {bst.book.pre}
{ " {\it " }

% book の title 後に付ける文字列 (英語文献用)
%
FUNCTION {bst.book.post}
{ "}" }

% book の title 前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.book.pre.jp}
{ "『" }

% book の title 後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.book.post.jp}
{ "』" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	booktitle

% booktitle の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.btitle.pre}
{ " {\it " }

% booktitle の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.btitle.post}
{ "}" }

% booktitle の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.btitle.pre.jp}
{ "『" }

% booktitle の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.btitle.post.jp}
{ "』" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	journal name

% journal name の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.journal.pre}
{ " {\it " }

% journal name の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.journal.post}
{ "}" }

% journal name の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.journal.pre.jp}
{ "『" }

% journal name の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.journal.post.jp}
{ "』" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	editor 記号

% 複数 editor を表す文字列 (英語文献用)
%
FUNCTION {bst.editors}
{ " eds. " }

% 一人の editor を表す文字列 (英語文献用)
%
FUNCTION {bst.editor}
{ " ed. " }

% editor を表す文字列 (日本語文献用)
%
FUNCTION {bst.editor.jp}
{ "（編）" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	edition

% edition の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.edition.pre}
{ ", " }

% edition の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.edition.post}
{ " edition" }

% edition の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.edition.pre.jp}
{ "，第" }

% edition の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.edition.post.jp}
{ "版" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	volume

% volume の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.volume.pre}
{ ", " }

% volume の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.volume.post}
{ "" }

% volume の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.volume.pre.jp}
{ "，第" }

% volume の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.volume.post.jp}
{ "巻" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	number

% number の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.number.pre}
{ "(" }

% number の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.number.post}
{ ")" }

% number の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.number.pre.jp}
{ "，第" }

% number の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.number.post.jp}
{ "号" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	in 

% In (英語文献用)
%
FUNCTION {bst.in}
{ " in " }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	page

% page の前に付ける文字列 (複数ページ) (英語文献用)
%
FUNCTION {bst.pages.pre}
{ ": " }

% page の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.page.pre}
{ ": " }

% page の後に付ける文字列 (複数ページ) (英語文献用)
%
FUNCTION {bst.pages.post}
{ "" }

% page の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.page.post}
{ "" }

% page の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.page.pre.jp}
{ "，" }

% page の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.page.post.jp}
{ "頁" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	chapter

% chapter の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.chapter.pre}
{ ", Chap." }

% chapter の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.chapter.post}
{ "" }

% chapter の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.chapter.pre.jp}
{ "，第" }

% chapter の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.chapter.post.jp}
{ "章" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	month

% month の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.month.pre}
{ ", " }

% month の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.month.post}
{ "" }

% month の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.month.pre.jp}
{ "，" }

% month の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.month.post.jp}
{ "月" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	address
% address の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.address.pre}
{ ", " }

% address の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.address.post}
{ "" }

% address の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.address.pre.jp}
{ "，" }

% address の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.address.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	publisher

% publisher の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.publisher.pre}
{ ": " }

% publisher の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.publisher.post}
{ "" }

% publisher の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.publisher.pre.jp}
{ "，" }

% publisher の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.publisher.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	series

% series の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.series.pre}
{ ", " }

% series の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.series.post}
{ "" }

% series の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.series.pre.jp}
{ "，" }

% series の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.series.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	organization

% organization の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.organization.pre}
{ ", " }

% organization の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.organization.post}
{ "" }

% organization の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.organization.pre.jp}
{ "，" }

% organization の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.organization.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	school

% school の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.school.pre}
{ ", " }

% school の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.school.post}
{ "" }

% school の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.school.pre.jp}
{ "，" }

% school の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.school.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	institution

% institution の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.institution.pre}
{ ", " }

% institution の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.institution.post}
{ "" }

% institution の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.institution.pre.jp}
{ "，" }

% institution の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.institution.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	howpublished

% howpublished の前に付ける文字列 (英語文献用)
%
FUNCTION {bst.howpublished.pre}
{ " " }

% howpublished の後に付ける文字列 (英語文献用)
%
FUNCTION {bst.howpublished.post}
{ "" }

% howpublished の前に付ける文字列 (日本語文献用)
%
FUNCTION {bst.howpublished.pre.jp}
{ "，" }

% howpublished の後に付ける文字列 (日本語文献用)
%
FUNCTION {bst.howpublished.post.jp}
{ "" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	邦訳書

FUNCTION {bst.hoyakusho.pre.jp}
{ "（" }

FUNCTION {bst.hoyakusho.post.jp}
{ "）" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 句点の指定．
FUNCTION {bst.kuten.jp}
{ "．" }

% 読点の指定．
FUNCTION {bst.touten.jp}
{ "，" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	
% 0 以外を指定すれば，page を繋ぐ "-" を "--" に変更しない．
FUNCTION {bst.dashify.off}
% { #0 }
{ #1 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 非ゼロを指定すると \harvarditem を出力しない．
FUNCTION {bst.harvarditem.off}
{ #0 }
% { #1 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	\thebibliography環境の定義
%
% thebibliography命令の前や後に何かを入れたいときは変更してください．
%
FUNCTION {bst.thebibliography.begin}
{
  "" write$ newline$
  "\begin{thebibliography}{xxx}" write$ newline$
  "" write$ newline$
}

FUNCTION {bst.thebibliography.end}
{ 
  "" write$ newline$
  "\end{thebibliography}" write$ newline$
  "" write$ newline$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	その他の関数

% Technical report を表す文字列 (英語文献用)
%
FUNCTION {bst.techrep}
{ " Tech. Rep." }

% Technical report を表す文字列 (日本語文献用)
%
FUNCTION {bst.techrep.jp}
{ " テクニカル・レポート" }

% master thesis を表す文字列 (英語文献用)
%
FUNCTION {bst.mthesis}
{ " Master's thesis" }

% master thesis を表す文字列 (日本語文献用)
%
FUNCTION {bst.mthesis.jp}
{ "修士論文" }

% phd thesis を表す文字列 (英語文献用)
%
FUNCTION {bst.phdthesis}
{ " Ph.D. dissertation" }

% phd thesis を表す文字列 (日本語文献用)
%
FUNCTION {bst.phdthesis.jp}
{ "博士論文" }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	カスタマイズのための関数はここまで。
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% 以下は英語文献用

FUNCTION {bst.first}
{ "1st" }

FUNCTION {bst.second}
{ "2nd" }

FUNCTION {bst.third}
{ "3rd" }

FUNCTION {bst.fourth}
{ "4th" }

FUNCTION {bst.fifth}
{ "5th" }

FUNCTION {bst.st}
{ "st" }

FUNCTION {bst.nd}
{ "nd" }

FUNCTION {bst.rd}
{ "rd" }

FUNCTION {bst.th}
{ "th" }

%%%%% memo by Takeda

% "a" 'b := は b という変数に "a" という文字列を代入するということ。

% #0 は整数の 0、#1 は整数の 1．．．を表す。

%%% 関数の書式
%
% FUNCTION {name}
% { 's :=
%
% }
%
% 上は name という関数の定義。呼出し側では
%
% "hoge" name
%
% という形で指定。"hoge" という文字列が、変数 s に代入される。
%
% 引数が二つ以上の関数の定義 --> 関数 chop.word を参照。

ENTRY

  %%% 文献フィールドの宣言
  { address author booktitle chapter edition editor howpublished
    institution journal key month note number organization pages publisher
    school series title type volume year yomi

    % 以下は普通の bst ファイルでは利用されないフィールド
    jauthor jkanyaku jtitle jpublisher jyear
    order absorder
  }

  % 以下，エントリー変数の定義．エントリー変数とは，文献エントリー別に異なっ
  % た値を持つ変数のこと．

  %% これは entry 別の整数型変数 (整数型エントリ変数)
  { is.kanji.entry is.kanji.entry.two order.cited }

  %% これは entry 別の文字列型変数 (文字列型エントリ変数)
  { label cyear flabel alabel extra.label sort.label
    extra.label.bysame }

%%% 変数宣言

%% 文字列型大域変数
STRINGS { s t ss tt sss }
STRINGS { year.num }
STRINGS { num.kanji }
STRINGS { preone preten }
STRINGS { last.sort.label next.extra prev.author this.author }
STRINGS { hang }
STRINGS { item.type }

%% 整数型大域変数
INTEGERS { nameptr namesleft numnames  alphabet.in.author name.num }
INTEGERS { bysame.check }
INTEGERS { multiresult }
INTEGERS { index }
INTEGERS { len }
INTEGERS { last.extra.num }
INTEGERS { output.state before.all mid.sentence after.sentence after.block int }

%%% 変数の説明

% alabel: 引用部分で利用される author (editor) 名 (省略形)を保持する変数． 
% reference 部分の表示には無関係．

% flabel: 引用部分で利用される author (editor) 名を保持する変数． reference 部
% 分の表示には無関係．

% sort.label: 文献のソートのための author (editor) 名を保持する変数．

% sort.key$: 文献のソート (並べ替え) のために利用される文字列を保持する．
% jecon.debug を非ゼロにすればどのような値が入っているか表示できる (通常は 
% author - year - title - month 等が繋った文字列が指定される)．

%%% 汎用の関数の定義

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

%%% 変数の値を初期化する関数
FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

%%% comma を除去し、period を付ける(に変える)関数 (英語文献用)
%
% #-1 #1 substring$ は後ろから一文字目を抜き出す処理をする。
%%%
FUNCTION {add.period.x}
{ duplicate$
  % 後ろから1文字とって比較
  #-1 #1 substring$ "," =
    { #-2 global.max$ substring$ "." * }
    { duplicate$
      % 後ろから2文字とって比較
      #-1 #2 substring$ ",'" =
        { #-3 global.max$ substring$ ".'" * }
	{ duplicate$
          % 後ろから3文字とって比較
	  #-1 #3 substring$ ",''" =
	    { #-4 global.max$ substring$ ".''" * }
	    { add.period$ }
	  if$
	}
     if$
   }
  if$
}

%%% "、" や "，" を除去し、"．" を付ける(に変える)関数 (日本語文献用)
FUNCTION {add.kanji.period.x}
{
  duplicate$
  % 後ろから1文字とって比較
  #-1 #1 substring$ "，" =
    { #-2 global.max$ substring$ bst.kuten.jp * }
    { duplicate$
      % 後ろから1文字とって比較
      #-1 #1 substring$ "、" =
        { #-2 global.max$ substring$ bst.kuten.jp * }
        { duplicate$
          % 後ろから1文字とって比較
          #-1 #1 substring$ "." =
            {#-2 global.max$ substring$ bst.kuten.jp * }
	    {#-1 global.max$ substring$ bst.kuten.jp * }
          if$
        }
     if$
   }
  if$
}

%%% output.nonnull は文中なら前に ","、「，」を付ける。
FUNCTION {output.nonnull}
{ 's :=
  % mid.sentence のとき
  output.state mid.sentence =
    { is.kanji.entry
        { bst.touten.jp * write$ }
        { ", " * write$ }
      if$
    }
    % mid.sentence ではないとき
    { output.state after.block =
        % after.block のとき
	{ is.kanji.entry
            { add.kanji.period.x write$}
	    { add.period.x " " * write$ }
	  if$
	}
	% before.all のとき
	{ output.state before.all =
	    'write$
	    { is.kanji.entry
 		{ add.kanji.period.x write$ }
		{ add.period.x " " * write$ }
	      if$
	    }
	  if$
	}
      if$
      % mid.sentence 以外のときは mid.sentence に状態を変更。
      mid.sentence 'output.state :=
    }
  if$
  s
}

%%% output.nonnull.nocomma は文中でも前に ","、「，」を付けない。あとは 
%%% output.nonnull と全く同じ。
FUNCTION {output.nonnull.nocomma}
{ 's :=
  output.state mid.sentence =
    % mid.sentence のとき
    { "" * write$ }

    % mid.sentence ではないとき
    { output.state after.block =
        % after.block のとき
	{ is.kanji.entry
            { add.kanji.period.x write$}
	    { add.period.x " " * write$ }
	  if$
	}
	% before.all のとき
	{ output.state before.all =
	    'write$
	    { is.kanji.entry
 		{ add.kanji.period.x write$ }
		{ add.period$ " " * write$ }
	      if$
	    }
	  if$
	}
      if$
      % mid.sentence 以外のときは mid.sentence に状態を変更。
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.nocomma}
{ duplicate$ empty$
    'pop$
    'output.nonnull.nocomma
  if$
}

%%% output.nonnull にチェック機能を付加したもの。エントリーが空なら warning が
%%% 出力される。output.nonull なので、mid.sentence なら , を付ける。
FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

%%% output.nonnull.nocomma にチェック機能を付加したもの。エントリーが空なら 
%%% warning が出力される。
FUNCTION {output.check.nocomma}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull.nocomma
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% bbl ファイルへの出力の形式

% \harvarditem[Brezis et~al.]{Brezis, Krugman and
%   Tsiddon}{1993}{brezis93:_leapf_inter_compet}
% Brezis, Elise~S., Paul~R. Krugman, and Daniel Tsiddon  (1993) ``Leapfrogging in
%   International Competition: A Theory of Cycles in National Technological
%   Leadership.'', {\em American Economic Review.}, Vol.~83. No.~5. pp.
%   1211--1219.

% \harvarditem[abbreviated citation]{full citation}{year}{keyword} ...
%
% という形式で出力する。

%%% period を付けて、改行する。
FUNCTION {fin.entry}
{ is.kanji.entry
    { add.kanji.period.x }
    { add.period.x }
  if$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
	'skip$
	{ after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {new.block.check}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

%%% booktitle の整形。
FUNCTION {format.btitle}
{ booktitle empty$
    { "" }
    { booktitle is.kanji.str$
	{ bst.btitle.pre.jp booktitle * bst.btitle.post.jp * }
	{ bst.btitle.pre booktitle * bst.btitle.post * }
      if$
    }
  if$
}

%%% journal の整形。
FUNCTION {format.journal}
{ journal empty$
    { "" }
    { journal is.kanji.str$
	{ bst.journal.pre.jp journal * bst.journal.post.jp * }
 	{ bst.journal.pre journal * bst.journal.post * }
      if$
    }
  if$
}

%%% book の title の整形。
FUNCTION {format.book}
{ title empty$
    { "" }
    { title is.kanji.str$
	{ bst.book.pre.jp title * bst.book.post.jp * }
 	{ bst.book.pre title * bst.book.post * }
      if$
    }
  if$
}

%%% 以下、author, editor の処理

% 日本語 author 名のときに alphabet が含まれているかどうか判断する関数。含まれ
% ているなら alphabet.in.author に 1 を代入、含まれていないなら 0 を代入。これ
% は Alphabet + 片仮名の外国人名を処理するためのもの。
FUNCTION {set.alphabet.in.author}
{ name.num "{ff}" format.name$ 't :=
  #0 'alphabet.in.author :=
  "" t =
    % first name がないときは 0。
    { #0 'alphabet.in.author := }
    { 
      % 記号除去
      t purify$ 't :=
      % 一文字目だけ取り出す。
      t #1 text.prefix$ 't :=
      % 日本語か alphabet か？
      t is.kanji.str$
        { #0 'alphabet.in.author :=
        }
        { #1 'alphabet.in.author :=
        }
      if$
    }
  if$
}

%%% 文字の数を判断する関数 (日本語用)。
% 日本語の場合 1 文字が 2 文字と判断されることに注意。
FUNCTION {count.number.of.letters}
{ 'sss :=
   sss text.length$ #2 =
      % 一文字のケースでは "1" を返す。
      { "1" }
      % 一文字以外のケースでは "0" を返す。
      { "0" }
   if$
}

%%% name を処理する関数
FUNCTION {format.names}
{ 's :=
  % nameptr に 1 を代入
  #1 'nameptr :=
  % numnames に author (editor) の数を代入
  s num.names$ 'numnames :=
  numnames 'namesleft :=
  % namesleft が 0 より大なら繰り返し (while)
  { namesleft #0 > }
    % s に日本語含むか？
    { s is.kanji.str$
        % 日本語含むケースの処理
        { nameptr 'name.num :=
          s set.alphabet.in.author
          alphabet.in.author #0 =
            % first name も日本語のケース

            % 注：日本語の author は "姓 名" の順で指定されるが、bst では
            % 順番通りに姓＝first name、名＝last name として扱われる。
            { s nameptr "{ff}" format.name$ 'ss :=
              s nameptr "{ll}" format.name$ 'tt :=
              ss "" =
                %% 姓のみのケースはそのまま
                { tt 't := }
                %% 姓・名ともにあるケース
                { ss count.number.of.letters "1" =
                  tt count.number.of.letters "1" = or
                    { ss bst.sei.mei.one.jp * tt * 't := }
                    { ss bst.sei.mei.two.jp * tt * 't := }
                  if$
                }
              if$
            }
            % first name が alphabet のケース (つまり、カタカナの外国人名)
            { nameptr #1 =
               % first author のケース (last name - first name の order)
               { bst.author.name #0 =
                 bst.author.name #1 = or
                   % Last name - first name
                   { s nameptr "{ll}" format.name$ 'ss :=
                     s nameptr "{ff}" format.name$ 'tt :=
                     ss bst.touten.jp * tt * 't := }
                   % First name - Last name
                   { s nameptr "{ff~}{ll}" format.name$ 't := }
                 if$
               }
               % first author 以外のケース (first name - last name の order)
               { bst.author.name #0 =
                 bst.author.name #2 = or
                   % First name - Last name
                   { s nameptr "{ff~}{ll}" format.name$ 't := }
                   % Last name - First name
                   { s nameptr "{ll}" format.name$ 'ss :=
                     s nameptr "{ff}" format.name$ 'tt :=
                     ss bst.touten.jp * tt * 't := }
                 if$
               }
              if$
            }
          if$
        }
        % author に日本語含まないケースの処理
        { nameptr #1 =
           % 一番目の author
	   { bst.author.name #0 =
	     bst.author.name #1 =
	     or
	        { bst.first.name.initial #0 = 
		   { s nameptr "{vv~}{ll}{, ff}{, jj}" format.name$ 't := }
		   { s nameptr "{vv~}{ll}{, f.}{, jj}" format.name$ 't := }
		  if$
		}
	        { bst.first.name.initial #0 = 
	           { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
	           { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't := }
		  if$
		}
	     if$
	   }
           % 二番目以降の author
	   { bst.author.name #0 =
	     bst.author.name #2 =
	     or
	        { bst.first.name.initial #0 = 
                   { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't := }
                   { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't := }
		 if$
	        }
	        { bst.first.name.initial #0 = 
   	           { s nameptr "{vv~}{ll}{, ff}{, jj}" format.name$ 't := }
   	           { s nameptr "{vv~}{ll}{, f.}{, jj}" format.name$ 't := }
		 if$
	        }
	     if$
	   }
          if$
        }
      if$
      nameptr #1 >
        % 二番目以降の author のケースでの処理
	{ namesleft #1 >
 	    { s is.kanji.str$
 		{ bst.and.jp  * t * }
 		{ ", " * t * }
	      if$
	    }
	    { t "others" =
  		{ s is.kanji.str$
  		    { bst.and.others.jp * }
                    { bst.and.others * }
 		  if$
 		}
  		{ s is.kanji.str$
 		    { bst.and.jp * t * }
		    { numnames #2 =
  			{ bst.and * t * }
  			{ bst.ands * t * }
		      if$
		    }
 		   if$
 		}
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

%%% author の整形
FUNCTION {format.authors}
{ author empty$
    { "" }
    { extra.label.bysame "bysame" =
	{"\bysame "}
 	{ author is.kanji.str$
 	    { bst.author.pre.jp author format.names * bst.author.post.jp * }
   	    { bst.author.pre author format.names * bst.author.post * }
	  if$
	}
      if$
    }
  if$
}

%%% editor の整形
FUNCTION {format.editors}
{ editor empty$
    { "" }
    { extra.label.bysame "bysame" =
	{ #1 'bysame.check :=
	   "\bysame " }
	{ editor is.kanji.str$
	    { bst.author.pre.jp editor format.names * }
 	    { bst.author.pre editor format.names * bst.author.post * }
	  if$
	}
      if$
      #1 bysame.check =
        { "" * }
        { editor num.names$ #1 >
 	  { editor is.kanji.str$
              { bst.editor.jp * }
	      { bst.editors * }
	    if$
 	  }
  	  { editor is.kanji.str$
 	      { bst.editor.jp * }
	      { bst.editor * }
	    if$
 	  }
        if$
        }
      if$
    }
  if$
}

%%% format.in.ed.booktitle 用
FUNCTION {format.editors.x}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
 	{ editor is.kanji.str$
 	    { bst.editor.jp * }
	    { bst.editors * }
	  if$
 	}
  	{ editor is.kanji.str$
 	    { bst.editor.jp * }
	    { bst.editor * }
	  if$
 	}
      if$
    }
  if$
}

%%% 「?.」、「?,」のようなケースで、period、comma を除去する関数
FUNCTION {remove.irrelevant.period.comma}
{ 's :=
  s empty$
    { "" }
    % 後ろから3文字とって比較
    { s #-1 #3 substring$ "?,'" =
      s #-1 #3 substring$ "?.'" =
      or
        % 後ろから3文字を除いたものに "'" を付ける．
        { s #-3 global.max$ substring$ "'" * }
	{ s #-1 #4 substring$ "?,''" =
          s #-1 #4 substring$ "?.''" =
          or
            { s #-4 global.max$ substring$ "''" * }
	    { s #-1 #2 substring$ "?," =
              s #-1 #2 substring$ "?." =
	      or
                { s #-2 global.max$ substring$ "" * }
                's
	      if$
            }
          if$
        }
      if$
    }
  if$
}

%%% 最後についているの「，」、「、」、「．」、「．」を除去する関数 (邦訳書用)
FUNCTION {remove.irrelevant.kutoten}
{ 's :=
  s empty$
    { "" * }
    { s #-1 #1 substring$ "、" =
      s #-1 #1 substring$ "，" = or
      s #-1 #1 substring$ "。" = or
      s #-1 #1 substring$ "．" = or
        { s #-2 global.max$ substring$ "" * }
        { s }
      if$
    }
  if$
}

%%% 最初についている comma を除去した文字列を返す。
FUNCTION {remove.pre.comma}
{ 's :=
  s empty$
    { "" }
    { s #1 #1 substring$ "," = 
       { s #2 global.max$ substring$ }
       { s #1 #2 substring$ "，" = s #1 #2 substring$ "、" = or
          { s #3 global.max$ substring$ }
          's
         if$
       }
      if$
    }
  if$
}

%%% title の整形
FUNCTION {format.title.sub}
{ bst.title.lower.case #0 =
     { bst.title.pre title * bst.title.post * }
     { bst.title.pre title "t" change.case$ * bst.title.post * }
  if$
}

%%% title の整形
FUNCTION {format.title}
{ title empty$
    { "" }
    { title is.kanji.str$
      { bst.title.pre.jp title * bst.title.post.jp * }
      { format.title.sub remove.irrelevant.period.comma }
     if$
    }
  if$
}

%%% jtitle の整形
FUNCTION {format.jtitle}
{ jtitle empty$
    { "" }
    { bst.book.pre.jp jtitle * bst.book.post.jp * }
  if$
}

%%% misc の title の処理
FUNCTION {format.misc.title}
{ title empty$
    { "" }
    { title is.kanji.str$
      { bst.title.pre.jp title * bst.title.post.jp * }
      { bst.title.pre title * bst.title.post * }
     if$
    }
  if$
}

% - を -- にする関数 (pages 用)
FUNCTION {n.dashify}
{ 't :=
  ""
  %% while$ の条件 (t が empty でないなら実行)
  { t empty$ not }
  %% 処理
  { t #1 #1 substring$ "-" =
      { t #1 #2 substring$ "--" = not
          { bst.dashify.off
              { "-" * }
              { "--" * }
            if$
            t #2 global.max$ substring$ 't :=
          }
          { { t #1 #1 substring$ "-" = }
            { "-" *
              t #2 global.max$ substring$ 't :=
            }
            while$
          }
        if$
      }
      { t #1 #1 substring$ is.kanji.str$
        { t #1 #2 substring$ *
          t #3 global.max$ substring$ 't :=
        }
         { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
        if$
      }
    if$
  }
  while$
}

%%% 与えられた数を漢数字に変換: 0->〇, 1->一, 2->二,..., 9->九 という対応関係。
%%% さらに、"-" は "―" に変換する。
FUNCTION {convert.num.kanji}
{ 's :=
  s "1" =
    { "一" }
    { s "2" =
        { "二" }
        { s "3" =
            { "三" }
            { s "4" =
                { "四" }
                { s "5" =
                    { "五" }
                    { s "6" =
                        { "六" }
                        { s "7" =
                            { "七" }
                            { s "8" =
                                { "八" }
                                { s "9" =
                                    { "九" }
                                    { s "0" =
                                        { "〇" }
                                        { s "-" =
                                           { "\tatebo{}" }
                                           { s }
                                          if$
                                        }
                                      if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
  if$
}

%%% 半角の alphabet を全角の alphabet に変更する関数 (a-j までのみ)。
FUNCTION {convert.alphabet.zenkaku}
{ 's :=
  s "a" =
    { "ａ" }
    { s "b" =
        { "ｂ" }
        { s "c" =
            { "ｃ" }
            { s "d" =
                { "ｄ" }
                { s "e" =
                    { "ｅ" }
                    { s "f" =
                        { "ｆ" }
                        { s "g" =
                            { "ｇ" }
                            { s "h" =
                                { "ｈ" }
                                { s "i" =
                                    { "ｉ" }
                                    { s "j" =
                                        { "ｊ" }
                                        { s }
                                    if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
  if$
}

%%% year を漢数字に変換
FUNCTION{convert.year.kanji}
{ 't :=
  %% bst.kansuji.jp が非ゼロでかつ，t が漢字じゃないのなら，漢字に変換
  bst.kansuji.jp #0 = not t is.kanji.str$ not and 
     { "" 'tt :=
       { t empty$ not }
       { tt t #1 #1 substring$ convert.num.kanji convert.alphabet.zenkaku * 'tt :=
         t #2 global.max$ substring$ 't := }
       while$
     }
     { t 'tt := }
  if$
 tt
}

%%% bst.kansuji.jp が非ゼロのとき、数字を漢数字に変換する関数。
FUNCTION{convert.num}
{ 't :=
  bst.kansuji.jp #0 = t is.kanji.str$ or
     { t 'tt := }
     { "" 'tt :=
       { t empty$ not }
       { t #1 #1 substring$ convert.num.kanji 'ss :=
         tt ss * 'tt :=
         t #2 global.max$ substring$ 't :=
         }
       while$
     }
  if$
 tt
}

%% 変数定義
STRINGS { da db dc dd }
%% pages の "--" を "-" に変換する．
FUNCTION {remove.duplicate.dash}
{ 'da :=
  "" 'db :=
  "" 'dc :=
  "" 'dd :=
  { da empty$ not }
  { da #1 #1 substring$ 'db :=
    db "-" = dc "-" = and
       'skip$
       { dd db * 'dd := }
    if$
    db 'dc :=
    da #2 global.max$ substring$ 'da :=
  }
  while$
  dd
}

%%% bst.kansuji.jp が非ゼロのとき、pages を漢数字に変換する関数。
FUNCTION{convert.num.pages}
{ 't :=
  bst.kansuji.jp #0 = t is.kanji.str$ or
     { t 'tt := }
     { "" 'tt :=
       t remove.duplicate.dash 't :=
       { t empty$ not }
       { t #1 #1 substring$ convert.num.kanji 'ss :=
         tt ss * 'tt :=
         t #2 global.max$ substring$ 't :=
         }
       while$
     }
  if$
 tt
}

%%% year の処理
FUNCTION {format.year}
{ year empty$
    { "there's no year in " cite$ * warning$
      "" }
    { is.kanji.entry
        { bst.kansuji.jp #0 =
           { bst.year.pre.jp year * extra.label * bst.year.post.jp * }
           { bst.year.pre.jp year convert.year.kanji *
             extra.label convert.alphabet.zenkaku * bst.year.post.jp * }
          if$
        }
        { bst.year.pre year * extra.label * bst.year.post * }
      if$
    }
  if$
}

%%% book の page の処理
FUNCTION {format.book.pages}
{ pages empty$
    { "" }
    { is.kanji.entry
        { bst.page.pre.jp pages convert.num.pages * bst.page.post.jp * }
        { bst.pages.pre pages * bst.pages.post * }
      if$
    }
  if$
}

%%% 2文字以下なら前に tie を付ける．
FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

%%% book の volume の整形
FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { is.kanji.entry
	{ bst.volume.pre.jp volume convert.num * bst.volume.post.jp * }
        { bst.volume.pre volume * bst.volume.post * }
      if$
      series empty$
	'skip$
	%% series もあるとき
	{ is.kanji.entry
	    { bst.series.pre.jp * series convert.num * bst.series.post.jp * }
	    { " of " * series * bst.series.post * }
	  if$
	}
      if$
%       "volume and number" number either.or.check
    }
  if$
}

%%% series の出力
FUNCTION {output.series}
{ series empty$
    { "" }
    { is.kanji.entry
        { bst.series.pre.jp series convert.num * bst.series.post.jp * }
        { bst.series.pre series * bst.series.post * }
      if$
    }
 if$
}

%%% number と series を出力
FUNCTION {format.number.series}
{ volume empty$
    { number empty$
      bst.hide.number #0 = not or
        % number is empty
   	{ series empty$
	    { "" }
	    % series is not empty.
	    { output.series }
	  if$
	}
        % number is not empty$
	{ series empty$
	    { is.kanji.entry
	        { bst.number.pre.jp number convert.num * bst.number.post.jp * }
		{ bst.number.pre number * bst.number.post * }
	      if$
	    }
	    % series is not empty.  日本語と英語で順序逆にする。
	    { is.kanji.entry
 	        { bst.series.pre.jp series convert.num * bst.series.post.jp *
		  bst.number.pre.jp * number convert.num * bst.number.post.jp * }
		{ bst.in bst.series.pre * series * bst.series.post *
		  bst.number.pre * number * bst.number.post * }
	      if$
	    }
	  if$
	}
      if$
    }
    { "" }
  if$
}

%%% 数字かどうか判断する
FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	edition 処理用のプログラム

% 英語の edition は全て 1st, 2nd, 3rd, 4th etc. に変換する。
FUNCTION {eng.ord}
{ duplicate$ "1" swap$ *
  #-2 #1 substring$ "1" =
     { bst.th * }
     { duplicate$ #-1 #1 substring$
       duplicate$ "1" =
         { pop$ bst.st * }
         { duplicate$ "2" =
             { pop$ bst.nd * }
             { "3" =
                 { bst.rd * }
                 { bst.th * }
               if$
             }
           if$
          }
       if$
     }
   if$
}

% edition entry の first, second 等を 1st, 2nd に変換する (from jfm.bst)。
FUNCTION {convert.edition}
{ edition extract.num "l" change.case$ 's :=
  s "first" = s "1" = or
    { bst.first }
    { s "second" = s "2" = or
        { bst.second }
        { s "third" = s "3" = or
            { bst.third }
            { s "fourth" = s "4" = or
                { bst.fourth }
                { s "fifth" = s "5" = or
                    { bst.fifth }
                    { s #1 #1 substring$ is.num
                        { s eng.ord }
                        { edition }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
}

% 日本語文献の場合には英語の月を数字に変換する。
FUNCTION {convert.month}
{ 't := 
  t "January" =
    { "1" }
    { t "February" =
        { "2" }
        { t "March" =
            { "3" }
            { t "April" =
                { "4" }
                { t "May" =
                    { "5" }
                    { t "June" =
                        { "6" }
                        { t "July" =
                            { "7" }
                            { t "August" =
                                { "8" }
                                { t "September" =
                                    { "9" }
                                    { t "October" =
                                        { "10" }
                                        { t "November" =
                                            { "11" }
                                            { t "December" =
                                                { "12" }
                                                't
                                            if$
                                            }
                                        if$
                                        }
                                    if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
  if$
}

%%% edition の整形
FUNCTION {format.edition}
{ edition empty$
    { "" }
    { is.kanji.entry
	{ bst.edition.pre.jp edition convert.num * bst.edition.post.jp * }
        { output.state mid.sentence =
            { bst.edition.pre convert.edition "l" change.case$ * bst.edition.post * }
            { bst.edition.pre convert.edition "t" change.case$ * bst.edition.post * }
          if$
        }
      if$
    }
  if$
}

%%% month の整形。
FUNCTION {format.month}
{ month empty$
  % bst.hide.month が非ゼロなら month は出力せず
  bst.hide.month #0 = not or
    { "" }
    { is.kanji.entry
        { bst.month.pre.jp month convert.month convert.num * bst.month.post.jp * }
        { bst.month.pre month * bst.month.post * }
      if$
    }
  if$
}

%%% year と month を一緒に処理するためのもの。
FUNCTION {format.date}
{ is.kanji.entry
   %% 日本語文献 -> 年 - 月
   { format.year format.month * }
   %% 英語 -> 月 - 年
   { format.month format.year * }
  if$
}

%%% 複数のページが指定されているかチェック (1-100等のように)．
FUNCTION { multi.page.check }
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
	{ #1 'multiresult := }
	{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

%%% pages の整形。
FUNCTION {format.pages}
{ pages empty$
    { "" }
    { is.kanji.entry
        { pages multi.page.check
          { bst.page.pre.jp pages n.dashify convert.num.pages * bst.page.post.jp * }
          { bst.page.pre.jp pages convert.num.pages * bst.page.post.jp * }
         if$
        }
        { pages multi.page.check
 	  { bst.pages.pre pages n.dashify tie.or.space.connect * bst.pages.post }
	  { bst.page.pre pages tie.or.space.connect * bst.page.post }
         if$
        }
       if$
   }
 if$
}

%%% number を整形
FUNCTION {format.number}
{ number empty$
  % bst.hide.number が非ゼロなら number は出力せず
  bst.hide.number #0 = not or
    { "" }
    { is.kanji.entry
        { bst.number.pre.jp number convert.num * bst.number.post.jp * }
	{ bst.number.pre number * bst.number.post * }
      if$
    }
  if$
}

%%% volume を整形
FUNCTION {format.volume}
{ volume empty$
    'skip$
    { is.kanji.entry
        { bst.volume.pre.jp volume convert.num * bst.volume.post.jp * }
	{ bst.volume.pre volume * bst.volume.post * }
      if$
    }
  if$
}

%%% number、page を出力
FUNCTION {format.number.pages}
{ format.number format.pages * }

%%% volume、page を出力
FUNCTION {format.volume.pages}
{ format.volume format.pages * }

%%% volume、number、page を出力
FUNCTION {format.volume.number.pages}
{ format.volume format.number * format.pages * }

% volume, number, page を一緒に処理する関数。
FUNCTION {format.vol.num.pages}
{ volume empty$
    %% volume is empty.
    { number empty$
        %% number is empty.
        { pages empty$
	    % この場合は warning を出す。
            { "there is no volume, number, and pages in " cite$ * warning$ "" }	
	    { "" format.pages * }
         if$
        }
        %% number is not empty.
	% この場合は warning を出す。
	{ "there's a number but no volume in " cite$ * warning$
	  format.number.pages }
     if$
    }
    %% volume is not empty.
    { number empty$
        %% number is empty.
	{ format.volume.pages }
        %% number is not empty.
	{ format.volume.number.pages }
     if$
    }
  if$
}

%%% chapter の整形。
FUNCTION {format.chapter}
{ chapter empty$
    { "" }
    { type empty$
        { is.kanji.entry
            { bst.chapter.pre.jp chapter convert.num * bst.chapter.post.jp * }
            { bst.chapter.pre chapter tie.or.space.connect * bst.chapter.post }
          if$
        }
        { is.kanji.entry
            { bst.touten.jp * type " " * chapter convert.num * }
            { ", " * type " " * chapter * }
          if$
        }
      if$
    }
  if$
}

%%% chapter, pages を一緒に処理する関数
FUNCTION {format.chapter.pages}
{ chapter empty$
    { pages empty$
        { "" }
	{ "" format.pages * }
      if$
    }
    { pages empty$
        { "" format.chapter * }
        { "" format.chapter * format.pages * }
      if$
    }
  if$
}

%%% editor and booktitle の整形。
FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
 	{ is.kanji.entry
    	    { format.btitle remove.pre.comma }
   	    { bst.in format.btitle * }
 	  if$
 	}
 	{ is.kanji.entry
  	    { format.editors.x "" * format.btitle * }
    	    { bst.in format.editors.x * " " * format.btitle * }
 	  if$
 	}
      if$
    }
  if$
}

%%% howpublished の整形。
FUNCTION {format.howpublished}
{ howpublished empty$
    { "" }
    { is.kanji.entry
        { bst.howpublished.pre.jp howpublished * bst.howpublished.post.jp * }
        { bst.howpublished.pre howpublished * bst.howpublished.post * }
      if$
    }
  if$
}

%%% address の整形。
FUNCTION {format.address}
{ address empty$
    { "" }
    { address is.kanji.str$
        { bst.address.pre.jp address * bst.address.post.jp * }
        { bst.address.pre address * bst.address.post * }
      if$
    }
  if$
}

%%% publisher の整形。
FUNCTION {format.publisher}
{ publisher empty$
    { "" }
    { is.kanji.entry 
        { bst.publisher.pre.jp publisher * bst.publisher.post.jp * }
	{ bst.publisher.pre publisher * bst.publisher.post * }
      if$
    }
  if$
}

%%% organization の整形。
FUNCTION {format.organization}
{ organization empty$
    { "" }
    { is.kanji.entry
        { bst.organization.pre.jp organization * bst.organization.post.jp * }
	{ bst.organization.pre organization * bst.organization.post * }
      if$
    }
  if$
}

%% publisher と address を出力する関数
FUNCTION {output.publisher.address}
{ address empty$
    { format.publisher "publisher" output.check.nocomma }
    % 日本語、英語で publisher と address の順序が逆
    { is.kanji.entry
	{ format.publisher "publisher" output.check.nocomma
	  format.address output.nocomma }
	{ format.address output.nocomma
	  format.publisher "publisher" output.check.nocomma }
      if$
    }
  if$
}

%% address, organization, publisher を出力する関数
FUNCTION {output.address.organization.publisher}
{ address empty$
    %% address is empty
    { organization empty$
        %% organization is empty
        { publisher empty$
	    'skip$
	    { format.publisher "publisher" output.check.nocomma }
	  if$
        }
        %% organization is not empty
        { publisher empty$
	    { format.organization "organization" output.check.nocomma }
	    { format.organization "organization" output.check.nocomma
	      format.publisher "publisher" output.check.nocomma }
	  if$
        }
     if$
    }
    %% address is not empty
    { organization empty$
        %% organization is empty
        { publisher empty$
	    %% publisher is empty
	    { format.address output.nocomma }
	    %% publisher is not empty
	    { is.kanji.entry
	        { format.publisher "publisher" output.check.nocomma
		  format.address output.nocomma }
		{ format.address output.nocomma
		  format.publisher "publisher" output.check.nocomma }
	      if$
	    }
	 if$
        }
        %% organization is not empty
        { publisher empty$
	    %% publisher is empty
	    { format.organization "organization" output.check.nocomma
	      format.address output.nocomma }
	    %% publisher is not empty
	    { is.kanji.entry
	        { format.organization "organization" output.check.nocomma
		  format.publisher "publisher" output.check.nocomma
		  format.address output.nocomma }
		{ format.organization "organization" output.check.nocomma
		  format.address output.nocomma
		  format.publisher "publisher" output.check.nocomma }
	      if$
	    }
	 if$
        }
     if$
    }
  if$
}

%%% misc 用
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$ " " type * }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    { " " type * }
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

%%% phdthesis の整形
FUNCTION {format.phd}
{ is.kanji.entry
    { bst.phdthesis.jp }
    { bst.phdthesis }
   if$
}

%%% mastersthesis の整形
FUNCTION {format.mthesis}
{ is.kanji.entry
    { bst.mthesis.jp }
    { bst.mthesis }
   if$
}

%%% school の整形
FUNCTION {format.school}
{ school empty$
    { "" }
    { is.kanji.entry
        { bst.school.pre.jp school * bst.school.post.jp * }
        { bst.school.pre school * bst.school.post * }
      if$
    }
  if$
}

%%% institution の整形
FUNCTION {format.institution}
{ institution empty$
    { "" }
    { is.kanji.entry
        { bst.institution.pre.jp institution * bst.institution.post.jp * }
	{ bst.institution.pre institution * bst.institution.post * }
      if$
    }
  if$
}  

%%% hoyakusho の整形
FUNCTION {format.hoyakusho}
{ jauthor empty$
  jkanyaku empty$
  jtitle empty$
  jpublisher empty$
  jyear empty$
  and and and and
    { "" }
    { 
      is.kanji.entry
        { bst.touten.jp *  }
        { ", " *  }
      if$
      jauthor empty$
        { jkanyaku empty$
            { "" }
            { jkanyaku format.names "監訳" * }
          if$
        }
        { jauthor format.names "訳" *
          jkanyaku empty$
            { "" * }
            { bst.touten.jp * jkanyaku format.names * "監訳" * }
          if$
        }
      if$
      jtitle empty$
        { "" * }
        { bst.touten.jp * format.jtitle * bst.touten.jp * }
      if$
      jpublisher empty$
        { "" * }
        { jpublisher * bst.touten.jp * }
      if$
      jyear empty$
        { "" * }
        { "" * jyear convert.year.kanji * "年" * }
      if$
      remove.irrelevant.kutoten
      bst.hoyakusho.pre.jp swap$ * bst.hoyakusho.post.jp *
    }
 if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 \havarditem の出力．

FUNCTION {output.number.index}
{
  bst.use.number.index #0 =
     'skip$
     { index #1 + 'index :=
       "" 'preone :=
       "" 'preten :=
       bst.number.index.digit "1" =
         'skip$
         { bst.number.index.digit "2" =
           { "\hskip0.5em" 'preone := }
           { bst.number.index.digit "3" =
              { "\hskip1em" 'preone :=
                "\hskip0.5em" 'preten := }
              'skip$
             if$
           }
         if$
         }
       if$  
     }
  if$
  newline$
  ""
  % 以下も、number index を付ける場合の処理
  bst.use.number.index #0 =
     'skip$
     { index #10 <
         % number index の桁に応じて前に空白を入れる。
         { preone }
	 { index #100 <
	     { preten }
             { "" }
	   if$
	 }
       if$
       bst.number.index.pre * index int.to.str$ * bst.number.index.post * write$
     }
 if$
}

FUNCTION {output.bibitem}
{ bst.harvarditem.off
    { before.all 'output.state :=
     "" }
    { newline$
      "\harvarditem[" write$
      alabel write$			% alabel が abbreviated citation
      "]{" write$
      flabel write$			% flabel が full citation
      "}{" write$
      is.kanji.entry
         { cyear convert.year.kanji write$ }	% cyear が year
         { cyear write$ }
      if$
      % cyear が year
      "}{" write$
      cite$ write$			% cite$ で keyword がプッシュされる。
      "}" write$
      before.all 'output.state :=
    
      % 以下は、number index を付ける場合の処理
      output.number.index
    }
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 article の処理

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma

  format.journal "journal" output.check.nocomma
  format.vol.num.pages output.nocomma

  bst.year.backward #0 =
    { format.month output.nocomma }
    { format.date output.nocomma }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 book の処理

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check.nocomma }
    { format.authors output.nonnull.nocomma
      "author and editor" editor either.or.check 
    }
  if$
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.book "title" output.check.nocomma

  format.bvolume output.nocomma
  format.number.series output.nocomma
  output.publisher.address

  format.edition output.nocomma
  format.book.pages output.nocomma
  format.hoyakusho output.nocomma
  bst.year.backward #0 =
    'skip$
    { format.year "year" output.check.nocomma }
  if$
  new.block
  note output.nocomma
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	 booklet の処理

FUNCTION {booklet}
{ output.bibitem
  format.authors output.nocomma
  format.year output.nocomma
  format.misc.title "title" output.check.nocomma
  format.howpublished output.nocomma
  format.address output.nocomma
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inbook の処理

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check.nocomma }
    { format.authors output.nonnull.nocomma
      "author and editor" editor either.or.check
    }
  if$
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
%   format.book remove.pre.comma "title" output.check.nocomma
  format.book "title" output.check.nocomma
  format.edition output.nocomma

  format.bvolume output.nocomma
  format.chapter.pages "chapter and pages" output.check.nocomma
  format.number.series output.nocomma
  output.publisher.address
  bst.year.backward #0 =
    'skip$
    { format.year "year" output.check.nocomma }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	incollection の処理

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma

  format.in.ed.booktitle "booktitle" output.check.nocomma
  format.bvolume output.nocomma
  output.address.organization.publisher
  format.edition output.nocomma
  format.chapter.pages output.nocomma
  bst.year.backward #0 =
    'skip$
    { format.year "year" output.check.nocomma }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inproceedings の処理

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma

  format.in.ed.booktitle "booktitle" output.check.nocomma
  format.bvolume output.nocomma
  format.number.series output.nocomma
  format.pages output.nocomma
  output.address.organization.publisher
  bst.year.backward #0 =
    { format.month output.nocomma }
    { format.date output.nocomma }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	conference の処理

FUNCTION {conference}
{ inproceedings }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	manual の処理

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
	'skip$
	{ organization output.nonnull.nocomma
	  address output.nocomma
	}
      if$
    }
    { format.authors output.nonnull.nocomma }
  if$
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.book "title" output.check.nocomma
  author empty$
    { organization empty$
	{ format.address new.block.check
	  format.address output.nocomma
	}
	'skip$
      if$
    }
    { output.address.organization.publisher }
  if$
  format.edition output.nocomma
  bst.year.backward #0 =
    'skip$
    { format.year "year" output.check.nocomma }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	mastersthesis の処理

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma
  format.mthesis format.thesis.type output.nonnull.nocomma
  format.school "school" output.check.nocomma
  format.address output.nocomma
  bst.year.backward #0 =
    'skip$
    { format.year "year" output.check.nocomma }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	misc の処理

FUNCTION {misc}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.misc.title output.nocomma
  format.howpublished output.nocomma
  remove.irrelevant.kutoten
  bst.year.backward #0 =
    { format.month output.nocomma }
    { format.date output.nocomma }
  if$
  new.block
  note output.nocomma
  fin.entry
  empty.misc.check
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	phdthesis の処理

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma
  format.phd
  format.thesis.type output.nonnull.nocomma
  format.school "school" output.check.nocomma
  address empty$
    'skip$
    { format.address output.nocomma }
  if$
  bst.year.backward #0 =
    'skip$
    { format.year "year" output.check.nocomma }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	proceedings の処理

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output.nocomma }
    { format.editors output.nonnull.nocomma }
  if$
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.btitle remove.pre.comma "title" output.check.nocomma
  format.bvolume output.nocomma
  format.number.series output.nocomma
  output.address.organization.publisher
  bst.year.backward #0 =
    'skip$
    { format.year "year" output.check.nocomma }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	techreport の処理

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma
  format.tr.number output.nonnull.nocomma
  format.institution "institution" output.check.nocomma
  format.address output.nocomma
  bst.year.backward #0 =
    'skip$
    { format.year "year" output.check.nocomma }
  if$
  new.block
  note output
  fin.entry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	unpublished の処理

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check.nocomma
  bst.year.backward #0 =
    { format.year "year" output.check.nocomma }
    'skip$
  if$
  format.title "title" output.check.nocomma
  bst.year.backward #0 =
    { format.month remove.pre.comma output.nocomma }
    { format.date remove.pre.comma output.nocomma }
  if$
  new.block
  note "note" output.check.nocomma
  fin.entry
}

FUNCTION {default.type}
{ misc }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	月の略称定義

MACRO {jan} {"January"}
MACRO {feb} {"February"}
MACRO {mar} {"March"}
MACRO {apr} {"April"}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {jul} {"July"}
MACRO {aug} {"August"}
MACRO {sep} {"September"}
MACRO {oct} {"October"}
MACRO {nov} {"November"}
MACRO {dec} {"December"}

%%% エントリを読み込む
READ

%%% エントリーが日本語文献か判断するための関数 (yomi は除く)
FUNCTION {set.is.kanji.entry}
{
  author    field.or.null is.kanji.str$
  title     field.or.null is.kanji.str$ or
  editor    field.or.null is.kanji.str$ or
  journal   field.or.null is.kanji.str$ or
  booktitle field.or.null is.kanji.str$ or
  series    field.or.null is.kanji.str$ or
  'is.kanji.entry :=
}

%%% エントリーが日本語文献か判断するための関数 (yomi も含めて)
FUNCTION {set.is.kanji.entry.two}
{
  author    field.or.null is.kanji.str$
  title     field.or.null is.kanji.str$ or
  editor    field.or.null is.kanji.str$ or
  journal   field.or.null is.kanji.str$ or
  booktitle field.or.null is.kanji.str$ or
  series    field.or.null is.kanji.str$ or
  yomi      field.or.null is.kanji.str$ or
  'is.kanji.entry.two :=
}

%%% 全てのエントリーに対し実行
ITERATE {set.is.kanji.entry}
ITERATE {set.is.kanji.entry.two}

%%% 引用順を保持する変数
INTEGERS { order.num }
FUNCTION {initialize.order.num}
{
  #1 'order.num :=
}
%%% 初期値に1を設定
EXECUTE {initialize.order.num}

%%% 変数 order.cited には引用順の数値が入る．
FUNCTION {set.order.cited}
{
  order.num 'order.cited :=
  #1 order.num + 'order.num :=
}
%%% 全てのエントリーに対し実行
ITERATE {set.order.cited}
  
% FUNCTION {init.field.constants}
% { #0 'author.field :=
%   #1 'editor.field :=
%   #2 'organization.field :=
%   #3 'title.field :=
%   #4 'key.field :=
% }

% EXECUTE {init.field.constants}

%%% 記号を除去し、小文字に変換
FUNCTION {sortify}
{ purify$ "l" change.case$ }

%%% 先頭何文字かを除去する。
FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

%%% label name のフォーマット
FUNCTION {format.lab.names}
{ 's :=
   % name の数 (authorの人数) を numnames に代入．
   s num.names$ 'numnames :=
   numnames #2 >
     % author が3人以上のケース
     { s is.kanji.str$
         % author 名が日本語を含むケース
         { #1 'name.num :=
           s set.alphabet.in.author
           alphabet.in.author #0 =
            % first name も日本語のケース

            % 注：日本語の author は "姓 名" の順で指定されるが、bst では
            % 順番通りに姓＝first name、名＝last name として扱われる。
            { s #1 "{ff}" format.name$ 't :=
              t empty$
                { s #1 "{ll}" format.name$ }
                { s #1 "{ff}" format.name$ }
              if$
            bst.and.others.jp * }

            % first name が alphabet のケース
            { s #1 "{ll}" format.name$ 't :=
              t empty$
                { s #1 "{ff}" format.name$ }
                { s #1 "{ll}" format.name$ }
              if$
            bst.and.others.jp * }
          if$
         }
         % author名がアルファベットのケース
         { s #1 "{ll}" format.name$ bst.and.others * }
       if$
     }
     % 以下は，author<=2 のケース
     { numnames #2 =
         % まず，author=2のケース
         { s is.kanji.str$
             % author 名が日本語を含むケース
             
             % 一人目の処理
             { #1 'name.num :=
               s set.alphabet.in.author
               alphabet.in.author #0 =

                 % first name も日本語のケース
                 % 注：日本語の author は "姓 名" の順で指定されるが、bst では
                 % 順番通りに姓＝first name、名＝last name として扱われる。
                 { s #1 "{ff}" format.name$ 't :=
                   t empty$
                     { s #1 "{ll}" format.name$ }
                     { s #1 "{ff}" format.name$ }
                   if$
                 }

                 % first name が alphabet のケース
                 { s #1 "{ll}" format.name$ 't :=
                   t empty$
                     { s #1 "{ff}" format.name$ }
                     { s #1 "{ll}" format.name$ }
                   if$
                 }
               if$
               % 二人目の処理
               s #2 "{ff~}{vv~}{ll}{, jj}" format.name$ "others" =
                 { bst.and.others.jp * }
                 { bst.cite.and.jp *
                   #2 'name.num :=
                   s set.alphabet.in.author
                   alphabet.in.author #0 =
                     { s #2 "{ff}" format.name$ 't :=
                       t empty$
                         { s #2 "{ll}" format.name$ * }
                         { s #2 "{ff}" format.name$ * }
                       if$
                     }
                     { s #2 "{ll}" format.name$ 't :=
                       t empty$
                         { s #2 "{ff}" format.name$ * }
                         { s #2 "{ll}" format.name$ * }
                       if$
                     }
                   if$
                 }
               if$
             }
             % author が日本語じゃないケース
             { s #1 "{ll}" format.name$
               s #2 "{ff~}{vv~}{ll}{, jj}" format.name$ "others" =
                 { bst.and.others * }
                 { bst.cite.and *
                   s #2 "{ll}" format.name$ *}
               if$
             }
           if$
         }
         % author が一人のとき
         { s is.kanji.str$
             % author 名が日本語のケース
             { #1 'name.num :=
               s set.alphabet.in.author
               alphabet.in.author #0 =

                 % first name も日本語のケース
                 % 注：日本語の author は "姓 名" の順で指定されるが、bst では
                 % 順番通りに姓＝first name、名＝last name として扱われる。
                 { s #1 "{ff}" format.name$ 't :=
                   t empty$
                     { s #1 "{ll}" format.name$ }
                     { s #1 "{ff}" format.name$ }
                   if$
                 }
                 % first name が alphabet のケース
                 { s #1 "{ll}" format.name$ 't :=
                   t empty$
                     { s #1 "{ff}" format.name$ }
                     { s #1 "{ll}" format.name$ }
                   if$
                 }
               if$
             }
             % author 名すべて alphabet のケース
             { s #1 "{ll}" format.name$ }
           if$
         }
       if$
     }
   if$
}

%%% Full author name の label の作成
FUNCTION {format.lab.names.full}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
      { s is.kanji.str$
          % author 名に日本語含むケース

          { nameptr 'name.num :=
            s set.alphabet.in.author
            alphabet.in.author #0 =
              % first name も日本語
              { s nameptr "{ff}" format.name$ 't := }
              % first name が alphabet のケース
              { s nameptr "{ll}" format.name$ 't := }
            if$
	    nameptr #1 >
              { namesleft #1 >
                  { bst.cite.and.jp * t * }
                  { t "others" =
                      { bst.and.others.jp * }
                      { bst.cite.and.jp * t * }
                    if$
                  }
                if$
              }
              't
            if$
            nameptr #1 + 'nameptr :=
            namesleft #1 - 'namesleft :=
          }

          % author 名に日本語含まないケース
          { s nameptr "{vv~}{ll}" format.name$ 't :=
              nameptr #1 >
                { namesleft #1 >
                    { ", " * t * }
                    { t "others" =
                        { bst.and.others * }
                        { numnames #2 > 
                           { bst.cite.ands * t * }
                           { bst.cite.and * t * }
                          if$
                        }
                      if$
                    }
                  if$
                }
                't
              if$
              nameptr #1 + 'nameptr :=
              namesleft #1 - 'namesleft :=
          }
        if$
      }
    while$
    numnames #1 > #1 #2 = and {", eds" *} {} if$
    numnames #1 = #1 #2 = and {", ed" *} {} if$
}

%%% これは sort 用の名前を作成
FUNCTION {author.key.label}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	{ key #3 text.prefix$ }
      if$
    }
    { yomi empty$
       { author format.lab.names }
       { bst.mixed.order #0 = 
          { author format.lab.names }
          { yomi format.lab.names }
	if$
      }
      if$
    }
  if$
}

%%% これは abbreviated author 名
FUNCTION {author.key.label.abb}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

%%% これは full author 名
FUNCTION {author.key.label.full}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names.full }
  if$
}

%%% これは sort 用の名前を作成
FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    { key #3 text.prefix$ }
	  if$
	}
        { yomi empty$
           { editor format.lab.names }
           { bst.mixed.order #0 = 
              { editor format.lab.names }
              { yomi format.lab.names }
    	if$
          }
          if$
        }
      if$
    }
    { yomi empty$
       { author format.lab.names }
       { bst.mixed.order #0 = 
          { author format.lab.names }
          { yomi format.lab.names }
	if$
      }
      if$
    }
  if$
}

%%% これは abbreviated author 名を作成する関数
FUNCTION {author.editor.key.label.abb}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    { key #3 text.prefix$ }
	  if$
	}
 	{ editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

%%% これは full author 名
FUNCTION {author.editor.key.label.full}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    { key #3 text.prefix$ }
	  if$
	}
	{ editor format.lab.names.full }
      if$
    }
    { author format.lab.names.full }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
	{ organization empty$
	    { cite$ #1 #3 substring$ }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
	{ organization empty$
	    { cite$ #1 #3 substring$ }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { editor format.lab.names }
  if$
}

%%% 与えられた数を変換: 0->9, 1->8, 2->7,..., 9->0 という対応関係。
FUNCTION {reverse.num}
{ 's :=
  s "1" =
    { "8" 'year.num := }
    { s "2" =
        { "7" 'year.num := }
        { s "3" =
            { "6" 'year.num := }
            { s "4" =
                { "5" 'year.num := }
                { s "5" =
                    { "4" 'year.num := }
                    { s "6" =
                        { "3" 'year.num := }
                        { s "7" =
                            { "2" 'year.num := }
                            { s "8" =
                                { "1" 'year.num := }
                                { s "9" =
                                    { "0" 'year.num := }
                                    { s "0" =
                                        { "9" 'year.num := }
                                        { "9" 'year.num := }
                                    if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
  if$
  year.num
}

%%% year を変換 (大きい数字 → 小さい数字)
FUNCTION {convert.year}
{ 't := 
  bst.reverse.year #0 =
    % 普通の year の並び順
    { t 'tt := }
    % year の並び順をひっくり返すケース (新しいほど先に表示するケース)。
    { t #1 #1 substring$ reverse.num 
      t #2 #1 substring$ reverse.num *
      t #3 #1 substring$ reverse.num *
      t #4 #1 substring$ reverse.num * 'tt := }
  if$
  tt
}

%%% cyear を計算． cyear は引用部分で表示される年を保持する変数．reference 部
%%% 分の表示には関係ない．また同時にここで sort.label を計算している．
%%% sort.label は文献の sort のために利用される author (editor) 名を保持する変数．
FUNCTION {calc.cyear}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
	'editor.key.organization.label
	{ type$ "manual" =
	    'author.key.organization.label
	    'author.key.label
	  if$
	}
      if$
    }
  if$
  duplicate$
  year 'cyear :=
  " " year convert.year * field.or.null *
  sortify 'sort.label :=
  % For debug
  jecon.debug #0 = not
    { "sort.label = ``\texttt{" write$
      sort.label write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
}

%%% flabel を計算．flabel は引用部分の著者名を保持する変数．reference 部分には
%%% 関係ない．
FUNCTION {calc.flabel}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label.full
    { type$ "proceedings" =
	'editor.key.organization.label
	{ type$ "manual" =
	    'author.key.organization.label
	    'author.key.label.full
	  if$
	}
      if$
    }
  if$
  'flabel :=
  % For debug
  jecon.debug #0 = not
    { "flabel = ``\texttt{" write$
      flabel write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
}

%%% alabel を計算．alabel は引用部分の著者名 (短縮形表示) を保持する変数．
%%% reference 部分は関係ない．
FUNCTION {calc.alabel}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label.abb
    { type$ "proceedings" =
	'editor.key.organization.label
	{ type$ "manual" =
	    'author.key.organization.label
	    'author.key.label.abb
	  if$
	}
      if$
    }
  if$
  'alabel :=
  % For debug
  jecon.debug #0 = not
    { "alabel = ``\texttt{" write$
      alabel write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
}

%%% ソート用に名前を加工
FUNCTION {sort.format.names}
{ 's :=
  yomi empty$
     'skip$
     { yomi 's := }
  if$
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { s is.kanji.str$
	   { bst.cite.and.jp * }
    	   { ", " * }
	  if$
	}
	'skip$
      if$
      s is.kanji.str$
         { s nameptr "{ff}{ ll}" format.name$ 't := }
         { s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't := }
      if$
      nameptr numnames = t "others" = and
 	{ s is.kanji.str$
  		{ bst.and.others.jp * }
 		{ bst.and.others *}
	  if$
 	}
	{ t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

%%% ソート用に title を加工
FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

%%% ソート用に author を加工
FUNCTION {author.sort}
{ author empty$
    { key empty$
	{ "to sort, need author or key in " cite$ * warning$
	  ""
	}
	{ key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

%%% ソート用に editor を加工
FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
	{ key empty$
	    { "to sort, need author, editor, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
	{ key empty$
	    { "to sort, need author, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
	{ key empty$
	    { "to sort, need editor, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

%%% 順序をソートするために yomi を加工する。
FUNCTION {yomi.label}
{ yomi is.kanji.str$
    % yomi がひらがなのケース。year (+ month) を付け足すのみ。
    { yomi " " * year convert.year * }
    % yomi が alphabet のケース。名前を加工してから小文字に変換し、year を
    % 付け足す
    { yomi format.lab.names "l" change.case$ " " * year convert.year * }
  if$
}

%%% 数字が一文字 (つまり, 1,...,9等) ならその前に 00 を，数字が二文字
%%% (10,...,99) なら 0 を付ける．10, 11, 12 の指定が 2, 3, 4,... よりも優先さ
%%% れるのを防ぐため。
FUNCTION {add.zero.to.number}
{ 's :=
    s text.length$ #1 =
      { "00" s * }
      { s text.length$ #2 =
          { "0" s * }
          { s }
        if$
      }
   if$
}

%% entry type に数値を割当てる．数値が小さいほうが bst.sort.entry.type が非ゼ
%% ロのときに先に列挙されることになる．
FUNCTION {bst.sort.entry.type.order}
{ 'item.type :=
  item.type "article" =
    { "01" }
    { item.type "book" =
        { "02" }
        { item.type "booklet" =
            { "03" }
            { item.type "comment" =
                { "04" }
                { item.type "conference" =
                    { "05" }
                    { item.type "inbook" =
                        { "06" }
                        { item.type "incollection" =
                            { "07" }
                            { item.type "inproceedings" =
                                { "08" }
                                { item.type "manual" =
                                    { "09" }
                                    { item.type "masterthesis" =
                                        { "10" }
                                        { item.type "misc" =
                                           { "11" }
                                           { item.type "phdthesis" =
                                              { "12" }
                                              { item.type "proceedings" =
                                                 { "13" }
                                                 { item.type "techreport" =
                                                    { "14" }
                                                    { item.type "unpublished" =
                                                       { "15" }
                                                       { "16" }
                                                      if$
                                                    }
                                                   if$
                                                 }
                                                if$
                                              }
                                             if$
                                           }
                                          if$
                                        }
                                      if$
                                    }
                                if$
                                }
                            if$
                            }
                        if$
                        }
                    if$
                    }
                if$
                }
            if$
            }
        if$
        }
    if$
    }
  if$
}

%%% まず、author -> year -> absorder -> order -> month -> title で sort.key$ を
%%% 作成する。一回目のソートで利用する．
FUNCTION {presort.one}
{
  calc.cyear
  pop$
  ""
  is.kanji.entry.two
    { yomi empty$
       { sort.label * }
       { yomi.label * }
      if$
    }
    { sort.label * }
  if$
  " " *  
  type$ "book" = type$ "inbook" = or
    'author.editor.sort
    { type$ "proceedings" =
	'editor.organization.sort
	{ type$ "manual" =
	    'author.organization.sort
  	    'author.sort
	  if$
	}
      if$
    }
  if$
  % 
  bst.no.sort #0 = not
    { * order.cited int.to.str$ add.zero.to.number * " " * }
    { * " " * }
  if$
  %
  title is.kanji.str$ 
    { bst.mixed.order #0 =
       { "" }
       { " " }
     if$
    }
    { " " }
  if$
  "" *
  bst.sort.entry.type #0 = not
    { type$ bst.sort.entry.type.order * " " * }
    'skip$
  if$
  absorder empty$
    % absorder が empty のときは 0 のときと一緒 /// (これは数字よりは前)
    { "/// " * }
    { bst.notuse.absorder.field #0 =
       { absorder "999" =
          % 999 のときは zz 
          { "zzz " * }
          { absorder add.zero.to.number "000" =
             % 000 のときは /// (これは数字よりは前)
             { "/// " * }
             { absorder add.zero.to.number * " " * }
            if$
          }
         if$
       }
       % absorder field を参照しない場合は ///
       { "/// " * }
      if$
    }
  if$
  " " *
  order empty$
    % order が empty のときは 0 のときと一緒で /// (これは数字よりは前)
    { "/// " * }
    { bst.notuse.order.field #0 =
       { order "999" =
          % 999 のときは zz 
          { "zzz " * }
          { order add.zero.to.number "000" =
             % 000 のときは /// (これは数字よりは前)
             { "/// " * }
             { order add.zero.to.number * " " * }
            if$
          }
         if$
       }
       % order field を参照しない場合は ///
       { "/// " * }
      if$
    }
  if$
  month empty$
    % month が empty のときは 0 のときと一緒で /// (これは数字よりは前)
    { * "/// " * }
       { month "999" =
          % 999 のときは zz 
          { * month add.zero.to.number * "zzz " * }
          { month add.zero.to.number "000" =
             % 000 のときは /// (これは数字よりは前)
             { * month add.zero.to.number * "/// " * }
             { * month add.zero.to.number * " " * }
            if$
          }
         if$
       }
  if$
  title field.or.null sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
  % For debug．デバッグするときにはこの関数で作成される sort.key$の中身を出力
  % する．
  jecon.debug #0 = not
    { "\verb|sort.key$| = ``\texttt{" write$
      sort.key$ write$
      "}''\\" write$
      newline$
    }
    'skip$
  if$
}

%%% これは absorder -> author -> year -> order -> month -> title で sort.key$ を
%%% 作成する。最終的な並べ替えはこちらで指定する sort.key$ でおこなう。
FUNCTION {presort.two}
{
  bst.no.sort #0 = not
    %% 並べ替えしない(引用順でそのまま並べる)ケースのための設定．
    { order.cited int.to.str$ add.zero.to.number " " * }
    { "" }
  if$
  bst.sort.year #0 = not
    %% year をキーとして並べるための設定．
    { is.kanji.entry.two
        %% 日本語文献
        { year convert.year * }
        %% 英語文献
        { year convert.year * }
      if$
    }
    'skip$
  if$
  bst.sort.entry.type #0 = not
    %% エントリーのタイプ別に分けて並べるための設定．
    { type$ bst.sort.entry.type.order * " " * }
    'skip$
  if$
  absorder empty$
    % absorder が empty のときは 0 のときと一緒 /// (これは数字よりは前)
    { "/// " * }
    { bst.notuse.absorder.field #0 =
       { absorder "999" =
          % 999 のときは zz 
          { "zzz " * }
	  { absorder add.zero.to.number "000" =
	     % 000 のときは /// (これは数字よりは前)
	     { "/// " * }
	     { absorder add.zero.to.number * " " * }
	    if$
	  }
	 if$
       }
       % absorder field を参照しない場合は ///
       { "/// " * }
      if$
    }
  if$
  " " *
  is.kanji.entry.two
    { yomi empty$
       { sort.label * }
       { yomi.label * }
      if$
    }
    { sort.label * }
  if$
  " " *  
  type$ "book" = type$ "inbook" = or
    'author.editor.sort
    { type$ "proceedings" =
	'editor.organization.sort
	{ type$ "manual" =
	    'author.organization.sort
  	    'author.sort
	  if$
	}
      if$
    }
  if$
  * " " *
  title is.kanji.str$
    { bst.mixed.order #0 =
       { "" }
       { " " }
     if$
    }
    { " " }
  if$
  order empty$
    % order が empty のときは 0 のときと一緒で /// (これは数字よりは前)
    { "/// " * }
    { bst.notuse.order.field #0 =
       { order "999" =
          % 999 のときは zz 
          { "zzz " * }
	  { order add.zero.to.number "000" =
	     % 000 のときは /// (これは数字よりは前)
	     { "/// " * }
	     { order add.zero.to.number * " " * }
	    if$
	  }
	 if$
       }
       % order field を参照しない場合は ///
       { "/// " * }
      if$
    }
  if$
  month empty$
    % month が empty のときは 0 のときと一緒で /// (これは数字よりは前)
    { * "/// " * }
       { month "999" =
          % 999 のときは zz 
          { * month add.zero.to.number * "zzz " * }
	  { month add.zero.to.number "000" =
	     % 000 のときは /// (これは数字よりは前)
	     { * month add.zero.to.number * "/// " * }
	     { * month add.zero.to.number * " " * }
	    if$
	  }
	 if$
       }
  if$
  title field.or.null sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
  % For debug．デバッグするときにはこの関数で作成される sort.key$の中身を出力
  % する．
  jecon.debug #0 = not
    { "``\texttt{" write$
      sort.key$ write$
      "}''\\" write$
      newline$
    }
    'skip$
 if$
}

%%% 以下はデバッグ用のコード
FUNCTION {calc.alabel.mess}
{ jecon.debug #0 = not
    { "\textbf{Iteration of calc.alabel}\\" write$
      newline$ }
    'skip$
 if$
}
FUNCTION {calc.flabel.mess}
{ jecon.debug #0 = not
    { "\textbf{Iteration of calc.flabel}\\" write$
      newline$ }
    'skip$
 if$
}
FUNCTION {presort.one.mess}
{ jecon.debug #0 = not
    { "\textbf{Iteration of presort.one (ソート1回目)}\\" write$
      newline$ }
    'skip$
 if$
}
FUNCTION {presort.two.mess}
{ jecon.debug #0 = not
    { "\textbf{Iteration of presort.two (ソート2回目)}\\" write$
      newline$ }
    'skip$
 if$
}
%%% デバッグ用コードここまで．

%%% alabel の作成
EXECUTE {calc.alabel.mess}
ITERATE {calc.alabel}

%%% flabel の作成
EXECUTE {calc.flabel.mess}
ITERATE {calc.flabel}

%%% presort の実行 
EXECUTE {presort.one.mess}
ITERATE {presort.one}

%%% sort.key$ を利用して文献の並べ替え．一回目の並べ替え．

% これは仮の並び順を決めるためのもので，最終的にはもう一度並べ替えをおこなう．
% 二回並び替えをするのは bst.mixed.order で指定する "同じ年に同じ著者の英語、
% 日本語文献の両方があり、かつ日本語文献の yomi に英語文献の著者と同じものが指
% 定してあるときに、両者を混ぜて表示する"に対応するため．

SORT

% \bysame を使う場合は、sort.label が前回のものと同一であれば、extra.labelをセット
% author が前回のものと同一であれば、extra.label.bysameをセット
FUNCTION {forward.pass}
{ bst.use.bysame #0 =
%   bst.no.sort #0 = not or
    % \bysame を使わない場合
    { last.sort.label sort.label =
        { last.extra.num #1 + 'last.extra.num :=
          last.extra.num int.to.chr$ 'extra.label :=
        }
        { "a" chr.to.int$ 'last.extra.num :=
          "" 'extra.label :=
          sort.label 'last.sort.label :=
        }
      if$
    }
    % \bysame を使う場合
    { last.sort.label sort.label =
        { last.extra.num #1 + 'last.extra.num :=
          last.extra.num int.to.chr$ 'extra.label :=
        }
        { "a" chr.to.int$ 'last.extra.num :=
          "" 'extra.label :=
          sort.label 'last.sort.label :=
        }
      if$
      author empty$
        { editor empty$
          { "" }
          'format.editors
          if$
        }
        'format.authors
      if$
      'this.author :=
      % format.names 'this.author :=
      this.author prev.author =
        { "bysame" 'extra.label.bysame := }
        { this.author "" =
            { "abcxyz" }
            'this.author
          if$
          'prev.author :=
        }
      if$
    }
  if$
}

%%% 同じ年、同じ著者の文献が複数あるときの year に a を付けるための関数
FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label empty$ not
    { cyear extra.label * }
    { cyear "" * }
  if$
  "" field.or.null *
  'cyear :=
  extra.label 'next.extra :=
}

%%% \bysame を付ける。
ITERATE {forward.pass}

%%% 同じ著者の同じ年の文献が複数あるとき a を付ける。
REVERSE {reverse.pass}

%%% ２回目の並べ替え．これで最終的に文献の並び順が選択される．
EXECUTE {presort.two.mess}
ITERATE {presort.two}

%%% sort.key$ を利用して文献の並べ替え (２回目)
SORT

FUNCTION{punctuation}
{
  "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"  write$ newline$
  "%"                                                                    write$ newline$
  "%  This bbl file is created by jecon.bst ver." jecon.version *        write$ newline$
  "%  The latest jecon.bst is available at"                              write$ newline$
  "%  <http://shirotakeda.org/home-ja/tex-ja/jecon-ja.html>"             write$ newline$
  "%"                                                                    write$ newline$
  "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"  write$ newline$
  newline$
}

EXECUTE {punctuation}

FUNCTION {begin.bib}
{
  preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  bst.use.bysame #0 =
     % \bysame を使わないケース
     'skip$
     % \bysame を使うケース
     { "%%% Definition of \bysame" write$ newline$
       "\ifx\undefined\bysame" write$ newline$
       "\newcommand{\bysame}{" bst.bysame.definition * "}" *
       write$ newline$
       "\fi" write$ newline$ newline$ }
  if$
  %% 数字を漢数字に変換するときの
  bst.kansuji.jp #0 =
     'skip$
     { "%%% Definition of \tatebo" write$ newline$
       "\ifx\undefined\tatebo" write$ newline$
       "\newcommand{\tatebo}{" bst.tatebo.definition * "}" *
       write$ newline$
       "\fi" write$ newline$ newline$ }
  if$
  %% 文献に number index を付けるときの:
  bst.use.number.index #0 =
     'skip$
     { bst.number.index.digit "1" =
         % 一桁のとき
         { bst.number.index.bibhang.one }
         { bst.number.index.digit "2" =
            % 二桁のとき
            { bst.number.index.bibhang.ten }
            % 三桁以上のとき
            { bst.number.index.bibhang.hund }
           if$
         }
       if$
       'hang :=
       "%%% Redefinition of \bibhang" write$ newline$
       "\ifx\undefined\bibhang" write$ newline$
       "\relax" write$ newline$
       "\else" write$ newline$
       "\setlength{\bibhang}{"
       hang * "}" * write$ newline$ 
       "\fi" write$ newline$ newline$
       }
  if$

  bst.thebibliography.begin
  newline$

  %% 変数 index を初期化している．
  #0 'index :=
}

FUNCTION {end.bib}
{
  newline$
  bst.thebibliography.end
  newline$
 }

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

%% 各エントリーにそのエントリーのタイプを実行する．つまり，article エントリー
%% には article という関数を実行する等．
ITERATE {call.type$}

EXECUTE {end.bib}

% 終．

%  --------------------
%  Local Variables:
%  fill-column: 78
%  mode: bst
%  End:

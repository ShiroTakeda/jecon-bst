
if not exist .\pdf mkdir .\pdf

@title 1st platex on %1
call platex --kanji=utf8 ./%1.tex

@title pbibtex on %1
call pbibtex --kanji=utf8 ./%1

@title 2nd platex on %1
call platex --kanji=utf8 ./%1.tex

@title 3rd platex on %1
call platex --kanji=utf8 ./%1.tex

@title dvipdfmx on %1
call dvipdfmx -d 5 -f msembed.map %1

cp ./%1.pdf ./pdf

rm ./%1.log
rm ./%1.aux
rm ./%1.blg
rm ./%1.bbl
rm ./%1.out
rm ./%1.dvi

exit

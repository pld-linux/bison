.\" {PTM/LK/0.1/29-09-1998/"generator parserów"}
.\" T³umaczenie: 29-09-1998 £ukasz Kowalczyk (lukow@tempac.okwf.fuw.edu.pl)
.TH bison 1 local
.SH NAZWA
bison \- generator parserów w wersji GNU (zastêpuje program yacc)
.SH SK£ADNIA
.B bison
[
.BI \-b  " przedrostek-nazwy-pliku"
] [
.BI \-\-file-prefix= przedrostek-nazwy-pliku
] [
.B \-d
] [
.B \-\-defines
] [
.B \-k
] [
.B \-\-token-table
] [
.B \-l
] [
.B \-\-no-lines
] [
.B \-n
] [
.B \-\-no-parser
] [
.BI \-o " plik-wyj¶ciowy"
] [
.BI \-\-output-file= plik-wuj¶ciowy
] [
.BI \-p " przedrostek"
] [
.BI \-\-name-prefix= przedrostek
] [
.B \-r
] [
.B \-\-raw
] [
.B \-t
] [
.B \-\-debug
] [
.B \-v
] [
.B \-\-verbose
] [
.B \-V
] [
.B \-\-version
] [
.B \-y
] [
.B \-\-yacc
] [
.B \-h
] [
.B \-\-help
] [
.B \-\-fixed-output-files
]
plik
.SH OPIS
.I bison
jest generatorem parserów w stylu programu
.IR yacc (1)
i powinien byæ zgodny z plikami wej¶ciowymi stworzonym dla tego programu.
.PP
Pliki wej¶ciowe powinny mieæ rozszerzenie 
.B .y
zgodnie z konwencj± programu
.IR yacc .
W przeciwieñstwie do plików tworzonych przez program
.IR yacc ,
pliki wuj¶ciwe nie maj± sta³ego przedrostka nazw, lecz u¿ywaj± przedrostka 
nazwy pliku wej¶ciowego. Na przyk³ad, plik z opisem gramatyki o nazwie
.B parse.y
pos³u¿y do stworzenia parsera w pliku o nazwie
.BR parse.tab.c ,
zamiast
.BR y.tab.c ,
jak w programie
.IR yacc .
.PP
Ten opis opcji rozpoznawanych przez program
.I bison
zosta³ zaadaptowany z rozdzia³u
.B Invocation
pochodz±cego z opisu
.BR bison.texinfo ,
który powinien byæ traktowany jako autorytatywne ¼ród³o informacji.
.PP
.I bison
rozpoznaje zarówno tradycyjne, jednoliterowe opcje, jak i ³atwe do
zapamiêtania, d³ugie nazwy opcji.
D³ugie nazwy opcji rozpoczynaj± siê od
.BR \-\- ,
zamiast
.BR \- .
Mog± byæ one skracane do takiej d³ugo¶ci, aby nadal by³y
unikalne. Je¿eli po d³ugiej opcji musi nastepowaæ jej parametr, musi on byæ
po³±czony z nazw± opcji znakiem
.BR = .
.SS OPCJE
.TP
.BI \-b " przedrostek-pliku"
.br
.ns
.TP
.BI \-\-file-prefix= "przedrostek pliku"
Okre¶la przedrostek nazwy pliku stosowany do wszystkich plików wyj¶ciowych.
Nazwy s± tworzone zgodnie z nastêpuj±cym wzorem:
\fIfile-prefix\fB.c\fR.
.TP
.B \-d
.br
.ns
.TP
.B \-\-defines
Utwórz dodatkowy plik z definicjami makrointrukcji dla nazw symboli
terminalnych zdefiniowanych w pliku gramatyki oraz z definicj± typu warto¶ci
semantycznej
.BR YYSTYPE ,
jak równie¿ z deklaracjami zmiennych zewnêtrznych.
.sp
Je¿eli plik z parserem nosi nazwê \fInazwa\fB.c\fR, to plik z definicjami 
zostanie nazwany \fInazwa\fB.h\fR.
.sp
Ten plik jest niezbêdny, je¿eli chcesz umie¶ciæ definicjê funkcji
.B yylex
w oddzielnym pliku ¼ród³owym, poniewa¿ funkcja
.B yylex
musi mieæ dostêp do kodów symboli terminalnych oraz do zmiennej
.BR yylval .
.TP
.B \-r
.br
.ns
.TP
.B \-\-raw
Numery symboli terminalnych znajduj±ce siê w pliku \fInazwa\fB.h\fR s±
zazwyczaj kompatybilne z programem Yacc. Je¿eli podana zostanie ta opcja,
u¿yta zostanie numeracja charakterystyczna dla programu Bison. (numeracja
programu Yacc rozpoczyna siê od 257, z wyj±tkiem symboli jednoznakowych;
Bison numeruje wszystkie symbole po kolei poczynaj±c od liczby 3).
.TP
.B \-k
.br
.ns
.TP
.B \-\-token-table
Ta opcja powoduje, ¿e w pliku \fIname\fB.tab.c\fR znajdzie siê lista symboli
terminalnych posortowana pod wzglêdem warto¶ci symboli (nie nazw); jest to
zdefiniowane w tablicy 
.IR yytname .
W pliku znajd± siê równie¿ definicje sta³ych
.IR YYNTOKENS ,
.IR YYNNTS ,
.IR YYNRULES ,
i 
.IR YYNSTATES .
.TP
.B \-l
.br
.ns
.TP
.B \-\-no-lines
Nie umieszczaj w pliku z parserem poleceñ 
.B #line 
dla preprocesora. Normalnie 
.I bison
umieszcza je w tym pliku, aby kompilator oraz debuggery wykazywa³y b³êdy w
kontek¶cie twojego pliku ¼ród³owego z gramatyk±. Ta opcja powoduje, ¿e b³êdy
bêd± wykazywane w kontek¶cie pliku zawieraj±cego parser, traktuj±c go jak
niezale¿ny plik na równych prawach.
.TP
.B \-n
.br
.ns
.TP
.B \-\-no-parser
Nie generuj kodu parsera; generuj tylko deklaracje. Utworzony plik
\fIname\fB.tab.c\fR bêdzie zawiera³ wy³±cznie deklaracje sta³ych. Dodatkowo,
w pliku \fIname\fB.act\fR znajdzie siê wyra¿enie switch zawieraj±ce
wszystkie przet³umaczone definicje akcji.
.TP
.BI \-o " plik-wyj¶ciowy"
.br
.ns
.TP
.BI \-\-output-file= plik-wyj¶ciowy
Okre¶l nazwê 
.I "pliku wyj¶ciowego" 
zawieraj±cego definicjê parsera.
.sp
Nazwy pozosta³ych plików s± tworzone z nazwy
.I "pliku wej¶ciowego"
zgodnie z zasadami opisanymi przy opcjach
.B \-v
i
.BR \-d .

.TP
.BI \-p " przedrostek"
.br
.ns
.TP
.BI \-\-name-prefix= przedrostek
Przedrostek nazw zewnêtrznych symboli u¿ywanych przez parser. Zastêpuje
standardowy przedrostek
.BR yy .
Symbole, których nazwy ulegn± zmianie, to
.BR yyparse ,
.BR yylex ,
.BR yyerror ,
.BR yylval ,
.BR yychar , 
i
.BR yydebug .
.sp
Na przyk³ad, je¿eli u¿yjesz opcji
.BR "\-p c" ,
wówczas powy¿sze nazwy bêd± mia³y postaæ
.BR cparse ,
.BR clex ,
itd.
.TP
.B \-t
.br
.ns
.TP
.B \-\-debug
Umie¶æ w pliku z parserem makrodefinicjê
.B YYDEBUG
aby skompilowany zosta³ kod pomagaj±cy diagnozowaæ problemy (debug code).
.TP
.B \-v
.br
.ns
.TP
.B \-\-verbose
Utwórz dodatkowy plik z dok³adnym opisami stanów parsera i akcji
podejmowanych dla ka¿dego kolejnego symbolu w tych stanach.
.sp
Ten plik opisuje równie¿ wszystkie konflikty; zarówno te rozwik³ane przez
nastêpstwo operatorów, jak i te nierozwik³ane.
.sp
Nazwa pliku z opisem jest tworzona przez usuniêcie
.B .tab.c
lub
.B .c
z nazwy pliku zawieraj±cego parser i dodanie
.BR .output .
.sp
Na przyk³ad, je¿eli plikiem wej¶ciowym jest
.BR foo.y ,
wówczas plik zawierj±cy parser nosi nazwê
.BR foo.tab.c .
Plik z opisem stanów bêdzie nazwany
.BR foo.output .
.TP
.B \-V
.br
.ns
.TP
.B \-\-version
Wypisz numer wersji i zakoñcz dzia³anie programu
.TP
.B \-h
.br
.ns
.TP
.B \-\-help
Wypisz spis opcji i zakoñcz dzia³anie programu.
.TP
.B \-y
.br
.ns
.TP
.B \-\-yacc
.br
.ns
.TP
.B \-\-fixed-output-files
Ma to samo dzia³anie, co opcja
.BR "\-o y.tab.c" ;
Plik zawieraj±cy parser nosi nazwê
.BR y.tab.c ,
a pozosta³e pliki
.B y.output
i
.BR y.tab.h .
Ta opcja powoduje na¶ladowanie konwencji programu 
.I yacc
nazywania plików.
Poni¿szy skrypt mo¿e byc u¿ywany jako program
.IR yacc :
.sp
.RS
.ft B
bison \-y $*
.ft R
.sp
.RE
.PP
D³ugie nazwy opcji mog± byæ równie¿ poprzedzane przez
`+' zamiast `\-\-', ze wzglêdu na kompatybilno¶æ z poprzednimi wersjami.
W przysz³o¶ci ta mo¿liwo¶æ ma byæ usuniêta, poniewa¿ jest niekompatybilna ze
standardem POSIX.2
.SH PLIKI
/usr/lib/bison.simple	prosty parser
.br
/usr/lib/bison.hairy	skomplikowany parser
.SH ZOBACZ TAK¯E
.IR yacc (1)
.br
Opis
.IR "Bison Reference Manual" ,
zawarty w pliku
.B bison.texinfo
w dystrybucji ¼ród³owej programu
.I bison
.SH DIAGNOSTYKA
Wszystkiego mo¿na siê ³atwo domy¶liæ.

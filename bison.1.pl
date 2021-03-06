.\" {PTM/LK/0.1/29-09-1998/"generator parser�w"}
.\" T�umaczenie: 29-09-1998 �ukasz Kowalczyk (lukow@tempac.okwf.fuw.edu.pl)
.\" $Id$
.TH bison 1 local
.SH NAZWA
bison \- generator parser�w w wersji GNU (zast�puje program yacc)
.SH SK�ADNIA
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
.BI \-o " plik-wyj�ciowy"
] [
.BI \-\-output-file= plik-wyj�ciowy
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
jest generatorem parser�w w stylu programu
.IR yacc (1)
i powinien by� zgodny z plikami wej�ciowymi stworzonym dla tego programu.
.PP
Pliki wej�ciowe powinny mie� rozszerzenie 
.B .y
zgodnie z konwencj� programu
.IR yacc .
W przeciwie�stwie do plik�w tworzonych przez program
.IR yacc ,
pliki wyj�ciowe nie maj� sta�ego przedrostka nazw, lecz u�ywaj� przedrostka 
nazwy pliku wej�ciowego. Na przyk�ad, plik z opisem gramatyki o nazwie
.B parse.y
pos�u�y do stworzenia parsera w pliku o nazwie
.BR parse.tab.c ,
zamiast
.BR y.tab.c ,
jak w programie
.IR yacc .
.PP
Ten opis opcji rozpoznawanych przez program
.I bison
zosta� zaadaptowany z rozdzia�u
.B Invocation
pochodz�cego z opisu
.BR bison.texinfo ,
kt�ry powinien by� traktowany jako autorytatywne �r�d�o informacji.
.PP
.I bison
rozpoznaje zar�wno tradycyjne, jednoliterowe opcje, jak i �atwe do
zapami�tania, d�ugie nazwy opcji.
D�ugie nazwy opcji rozpoczynaj� si� od
.BR \-\- ,
zamiast
.BR \- .
Mog� by� one skracane do takiej d�ugo�ci, aby nadal by�y
unikalne. Je�eli po d�ugiej opcji musi nastepowa� jej parametr, musi on by�
po��czony z nazw� opcji znakiem
.BR = .
.SS OPCJE
.TP
.BI \-b " przedrostek-pliku"
.br
.ns
.TP
.BI \-\-file-prefix= "przedrostek pliku"
Okre�la przedrostek nazwy pliku stosowany do wszystkich plik�w wyj�ciowych.
Nazwy s� tworzone zgodnie z nast�puj�cym wzorem:
\fIfile-prefix\fB.c\fR.
.TP
.B \-d
.br
.ns
.TP
.B \-\-defines
Utw�rz dodatkowy plik z definicjami makroinstrukcji dla nazw symboli
terminalnych zdefiniowanych w pliku gramatyki oraz z definicj� typu warto�ci
semantycznej
.BR YYSTYPE ,
jak r�wnie� z deklaracjami zmiennych zewn�trznych.
.sp
Je�eli plik z parserem nosi nazw� \fInazwa\fB.c\fR, to plik z definicjami 
zostanie nazwany \fInazwa\fB.h\fR.
.sp
Ten plik jest niezb�dny, je�eli chcesz umie�ci� definicj� funkcji
.B yylex
w oddzielnym pliku �r�d�owym, poniewa� funkcja
.B yylex
musi mie� dost�p do kod�w symboli terminalnych oraz do zmiennej
.BR yylval .
.TP
.B \-r
.br
.ns
.TP
.B \-\-raw
Numery symboli terminalnych znajduj�ce si� w pliku \fInazwa\fB.h\fR s�
zazwyczaj kompatybilne z programem Yacc. Je�eli podana zostanie ta opcja,
u�yta zostanie numeracja charakterystyczna dla programu Bison. (numeracja
programu Yacc rozpoczyna si� od 257, z wyj�tkiem symboli jednoznakowych;
Bison numeruje wszystkie symbole po kolei poczynaj�c od liczby 3).
.TP
.B \-k
.br
.ns
.TP
.B \-\-token-table
Ta opcja powoduje, �e w pliku \fIname\fB.tab.c\fR znajdzie si� lista symboli
terminalnych posortowana pod wzgl�dem warto�ci symboli (nie nazw); jest to
zdefiniowane w tablicy 
.IR yytname .
W pliku znajd� si� r�wnie� definicje sta�ych
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
Nie umieszczaj w pliku z parserem polece� 
.B #line 
dla preprocesora. Normalnie 
.I bison
umieszcza je w tym pliku, aby kompilator oraz debuggery wykazywa�y b��dy w
kontek�cie twojego pliku �r�d�owego z gramatyk�. Ta opcja powoduje, �e b��dy
b�d� wykazywane w kontek�cie pliku zawieraj�cego parser, traktuj�c go jak
niezale�ny plik na r�wnych prawach.
.TP
.B \-n
.br
.ns
.TP
.B \-\-no-parser
Nie generuj kodu parsera; generuj tylko deklaracje. Utworzony plik
\fIname\fB.tab.c\fR b�dzie zawiera� wy��cznie deklaracje sta�ych. Dodatkowo,
w pliku \fIname\fB.act\fR znajdzie si� wyra�enie switch zawieraj�ce
wszystkie przet�umaczone definicje akcji.
.TP
.BI \-o " plik-wyj�ciowy"
.br
.ns
.TP
.BI \-\-output-file= plik-wyj�ciowy
Okre�l nazw� 
.I "pliku wyj�ciowego" 
zawieraj�cego definicj� parsera.
.sp
Nazwy pozosta�ych plik�w s� tworzone z nazwy
.I "pliku wej�ciowego"
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
Przedrostek nazw zewn�trznych symboli u�ywanych przez parser. Zast�puje
standardowy przedrostek
.BR yy .
Symbole, kt�rych nazwy ulegn� zmianie, to
.BR yyparse ,
.BR yylex ,
.BR yyerror ,
.BR yylval ,
.BR yychar , 
i
.BR yydebug .
.sp
Na przyk�ad, je�eli u�yjesz opcji
.BR "\-p c" ,
w�wczas powy�sze nazwy b�d� mia�y posta�
.BR cparse ,
.BR clex ,
itd.
.TP
.B \-t
.br
.ns
.TP
.B \-\-debug
Umie�� w pliku z parserem makrodefinicj�
.B YYDEBUG
aby skompilowany zosta� kod pomagaj�cy diagnozowa� problemy (debug code).
.TP
.B \-v
.br
.ns
.TP
.B \-\-verbose
Utw�rz dodatkowy plik z dok�adnym opisami stan�w parsera i akcji
podejmowanych dla ka�dego kolejnego symbolu w tych stanach.
.sp
Ten plik opisuje r�wnie� wszystkie konflikty; zar�wno te rozwik�ane przez
nast�pstwo operator�w, jak i te nierozwik�ane.
.sp
Nazwa pliku z opisem jest tworzona przez usuni�cie
.B .tab.c
lub
.B .c
z nazwy pliku zawieraj�cego parser i dodanie
.BR .output .
.sp
Na przyk�ad, je�eli plikiem wej�ciowym jest
.BR foo.y ,
w�wczas plik zawieraj�cy parser nosi nazw�
.BR foo.tab.c .
Plik z opisem stan�w b�dzie nazwany
.BR foo.output .
.TP
.B \-V
.br
.ns
.TP
.B \-\-version
Wypisz numer wersji i zako�cz dzia�anie programu
.TP
.B \-h
.br
.ns
.TP
.B \-\-help
Wypisz spis opcji i zako�cz dzia�anie programu.
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
Ma to samo dzia�anie, co opcja
.BR "\-o y.tab.c" ;
Plik zawieraj�cy parser nosi nazw�
.BR y.tab.c ,
a pozosta�e pliki
.B y.output
i
.BR y.tab.h .
Ta opcja powoduje na�ladowanie konwencji programu 
.I yacc
nazywania plik�w.
Poni�szy skrypt mo�e by� u�ywany jako program
.IR yacc :
.sp
.RS
.ft B
bison \-y $*
.ft R
.sp
.RE
.PP
D�ugie nazwy opcji mog� by� r�wnie� poprzedzane przez
`+' zamiast `\-\-', ze wzgl�du na kompatybilno�� z poprzednimi wersjami.
W przysz�o�ci ta mo�liwo�� ma by� usuni�ta, poniewa� jest niekompatybilna ze
standardem POSIX.2
.SH PLIKI
/usr/share/bison/bison.simple	prosty parser
.br
/usr/share/bison/bison.hairy	skomplikowany parser
.SH ZOBACZ TAK�E
.IR yacc (1)
.br
Opis
.IR "Bison Reference Manual" ,
zawarty w pliku
.B bison.texinfo
w dystrybucji �r�d�owej programu
.I bison
.SH DIAGNOSTYKA
Wszystkiego mo�na si� �atwo domy�li�.

Summary:	A GNU general-purpose parser generator
Summary(de):	GNU-Parser-Generator
Summary(es):	Generador de parser de la GNU
Summary(fr):	Générateur d'analyseur lexical de GNU
Summary(pl):	GNU generator sk³adni
Summary(pt_BR):	Gerador de parser da GNU
Summary(ru):	Bison - ÇÅÎÅÒÁÔÏÒ ÐÁÒÓÅÒÏ× GNU
Summary(tr):	GNU ayrýþtýrýcý üreticisi
Summary(uk):	Bison - ÇÅÎÅÒÁÔÏÒ ÐÁÒÓÅÒ¦× GNU
Name:		bison
Version:	1.875
Release:	4
License:	GPL
Group:		Development/Tools
Source0:	ftp://ftp.gnu.org/pub/gnu/%{name}/%{name}-%{version}.tar.bz2
# Source0-md5: b7f8027b249ebd4dd0cc948943a71af0
Source1:	%{name}.1.pl
Patch0:		%{name}-info.patch
Patch1:		%{name}-unused.patch
BuildRequires:	texinfo
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		pkgdatadir	%{_datadir}/bison

%description
Bison is a general purpose parser generator which converts a grammar
description for an LALR context-free grammar into a C program to parse
that grammar. Bison can be used to develop a wide range of language
parsers, from ones used in simple desk calculators to complex
programming languages. Bison is upwardly compatible with Yacc, so any
correctly written Yacc grammar should work with Bison without any
changes. If you know Yacc, you shouldn't have any trouble using Bison
(but you do need to be very proficient in C programming to be able to
use Bison). Many programs use Bison as part of their build process.
Bison is only needed on systems that are used for development.

%description -l de
Dies ist der GNU-Parser-Generator, der größtenteils mit yacc
kompatibel ist. Viele Programme benutzen ihn als Teil des
Aufbauvorgangs. Bison wird nur auf Systemen benötigt, die zur
Entwicklung verwendet werden.

%description -l es
Este es el creador de análisis gramatical GNU más compatible con yacc.
Varios programas lo utilizan como parte del su proceso de
construcción. Bison solamente hace falta en sistemas que se usan para
desarrollo.

%description -l fr
Générateur d'analyseur lexical de GNU compatible avec yacc. De
nombreux programmes l'utilisent dans leur phase de construction. Bison
ne sert que sur les systèmes utilisés pour le développement.

%description -l pl
W pakiecie znajduje siê implementacja GNU generatora analizatora
sk³adni, który jest odpowiednikiem programu yacc. Wiele programów
podczas kompilacji potrzebuje tego programu aby proces budowy plików
binarnych przebiega³ prawid³owo. Bison jest potrzebny tylko w
systemach, w których prowadzone s± ró¿nego rodzaju kompilacje.

%description -l pt_BR
Este é o gerador de análise gramatical GNU que é mais compatível com
yacc. Vários programas o utilizam como parte do seu processo de
construção. Bison é somente necessário em sistemas que são usados para
desenvolvimento.

%description -l ru
Bison - ÜÔÏ ÐÁÒÓÅÒ, × ÏÓÎÏ×ÎÏÍ ÓÏ×ÍÅÓÔÉÍÙÊ Ó yacc. íÎÏÇÉÅ ÐÒÏÇÒÁÍÍÙ
ÉÓÐÏÌØÚÕÀÔ ÅÇÏ × ÐÒÏÃÅÓÓÅ ËÏÍÐÉÌÌÑÃÉÉ. Bison ÎÕÖÅÎ ÔÏÌØËÏ × ÓÉÓÔÅÍÁÈ,
ËÏÔÏÒÙÅ ÉÓÐÏÌØÚÕÀÔÓÑ ÄÌÑ ÒÁÚÒÁÂÏÔËÉ ÐÒÏÇÒÁÍÍ.

%description -l tr
byacc bir yacc ayrýþtýrýcýsýdýr. Pek çok program tarafýndan, kurulum
süreci sýrasýnda kullanýlýr. Geliþtirme yapanlara gerekli olabilir.

%description -l uk
Bison - ÃÅ ÐÁÒÓÅÒ, ÚÄÅÂ¦ÌØÛÏÇÏ ÓÕÍ¦ÓÎÉÊ Ú yacc. âÁÇÁÔÏ ÐÒÏÇÒÁÍ
×ÉËÏÒÉÓÔÏ×ÕÀÔØ ÊÏÇÏ × ÐÒÏÃÅÓ¦ ËÏÍÐ¦ÌÑÃ¦§. Bison ÐÏÔÒ¦ÂÅÎ Ô¦ÌØËÉ ×
ÓÉÓÔÅÍÁÈ, ÑË¦ ×ÉËÏÒÉÓÔÏ×ÕÀÔØÓÑ ÄÌÑ ÒÏÚÒÏÂËÉ ÐÒÏÇÒÁÍ.

%prep
%setup -q
%patch0 -p1
%patch1 -p1

%build
%configure
%{__make} \
	pkgdatadir=%{pkgdatadir}

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_mandir}/pl/man1

%{__make} install \
	DESTDIR=$RPM_BUILD_ROOT \
	pkgdatadir=%{pkgdatadir}

install %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man1/bison.1

%find_lang %{name}

%clean
rm -rf $RPM_BUILD_ROOT

%post
[ ! -x /usr/sbin/fix-info-dir ] || /usr/sbin/fix-info-dir -c %{_infodir} >/dev/null 2>&1

%postun
[ ! -x /usr/sbin/fix-info-dir ] || /usr/sbin/fix-info-dir -c %{_infodir} >/dev/null 2>&1

%files -f %{name}.lang
%defattr(644,root,root,755)
%attr(755,root,root) %{_bindir}/bison
%{pkgdatadir}
%{_libdir}/lib*.a
%{_mandir}/man1/*
%lang(pl) %{_mandir}/pl/man1/*
%{_infodir}/*.info*

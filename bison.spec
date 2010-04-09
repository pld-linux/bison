Summary:	A GNU general-purpose parser generator
Summary(de.UTF-8):	GNU-Parser-Generator
Summary(es.UTF-8):	Generador de parser de la GNU
Summary(fr.UTF-8):	Générateur d'analyseur lexical de GNU
Summary(pl.UTF-8):	GNU generator składni
Summary(pt_BR.UTF-8):	Gerador de parser da GNU
Summary(ru.UTF-8):	Bison - генератор парсеров GNU
Summary(tr.UTF-8):	GNU ayrıştırıcı üreticisi
Summary(uk.UTF-8):	Bison - генератор парсерів GNU
Name:		bison
Version:	2.4.2
Release:	1
License:	GPL v3+
Group:		Development/Tools
Source0:	http://ftp.gnu.org/gnu/bison/%{name}-%{version}.tar.bz2
# Source0-md5:	63584004613aaef2d3dca19088eb1654
Source1:	%{name}.1.pl
Patch0:		%{name}-info.patch
URL:		http://gnu.org/software/bison/
BuildRequires:	automake
BuildRequires:	flex
BuildRequires:	gettext-devel >= 0.12
BuildRequires:	m4 >= 1.4.6
BuildRequires:	texinfo >= 4.0
Requires:	%{name}-runtime = %{version}-%{release}
Requires:	m4 >= 1.4.6
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

%description -l de.UTF-8
Dies ist der GNU-Parser-Generator, der größtenteils mit yacc
kompatibel ist. Viele Programme benutzen ihn als Teil des
Aufbauvorgangs. Bison wird nur auf Systemen benötigt, die zur
Entwicklung verwendet werden.

%description -l es.UTF-8
Este es el creador de análisis gramatical GNU más compatible con yacc.
Varios programas lo utilizan como parte del su proceso de
construcción. Bison solamente hace falta en sistemas que se usan para
desarrollo.

%description -l fr.UTF-8
Générateur d'analyseur lexical de GNU compatible avec yacc. De
nombreux programmes l'utilisent dans leur phase de construction. Bison
ne sert que sur les systèmes utilisés pour le développement.

%description -l pl.UTF-8
W pakiecie znajduje się implementacja GNU generatora analizatora
składni, który jest odpowiednikiem programu yacc. Wiele programów
podczas kompilacji potrzebuje tego programu aby proces budowy plików
binarnych przebiegał prawidłowo. Bison jest potrzebny tylko w
systemach, w których prowadzone są różnego rodzaju kompilacje.

%description -l pt_BR.UTF-8
Este é o gerador de análise gramatical GNU que é mais compatível com
yacc. Vários programas o utilizam como parte do seu processo de
construção. Bison é somente necessário em sistemas que são usados para
desenvolvimento.

%description -l ru.UTF-8
Bison - это парсер, в основном совместимый с yacc. Многие программы
используют его в процессе компилляции. Bison нужен только в системах,
которые используются для разработки программ.

%description -l tr.UTF-8
byacc bir yacc ayrıştırıcısıdır. Pek çok program tarafından, kurulum
süreci sırasında kullanılır. Geliştirme yapanlara gerekli olabilir.

%description -l uk.UTF-8
Bison - це парсер, здебільшого сумісний з yacc. Багато програм
використовують його в процесі компіляції. Bison потрібен тільки в
системах, які використовуються для розробки програм.

%package runtime
Summary:	Runtime library for programs containing bison-generated parsers
Summary(pl.UTF-8):	Biblioteka uruchomieniowa dla programów zawierajacych parsery bisonowe
Group:		Libraries

%description runtime
Runtime library for internationalized programs containing
bison-generated parsers.

%description runtime -l pl.UTF-8
Biblioteka uruchomieniowa dla umiędzynarodowionych programów
zawierajacych parsery wygenerowane przez bisona.

%prep
%setup -q
%patch0 -p1

rm -f po/stamp-po

%build
cp -f /usr/share/automake/config.sub config
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
%find_lang %{name}-runtime

%clean
rm -rf $RPM_BUILD_ROOT

%post	-p /sbin/postshell
-/usr/sbin/fix-info-dir -c %{_infodir}

%postun	-p /sbin/postshell
-/usr/sbin/fix-info-dir -c %{_infodir}

%files -f %{name}.lang
%defattr(644,root,root,755)
%doc AUTHORS ChangeLog NEWS README THANKS TODO
%attr(755,root,root) %{_bindir}/bison
# would conflict with byacc (but is not 100% compatible)
#%attr(755,root,root) %{_bindir}/yacc
%{pkgdatadir}
%{_libdir}/liby.a
%{_aclocaldir}/bison-i18n.m4
%{_mandir}/man1/bison.1*
%lang(pl) %{_mandir}/pl/man1/bison.1*
%{_infodir}/bison.info*

%files runtime -f %{name}-runtime.lang
%defattr(644,root,root,755)

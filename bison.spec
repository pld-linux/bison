Summary:	GNU parser generator
Summary(de):	GNU-Parser-Generator
Summary(fr):	Générateur d'analyseur lexical de GNU
Summary(pl):	GNU generator sk³adni 
Summary(tr):	GNU ayrýþtýrýcý üreticisi
Name:		bison
Version:	1.28
Release:	1
Copyright:	GPL
Group:		Development/Tools
Group(pl):	Programowanie/Narzêdzia
Source0:	ftp://prep.ai.mit.edu/pub/gnu/%{name}-%{version}.tar.gz
Source1:	bison.1.pl
Patch0:		bison-info.patch
Patch1:		bison-man.patch
Prereq:		/sbin/install-info
Buildroot:	/tmp/%{name}-%{version}-root
Obsoletes:	yacc

%define		_datadir	/usr/share/misc

%description
This is the GNU parser generator which is mostly compatible with yacc. Many
programs use this as part of their build process. Bison is only needed on
systems that are used for development.

%description -l de
Dies ist der GNU-Parser-Generator, der größtenteils mit yacc kompatibel ist. Viele
Programme benutzen ihn als Teil des Aufbauvorgangs. Bison wird nur auf
Systemen benötigt, die zur Entwicklung verwendet werden.

%description -l fr
Générateur d'analyseur lexical de GNU compatible avec yacc. De nombreux
programmes l'utilisent dans leur phase de construction. Bison ne sert que
sur les systèmes utilisés pour le développement.

%description -l pl
W pakiecie znajduje siê implementacja GNU generatora analizatora sk³adni,
który jest odpowiednikiem programu yacc. Wiele programów podczas kompilacji
potrzebuje tego programu aby proces budowy plików binarnych przebiega³
prawid³owo. Bison jest potrzebny tylko w systemach, w których prowadzone s±
ró¿nego rodzaju kompilacje.

%description -l tr
byacc bir yacc ayrýþtýrýcýsýdýr. Pek çok program tarafýndan, kurulum süreci
sýrasýnda kullanýlýr. Geliþtirme yapanlara gerekli olabilir.

%prep
%setup -q
%patch0 -p1
%patch1 -p1

%build
LDFLAGS="-s"; export LDFLAGS
%configure
make

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_mandir}/pl/man1

make install DESTDIR=$RPM_BUILD_ROOT

install %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man1/bison.1

gzip -9nf $RPM_BUILD_ROOT{%{_infodir}/*,%{_mandir}/{man1/*,pl/man1/*}}

%post
/sbin/install-info %{_infodir}/bison.info.gz /etc/info-dir

%preun
if [ "$1" = "0" ]; then
	/sbin/install-info --delete %{_infodir}/bison.info.gz /etc/info-dir
fi

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)

%attr(755,root,root) %{_bindir}/*

%lang(pl) %{_mandir}/pl/man1/*
%{_mandir}/man1/*
%{_infodir}/*info*
%{_datadir}/*

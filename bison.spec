Summary:	GNU parser generator
Summary(de):	GNU-Parser-Generator
Summary(fr):	Générateur d'analyseur lexical de GNU
Summary(pl):	GNU generator sk³adni 
Summary(tr):	GNU ayrýþtýrýcý üreticisi
Name:		bison
Version:	1.27
Release:	4
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
aclocal && autoconf
    %configure --datadir=%{_datadir}/bison 
make

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_mandir}/pl/man1

make \
    prefix=$RPM_BUILD_ROOT%{_prefix} \
    datadir=$RPM_BUILD_ROOT%{_datadir}/bison \
    bindir=$RPM_BUILD_ROOT%{_bindir} \
    mandir=$RPM_BUILD_ROOT%{_mandir} \
    infodir=$RPM_BUILD_ROOT%{_infodir} \
    install

strip $RPM_BUILD_ROOT%{_bindir}/*

install %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man1/bison.1

gzip -9nf $RPM_BUILD_ROOT%{_datadir}/{info/*,man/{man1/*,pl/man1/*}}

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
%{_datadir}/bison

%changelog
* Tue Jun 01 1999 Wojtek ¦lusarczyk <wojtek@shadow.eu.org>
-  FHS 2.0

* Thu Apr 22 1999 Tomasz K³oczko <kloczek@rudy.mif.pg.gda.pl>
  [1.27-2]
- recompiles on new rpm.

* Fri Feb 26 1999 Tomasz K³oczko <kloczek@rudy.mif.pg.gda.pl>
  [1.27-1]
- added Group(pl),
- changed way passing $RPM_OPT_FLAGS -s to LDFLAGS,
- removed man group from man pages.

* Tue Dec 29 1998 Tomasz K³oczko <kloczek@rudy.mif.pg.gda.pl>
  [1.25-8]
- standarized {un}registering info pages (added bison-info.patch).

* Sat Dec 12 1998 Tomasz K³oczko <kloczek@rudy.mif.pg.gda.pl>
  [1.25-7]
- added gzipping man pages,
- added pl man pages,
- standarized {un}registering info pages.

* Fri Nov  6 1998 Tomasz K³oczko <kloczek@rudy.mif.pg.gda.pl>
  [1.25-6]
- fixed passing $RPM_OPT_FLAGS,
- modified pl translation,
- bisona.{simple,hairy} moved to %{_datadir}.

* Sun Jun 14 1998 Wojtek ¦lusarczyk <wojtek@shadow.eu.org>
  [1.25-5]
- added pl translation,
- macro %%{name}-%%{version} in Source,
- minor modifications of spec file,
- build against GNU libc-2.1,
- start at RH spec.

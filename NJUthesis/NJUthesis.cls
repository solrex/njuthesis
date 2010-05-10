%%
%% This is file `NJUthesis.cls', 
%% modified based on CASthesis.cls by Wenbo Yang <http://solrex.org>.
%% Homepage: http://share.solrex.org/njuthesis/
%%
%% ----------------------------------------------------------------------
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%% 
%% This file may only be distributed together with a copy of original
%% source files. You may however distribute original source files
%% without such generated files. Copying of this file is authorized
%% only if either:
%% (1) you make absolutely no changes to your copy, including name; OR
%% (2) if you do make changes, you first rename it to some other name.
%% 
%% To produce the documentation run the original source files ending
%% with `.dtx' through LaTeX.
%% 
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{NJUthesis}
  [2010/04/20 v0.1 NJUthesis
   document class]
\newif\ifNJUT@backinfo \NJUT@backinfotrue
\DeclareOption{nobackinfo}{\NJUT@backinfofalse}
\newif\ifNJUT@dvips \NJUT@dvipsfalse
\DeclareOption{dvips}{\NJUT@dvipstrue}
\DeclareOption{dvipdfm}{\NJUT@dvipsfalse}
\DeclareOption{pdftex}{\NJUT@dvipsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\LoadClass[cs4size,a4paper,fancyhdr,fntef]{ctexbook}[2005/11/25]
%% check pdfTeX mode
\RequirePackage{ifpdf}
%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
%% graphics packages
\RequirePackage{graphicx}
%% sort and compress citations
\RequirePackage[sort,numbers]{natbib}
%% packages and settings depend on PDF mode
\ifpdf   % We're running pdfTeX in PDF mode
  \RequirePackage[pdftex]{hyperref}
  \DeclareGraphicsExtensions{.pdf}
\else    % We're not running pdfTeX, or running pdfTeX in DVI mode
  \ifNJUT@dvips
    \RequirePackage[dvips]{hyperref}
    \RequirePackage{psfrag}
    \AtBeginDvi{\special{pdf:tounicode GBK-EUC-UCS2}} % GBK -> Unicode
  \else
    \RequirePackage[dvipdfmx]{hyperref}
  \fi
  \DeclareGraphicsExtensions{.eps,.ps}
\fi
\graphicspath{{figures/}}
%%
%% Define link colors
\RequirePackage{color}
\definecolor{darkblue}{rgb}{0,0,0.55}
\hypersetup{CJKbookmarks,%
       bookmarksnumbered,%
              colorlinks,%
               linkcolor=black,%
               citecolor=darkblue,%
              plainpages=false,%
            pdfstartview=FitH}
\AtEndOfPackage{\makeatletter\input{NJUthesis.cfg}\makeatother}
%%
%% Define page layout.
\RequirePackage{geometry}
\geometry{top=3.5cm,bottom=3.5cm,left=3.2cm,right=3.2cm}
\geometry{headheight=2.6cm,headsep=3mm,footskip=13mm}
\parskip 0.5ex plus 0.25ex minus 0.25ex
%%
%% DIY item style.
\RequirePackage{enumitem}
%%
%%
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\renewcommand{\floatpagefraction}{0.80}
%%
%% Bib styles and DIYed \cite commands.
\bibliographystyle{NJUthesis}
%% Author-year mode label with numerical mode indexes.
%% Jack (2000)
\newcommand\citenju[1]{\protect\citeauthor{#1} (\protect\citeyear{#1})}
%% (Jack, 2000)
\newcommand\citenjup[1]{(\protect\citeauthor{#1}, \protect\citeyear{#1})}
%% Jack, 2000
\newcommand\citenjupr[1]{\protect\citeauthor{#1}, \protect\citeyear{#1}}
%% Jack (2000)
\newcommand\Citenju[1]{\protect\Citeauthor{#1} (\protect\citeyear{#1})}
%%
%%
\newcommand\NJUTspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
%%
\def\NJUT@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\NJUTfiledate{#1}%
  \def\NJUTfileversion{#2}%
  \def\NJUTfileinfo{#3}}%
\expandafter\ifx\csname ver@NJUthesis.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_NJUthesis.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@NJUthesis.cls\endcsname}
\fi
\expandafter\NJUT@getfileinfo\reserved@a\relax? ? \relax\relax
\def\NJUT@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\NJUTunderline{\@ifnextchar[\NJUT@underline\CTEXunderline}
\newcommand\school[1]{\def\NJUT@value@school{#1}}
\newcommand\degree[1]{\def\NJUT@value@degree{#1}}
\renewcommand\title[2][\NJUT@value@title]{%
  \def\NJUT@value@title{#2}
  \def\NJUT@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\NJUT@value@author{#1}}
\newcommand\studentnum[1]{\def\NJUT@value@studentnum{#1}}
\newcommand\grade[1]{\def\NJUT@value@grade{#1}}
\newcommand\advisor[1]{\def\NJUT@value@advisor{#1}}
\newcommand\advisorinstitute[1]{\def\NJUT@value@advisorinstitute{#1}}
\newcommand\major[1]{\def\NJUT@value@major{#1}}
\newcommand\researchfield[1]{\def\NJUT@value@researchfield{#1}}
\newcommand\submitdate[1]{\def\NJUT@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\NJUT@value@defenddate{#1}}
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \pdfbookmark[0]{Front cover}{cover}
  \begin{center}
    \vskip 10mm
    \includegraphics[width=1.96cm]{njulogo} \\
    \includegraphics[height=2cm]{njuname} \\
    \vskip 5mm
      {\bf\kaishu\zihao{1}  \NJUT@label@thesis}\\
    \vskip 5mm
      {\bf\kaishu\zihao{1}  \NJUT@label@apply}\\
    \vskip \stretch{1}
    \bf\kaishu\zihao{3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    \begin{tabular}{lc}
      \NJUT@label@title & \NJUTunderline[310pt]{\NJUT@value@title}\\
      \NJUT@label@author & \NJUTunderline[310pt]{\NJUT@value@author}\\
      \NJUT@label@major  & \NJUTunderline[310pt]{\NJUT@value@major}\\
      \NJUT@label@advisor & \NJUTunderline[310pt]{\NJUT@value@advisor}\\
      \NJUT@label@researchfield & \NJUTunderline[310pt]{\NJUT@value@researchfield}\\
    \end{tabular}\\
  \vskip \stretch{1}
  {\bf\kaishu\zihao{4} \NJUT@value@submitdate}
  \end{center}
  \clearpage
  \ifNJUT@backinfo
    \thispagestyle{empty}
    \vspace*{\stretch{1}}
    {\bf\kaishu\zihao{-3}
    \begin{tabular}{rl}
      \NJUT@label@studentnum &£º \NJUT@value@studentnum\\
      \NJUT@label@defenddate &£º \NJUT@value@defenddate\\
      \NJUT@label@advisor &£º \NJUT@label@advisorsign\\
    \end{tabular}
    }
  \fi
}
\newcommand\englishtitle[1]{\def\NJUT@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\NJUT@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\NJUT@value@englishadvisor{#1}}
\newcommand\englishinstitute[1]{\def\NJUT@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\NJUT@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\NJUT@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\NJUT@value@englishmajor{#1}}
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{20pt}
      \bf\zihao{2} \NJUT@value@englishtitle
    \vskip \stretch{1}
      \normalfont\zihao{4} by
    \vskip 3pt
      \bf\zihao{4} \NJUT@value@englishauthor
    \vskip \stretch{1}
      \normalfont\zihao{4} \NJUT@label@englishadvisor
    \vskip 3pt
      \normalfont\zihao{4} \NJUT@value@englishadvisor
    \vskip \stretch{2}
      \normalfont\normalsize \NJUT@value@englishinstitute
    \vskip 30pt
      \normalfont\normalsize \NJUT@value@englishdate
    \vskip 20pt
      \it\normalsize \NJUT@label@englishstatement
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyhead[C]{\small \leftmark}
  \fancyfoot[C]{\small ~\thepage~}
  \renewcommand{\headrulewidth}{0.7pt}
}
\pagestyle{plain}
\newenvironment{abstract}
  {\thispagestyle{empty}%
   \pdfbookmark[0]{\NJUT@label@abstract}{abstract}
   \begin{center}
     {\bf\kaishu\zihao{-2} \uuline{\NJUT@label@abstractbar}}
   \end{center}

   {\kaishu\zihao{4}%
     \noindent \NJUT@label@abstractthesistitle%
     \NJUTunderline[316pt]{\NJUT@value@title}

     \noindent \NJUTunderline[178pt]{\NJUT@value@major}%
     \NJUT@label@abstractmajor%
     \NJUTunderline[50pt]{\NJUT@value@grade} %
     \NJUT@label@abstractauthor%
     \NJUTunderline[60pt]{\NJUT@value@author}

     \noindent \NJUT@label@abstractadvisor%
     \NJUTunderline[252pt]{\NJUT@value@advisor}
   }
   \begin{center}
     {\heiti\zihao{-3} \NJUT@label@abstract}
   \end{center}
  }
  {}
\newcommand\keywords[1]{%
  \vspace{2ex}\noindent{\heiti \NJUT@label@keywords} #1}
\newenvironment{englishabstract}
  {\if@twoside\cleardoublepage\else\clearpage\fi
   \thispagestyle{empty}
   \pdfbookmark[0]{\NJUT@label@englishabstract}{englishabstract}
   \begin{center}
     {\bf\kaishu\zihao{-2} \uuline{\NJUT@label@englishabstractbar}}
   \end{center}

   {\zihao{4}%
     \begin{description}[font=\normalfont, leftmargin=4em]
       \item[THESIS:] \NJUT@value@englishtitle

       \item[SPECIALIZATION:] \NJUT@value@englishmajor

       \item[POSTGRADUATE:] \NJUT@value@englishauthor

       \item[MENTOR:] \NJUT@value@englishadvisor
     \end{description}

   \begin{center}
     {\bf\zihao{-3} \NJUT@label@englishabstract}
   \end{center}
   }
  }
  {}
\newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf \NJUT@label@englishkeywords} #1}
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \Nchapter{\contentsname}%
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}
\newcommand\Nchapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi}
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1
       \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
       \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewenvironment{thebibliography}[1]
     {\Nchapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newenvironment{publications}[1]
     {\Nchapter{\NJUT@label@publications}%
      \@mkboth{\MakeUppercase\NJUT@label@publications}
              {\MakeUppercase\NJUT@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}
\newenvironment{resume}
  {\Nchapter{\NJUT@label@resume}}
  {}
\newenvironment{Publications}[1]
     {\noindent {\heiti \NJUT@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}
\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
  {\endlist}
\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
  {\endlist}
\renewenvironment{thanks}
  {\Nchapter{\NJUT@label@thanks}}
  {}
\setcounter{secnumdepth}{4}
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\endinput
%%
%% End of file `NJUthesis.cls'.

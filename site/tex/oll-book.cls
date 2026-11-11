% oll-book.cls: the common document class of the OpenLutheranLibrary.
%
% Every book in this repository uses it, so all books share one page design
% and one set of markup conventions. TYPESETTING.md (repository root) is the
% guide for editors; this file is the implementation.
%
% The build copies the class next to each book. To compile a book by hand:
%   cd <book> && TEXINPUTS=../site/tex//: lualatex main.tex
%
% Options
%   ngerman (default), english, latin  main language of the book
%   libertinus (default), pagella      text face (Libertinus Serif, TeX Gyre Pagella)
%   quellseiten                        show \quellseite markers in the PDF margin
%   fnsymbole                          footnote marks *, **, … counted per page
%                                      (default: arabic numerals per chapter)
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oll-book}[2026/11/05 v1.0 OpenLutheranLibrary book class]

\newif\ifoll@quellseiten
\newif\ifoll@fnsymbole
\newif\ifoll@pagella
\def\oll@language{ngerman}
\DeclareOption{ngerman}{\def\oll@language{ngerman}}
\DeclareOption{english}{\def\oll@language{english}}
\DeclareOption{latin}{\def\oll@language{latin}}
\DeclareOption{libertinus}{\oll@pagellafalse}
\DeclareOption{pagella}{\oll@pagellatrue}
\DeclareOption{quellseiten}{\oll@quellseitentrue}
\DeclareOption{fnsymbole}{\oll@fnsymboletrue}
\DeclareOption*{\PackageWarning{oll-book}{Unknown option `\CurrentOption'}}
\ProcessOptions\relax

% The standard book class keeps TeX4ht (online reader, EPUB) on familiar ground.
\LoadClass[11pt,a5paper,twoside,openany]{book}

% TeX4ht defines \HCode; page-only refinements are skipped there.
\newif\ifoll@pdf
\ifdefined\HCode \oll@pdffalse \else \oll@pdftrue \fi

% ---------------------------------------------------------------- language, fonts
\RequirePackage[\oll@language]{babel}
\RequirePackage{fontspec}
\ifoll@pagella
  \setmainfont{TeX Gyre Pagella}[Numbers=OldStyle]
\else
  \setmainfont{Libertinus Serif}[Numbers=OldStyle]
\fi
\RequirePackage[autostyle]{csquotes}
\RequirePackage{xcolor}
\RequirePackage{array}
\RequirePackage{longtable}% comparison tables may continue across pages
\RequirePackage{rotating}% sideways tables (registers, statistics)
\RequirePackage{import}% source fragments retain their own relative input paths
\RequirePackage{graphicx}% pre-engraved LilyPond scores; no shell escape

% ---------------------------------------------------------------- page
\RequirePackage[inner=18mm,outer=28mm,top=20mm,bottom=22mm,headsep=5mm,
  marginparwidth=20mm,marginparsep=3mm]{geometry}
\ifoll@pdf
  \RequirePackage[protrusion=true,expansion=true]{microtype}
  \RequirePackage{emptypage}% no running head on blank pages
\fi
\raggedbottom
\emergencystretch=2em
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000
\setlength{\parindent}{1.2em}

% ---------------------------------------------------------------- headings
% Headings are unnumbered: the book's own numbering ("I.", "§. 12", "A.") is
% part of the title text. They still reach the bookmarks and the reader's
% table of contents, so use the unstarred commands.
\setcounter{secnumdepth}{-2}
\setcounter{tocdepth}{2}
\ifoll@pdf
  % Long editions need room for four-digit page numbers in the contents.
  \renewcommand{\@pnumwidth}{2.5em}
  \renewcommand{\@tocrmarg}{3.5em}
  \RequirePackage{titlesec}
  \titleformat{\part}[display]{\centering\normalfont\LARGE}{}{0pt}{}
  \titlespacing*{\part}{0pt}{0.3\textheight}{0pt}
  \titleformat{\chapter}[display]{\centering\normalfont\Large}{}{0pt}{}
  \titlespacing*{\chapter}{0pt}{2\baselineskip}{2\baselineskip}
  \titleformat{\section}{\centering\normalfont\large}{}{0pt}{}
  \titlespacing*{\section}{0pt}{1.6\baselineskip plus .5\baselineskip}{0.8\baselineskip}
  \titleformat{\subsection}{\centering\normalfont\normalsize\itshape}{}{0pt}{}
  \titlespacing*{\subsection}{0pt}{1.2\baselineskip plus .3\baselineskip}{0.5\baselineskip}
  \titleformat{\subsubsection}[runin]{\normalfont\normalsize\itshape}{}{0pt}{}[.]
  \titlespacing*{\subsubsection}{\parindent}{0.6\baselineskip}{0.5em}
\fi

% ---------------------------------------------------------------- running heads
% Verso: chapter title, recto: section title; folio outside. Long titles
% need a short form: \chapter[Kurztitel]{Langer Titel}.
\ifoll@pdf
  \RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[LE,RO]{\small\thepage}
  \fancyhead[CE]{\small\itshape\nouppercase{\leftmark}}
  \fancyhead[CO]{\small\itshape\nouppercase{\rightmark}}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
  \renewcommand{\sectionmark}[1]{\markright{#1}}
  \fancypagestyle{plain}{\fancyhf{}\fancyfoot[C]{\small\thepage}}
  % A rotated table fills its page; a running head would collide with it.
  \AddToHook{env/sideways/begin}{\thispagestyle{empty}}
\fi

% ---------------------------------------------------------------- footnotes
\ifoll@fnsymbole
  \RequirePackage[perpage,symbol*]{footmisc}
\else
  \RequirePackage{footmisc}
  \counterwithin*{footnote}{chapter}
\fi
\ifoll@pdf
  \renewcommand{\footnotelayout}{\raggedright}
  \setlength{\footnotesep}{0.8\baselineskip}
\fi

% ---------------------------------------------------------------- PDF links
\ifoll@pdf
  \RequirePackage[hidelinks,bookmarksopen,bookmarksdepth=2]{hyperref}
  \pdfstringdefDisableCommands{\def\,{ }\def\\{ }\def\hebraeisch#1{#1}}
\else
  \newcounter{ollanchor}
  \newcommand{\phantomsection}{\refstepcounter{ollanchor}}
\fi

% ================================================================ markup
% Title pages: one environment per printed title page (half-title, title,
% division pages that are not \part). Centred, no running head.
\ifoll@pdf
  % Not LaTeX's titlepage: it restarts the page count (duplicate PDF anchors).
  \newenvironment{titelseite}{\cleardoublepage\thispagestyle{empty}\vspace*{2\baselineskip}%
    \begingroup\centering\ignorespaces}{\par\endgroup\clearpage}
\else
  \newenvironment{titelseite}{\begin{titlepage}\centering\ignorespaces}{\par\end{titlepage}}
\fi

% Typography shared by book title pages and periodical mastheads.
\newcommand{\werktitel}[1]{{\LARGE #1}}
\newcommand{\werkuntertitel}[1]{{\Large #1}}

% Biblical text set apart from an accompanying verse-by-verse exposition.
\newenvironment{schriftzitat}{\begin{quote}\bfseries}{\end{quote}}

% Source page of the printed original (scan page): \quellseite{12} on its own
% line where the page break falls. The online reader shows it in the margin;
% the PDF only with the class option `quellseiten'. It never changes spacing.
\newcommand{\quellseite}[1]{%
  \ifhmode\unskip\fi
  \ifoll@quellseiten
    \ifhmode\ifinner\else
      \marginpar{\raggedright\scriptsize\color{gray}S.\,#1}%
    \fi\fi
  \fi}

% Uncertain readings of the transcription.
\newcommand{\unsicher}[1]{\textcolor{gray}{#1}\textsuperscript{\textcolor{gray}{?}}}

% Keep Hebrew in logical order in the source. Shape and direct the run
% independently so adjacent Latin references retain their left-to-right order.
\ifoll@pdf
  \newfontfamily\oll@hebrewfont{Libertinus Serif}[Script=Hebrew,Renderer=HarfBuzz]
  \DeclareRobustCommand{\hebraeisch}[1]{\leavevmode\hbox dir TRT{\oll@hebrewfont#1}}
\else
  \DeclareRobustCommand{\hebraeisch}[1]{#1}
\fi

% Editable score source: #1.ly; the build supplies #1.pdf and #1.svg.
% Original score facsimiles may instead supply #1.png.
% #2 describes the music for readers who cannot see the notation.
\newcommand{\notensatz}[2]{\par\begin{center}%
  \includegraphics[width=\linewidth,height=0.85\textheight,keepaspectratio]{#1}%
  \end{center}\par}

% Letter-spaced emphasis (Sperrsatz) of German print.
\newcommand{\gesperrt}[1]{{\addfontfeatures{LetterSpace=12}#1}}

% Marginal glosses of the original.
\newcommand{\randnotiz}[1]{\marginpar{\footnotesize\itshape\raggedright #1}}

% Dateline or signature under a preface or letter.
\newenvironment{unterschrift}{\begin{flushright}}{\end{flushright}}

% Source of a motto or quotation, set flush right under it.
\newcommand{\quelle}[1]{\begin{flushright}\small #1\end{flushright}}

% Section break of the original (a centred asterisk or rule between passages).
\newcommand{\trenner}{\par\begin{center}*\end{center}\par}

% Several lines in one table cell: \zl{Zeile\\Zeile}.
\newcommand{\zl}[1]{\begin{tabular}[t]{@{}c@{}}#1\end{tabular}}

% A wide register occupies its own rotated page in print. The digital
% edition keeps the table upright and omits the fixed-width print box.
\ifoll@pdf
  \newsavebox{\oll@quertabelle}
  \newenvironment{quertabelle}{\clearpage\begin{lrbox}{\oll@quertabelle}%
    \begin{minipage}{0.98\textheight}\setlength{\tabcolsep}{2pt}%
  }{%
    \end{minipage}\end{lrbox}%
    \noindent\begin{sideways}%
      % The height of the unrotated box becomes its width on the page.
      \ifdim\dimexpr\ht\oll@quertabelle+\dp\oll@quertabelle\relax>\textwidth
        \resizebox*{!}{\textwidth}{\usebox{\oll@quertabelle}}%
      \else
        \usebox{\oll@quertabelle}%
      \fi
    \end{sideways}\par\clearpage
  }
\else
  \newenvironment{quertabelle}{\par}{\par}
\fi

% Compact multi-page table with a narrow item-number column and four
% equally wide comparison columns.
\newenvironment{vergleichstabelle}{\footnotesize\setlength{\tabcolsep}{3pt}%
  \begin{longtable}{@{}>{\raggedleft\arraybackslash}p{4.5mm}%
    *{4}{>{\raggedright\arraybackslash}p{\dimexpr(\linewidth-4.5mm-8\tabcolsep)/4\relax}}@{}}%
}{\end{longtable}}

% Alphabetical back-of-book indexes. The legacy command names also appear in
% older source downloads. The edition's contents comes from \tableofcontents.
\newenvironment{originalinhalt}{\par\small\setlength{\parindent}{0pt}%
  \setlength{\parskip}{0.15\baselineskip}}{\par}
\newcommand{\inhaltsgruppe}[1]{\par\medskip{\centering #1\par}\nopagebreak}
\ifoll@pdf
  \newcommand{\inhaltseintrag}[2]{\par\hangindent=1.5em\hangafter=1
    #1\nobreak\leaders\hbox to 0.8em{\hss.\hss}\hfill\nobreak\hskip0.5em\mbox{#2}\par}
\else
  \newcommand{\inhaltseintrag}[2]{\par #1 \dotfill\ #2\par}
\fi
\newcommand{\inhaltsseite}{\par\hfill\textit{Seite}\par}

% ---------------------------------------------------------------- semantics
\AtBeginDocument{\frenchspacing}
\endinput

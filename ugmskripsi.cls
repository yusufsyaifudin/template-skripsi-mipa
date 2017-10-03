\NeedsTeXFormat{LaTeX2e}
%Created by Pekik Nurwantoro, Universitas Gadjah Mada, Yogyakarta, Indonesia
\ProvidesClass{ugmskripsi}[2010/16/01 v2.0 The University of Gadjah Mada Skripsi Class]

\RequirePackage[english,bahasa]{babel}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx,latexsym}

\newif\if@msthesis
\newif\if@msproposal
\DeclareOption{skripsi}{\@msthesistrue\@msproposalfalse}
\DeclareOption{proposal}{\@msthesisfalse\@msproposaltrue}

\newif\if@singlesp
\newif\if@doublesp
\DeclareOption{satuspasi}{\@singlesptrue\@doublespfalse}
\DeclareOption{duaspasi}{\@singlespfalse\@doublesptrue}
\newif\if@onehalfsp
\@onehalfspfalse
\DeclareOption{satusetengahspasi}{\@onehalfsptrue}

\newif\if@langindo
\newif\if@langeng
\DeclareOption{indonesia}{\@langindotrue\@langengfalse}
\DeclareOption{inggris}{\@langindofalse\@langengtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{skripsi,satusetengahspasi,indonesia}
\ProcessOptions
\LoadClass[a4paper,12pt]{report}
\RequirePackage{natbib}
\bibliographystyle{natbib}
\RequirePackage{nomencl}%
\renewcommand{\nomname}{\nomenclaturename}%
\makeglossary%

%------------------------------------------------------------
%Layout
%------------------------------------------------------------
\setlength{\topmargin}{-0.9cm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{2.3cm}
\setlength{\topskip}{1ex}
\setlength{\oddsidemargin}{1.46cm}
\setlength{\evensidemargin}{1.46cm}
\setlength{\textwidth}{14.3cm}
\setlength{\textheight}{22cm}
\setlength{\footskip}{1.5cm}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}

\setlength{\parindent}{3em} %Indent approx 6 character

%------------------------------------------------------------
%The form of page numbering
%------------------------------------------------------------
\pagestyle{myheadings}
\markright{}

%------------------------------------------------------------
%Define page numbering in the first chapter
%------------------------------------------------------------
\def\ps@chapterheading{%
  \let\@evenhead\@empty\let\@oddhead\@empty
  \def\@oddfoot{\hfil\thepage\hfil}%
  \def\@evenfoot{\hfil\thepage\hfil}
  }

%------------------------------------------------------------
%Redefine chapter and sections
%------------------------------------------------------------
\setcounter{secnumdepth}{2}
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
%\renewcommand \thesection {\@arabic\c@section.}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
%\renewcommand\thesubsection {\@alph\c@subsection.}
\renewcommand\thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
%\renewcommand\thesubsubsection{\@roman\c@subsubsection.}
%\renewcommand\thesubsubsection{}
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\renewcommand{\chapter}{\clearpage\thispagestyle{chapterheading}%
  \global\@topnum\z@ %Prevents figures from going at top of page
  \@afterindenttrue %Indent the 1st paragraph
  \secdef\@chapter\@schapter}
\renewcommand{\@makechapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 5\p@
    \fi
    \interlinepenalty\@M
    \large \bfseries #1\par\nobreak
    \vskip 20\p@
    }}
\renewcommand{\@makeschapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \interlinepenalty\@M \large \bfseries #1\par\nobreak \vskip 20\p@ }}
%\renewcommand{\section}{\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {2.3ex \@plus.2ex}%
%                                   {\normalfont\normalsize\bfseries\centering}}
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
%\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\parindent}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {-1em}%
%                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\subparagraph}

\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@equation}
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}

%------------------------------------------------------------
%Redefine caption names
%------------------------------------------------------------
\def\captionsbahasa{%
\def\prefacename{PRAKATA}%
\def\contentsname{DAFTAR ISI}%
\def\listfigurename{DAFTAR GAMBAR}%
\def\listtablename{DAFTAR TABEL}%
\def\listappendixname{DAFTAR LAMPIRAN}%
\def\nomenclaturename{DAFTAR LAMBANG DAN SINGKATAN}%
\def\abstractname{INTISARI}%
\def\partname{BAGIAN}%
\def\chaptername{BAB}%
\def\appendixname{LAMPIRAN}%
\def\refname{DAFTAR PUSTAKA}%
\def\bibname{DAFTAR PUSTAKA}%
\def\indexname{Indek}%
\def\figurename{Gambar}%
\def\tablename{Tabel}%
\def\pagename{Halaman}%
}

%English
\def\captionsenglish{%
\def\prefacename{PREFACE}%
\def\contentsname{CONTENTS}%
\def\listfigurename{LIST OF FIGURES}%
\def\listtablename{LIST OF TABLES}%
\def\listappendixname{LIST OF APPENDICES}%
\def\nomenclaturename{NOMENCLATURE}%
\def\abstractname{ABSTRACT}%
\def\partname{PART}%
\def\chaptername{CHAPTER}%
\def\appendixname{APPENDIX}%
\def\refname{REFERENCES}%
\def\bibname{REFERENCES}%
\def\indexname{Index}%
\def\figurename{Figure}%
\def\tablename{Table}%
\def\pagename{Page}%
}

%------------------------------------------------------------]
%Define thesis's inputs
%------------------------------------------------------------
\gdef\@university{Universitas Gadjah Mada}
\gdef\@faculty{Fakultas Matematika dan Ilmu Pengetahuan Alam}
\gdef\@city{Yogyakarta}
\newcommand{\titleind}[1]{\gdef\@titleind{#1}}
\newcommand{\@titleind}{}
\newcommand{\titleeng}[1]{\gdef\@titleeng{#1}}
\newcommand{\@titleeng}{}
\newcommand{\fullname}[1]{\gdef\@fullname{#1}}
\newcommand{\@fullname}{}
\newcommand{\idnum}[1]{\gdef\@idnum{#1}}
\newcommand{\@idnum}{}
\newcommand{\examdate}[1]{\gdef\@examdate{#1}}
\newcommand{\@examdate}{\number\day~\ifcase\month\or
    Januari\or Februari\or Maret\or April\or Mei\or Juni\or
    Juli\or Agustus\or September\or Oktober\or November\or Desember\fi
    \space \number\year}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\@degree}{}
\newcommand{\yearsubmit}[1]{\gdef\@yearsubmit{#1}}
\newcommand{\@yearsubmit}{}
\newcommand{\program}[1]{\gdef\@program{#1}}
\newcommand{\@program}{}
\newcommand{\gelar}[1]{\gdef\@gelar{#1}}
\newcommand{\@gelar}{}
\newcommand{\headprogram}[1]{\gdef\@headprogram{#1}}
\newcommand{\@headprogram}{}
\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\@dept}{}
\newcommand{\firstsupervisor}[1]{\gdef\@firstsupervisor{#1}}
\newcommand{\@firstsupervisor}{}
\newcommand{\firstexaminer}[1]{\gdef\@firstexaminer{#1}}%
\newcommand{\@firstexaminer}{}
\newcommand{\secondexaminer}[1]{\gdef\@secondexaminer{#1}}%
\newcommand{\@secondexaminer}{}

%------------------------------------------------------------
%Define cover in Indonesian
%------------------------------------------------------------
\def\cover{%
  \thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{1}
    \begin{center}
      \begin{singlespace}
      \MakeUppercase{\normalfont\bfseries Skripsi}\\
      \vspace{1.5cm}	
      \MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
      \vspace{1.0cm}
      \MakeUppercase{\normalfont\slshape\bfseries\@titleeng}\par\nobreak
       \vfill
       \includegraphics{logougm}
       \vfill
       {\normalfont
        \MakeUppercase{\@fullname}\\
        \@idnum}\\
       \vspace{1.5cm}
       {\normalfont 
         \MakeUppercase{\normalfont\bfseries Program Studi \@program}\\
         \MakeUppercase{\normalfont\bfseries Departemen \@dept}\\
         \MakeUppercase{\normalfont\bfseries\@faculty}\\
         \MakeUppercase{\normalfont\bfseries\@university}\\
         \MakeUppercase{\normalfont\bfseries\@city}\\
         \vspace{0.5cm}
         {\normalfont\bfseries\@yearsubmit}}\\
      \end{singlespace}
      \end{center}
}  

%------------------------------------------------------------
%Define titlepage in Indonesian
%------------------------------------------------------------
\def\titlepageind{%
  \thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{1}
    \begin{center}
      \begin{singlespace}
      \MakeUppercase{\normalfont\bfseries Skripsi}\\
      \vspace{1.5cm}	
      \MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
      \vspace{1.0cm}
      \MakeUppercase{\normalfont\slshape\bfseries\@titleeng}\par\nobreak
      \vspace{1.5cm}
       \if@msthesis%
        {\normalfont Diajukan untuk memenuhi salah satu syarat memperoleh derajat\\
         \@gelar{}}\\
       \else
        {\normalfont Usulan Penelitian}\\
       \fi
       \vfill
       \includegraphics{logougm}
       \vfill
       {\normalfont
        \MakeUppercase{\@fullname}\\
        \@idnum}\\
       \vspace{1.5cm}
       {\normalfont 
         \MakeUppercase{\normalfont\bfseries Program Studi \@program}\\
         \MakeUppercase{\normalfont\bfseries Depertemen \@dept}\\
         \MakeUppercase{\normalfont\bfseries\@faculty}\\
         \MakeUppercase{\normalfont\bfseries\@university}\\
         \MakeUppercase{\normalfont\bfseries\@city}\\
         \vspace{0.5cm}
         {\normalfont\bfseries\@yearsubmit}}\\
      \end{singlespace}
      \end{center}
\addcontentsline{toc}{chapter}{Halaman Judul}
}  

%------------------------------------------------------------
%Approval Page
%------------------------------------------------------------
\def\approvalpage{%
  \newpage\thispagestyle{empty}%
  \begin{center}
  \begin{singlespace}
  \phantomsection
  \addcontentsline{toc}{chapter}{Halaman Pengesahan}
  \MakeUppercase{\normalfont\large\bfseries\expandafter{Halaman Pengesahan}}\\
  \vspace{1.0cm}
  \MakeUppercase{\normalfont\large\bfseries\expandafter{Skripsi}}\\
  \vspace{0.5cm}
      \MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
  \vspace{1.0cm}
Telah dipersiapkan dan disusun oleh\\
\vspace{0.5cm}
\MakeUppercase{\@fullname}\\
\@idnum\\
\vspace{1.0cm}
Telah dipertahankan di depan Tim Penguji\\
pada tanggal \expandafter{\@examdate}\\
\vspace{0.5cm}
Susunan Tim Penguji\\

\vspace{4.0cm}
\begin{tabular}{p{7cm}p{7cm}}
\@firstsupervisor&\@firstexaminer\\
Pembimbing & Ketua Penguji
\end{tabular}

\bigskip
\vspace{3.0cm}
\begin{tabular}{p{7cm}p{7cm}}
&\@secondexaminer\\
&Anggota Penguji
\end{tabular}
    \end{singlespace}
    \end{center}
}

%------------------------------------------------------------
%Declare Page
%------------------------------------------------------------
\def\declarepage{%
  \newpage\thispagestyle{chapterheading}%
  \begin{center}
  \phantomsection
  \addcontentsline{toc}{chapter}{Halaman Pernyataan}
  {\normalfont\large\bfseries\expandafter{PERNYATAAN}}
  \par\nobreak
  \end{center}
  \vspace{1.0cm}
    \noindent
Dengan ini saya menyatakan bahwa dalam Skripsi ini tidak terdapat karya yang
pernah diajukan untuk memperoleh gelar kesarjanaan di suatu Perguruan Tinggi, 
dan sepanjang pengetahuan saya juga tidak terdapat karya atau pendapat yang
ditulis atau diterbitkan oleh orang lain, kecuali yang secara tertulis diacu
dalam naskah ini dan disebutkan dalam daftar pustaka.
 
\vspace{1.5cm}
\begin{tabular}{p{7.5cm}c}
&\@city,\space\@examdate\\
&\\
&\\
&\space\@fullname
\end{tabular}
\vfill
}

%------------------------------------------------------------
%Acknowlegment
%------------------------------------------------------------
\def\acknowledment{%
  \clearpage\thispagestyle{chapterheading}%
\null\vfill%Force the content of acknowledment to bottom page
\phantomsection
\addcontentsline{toc}{chapter}{Halaman Persembahan} 
}

%------------------------------------------------------------
%Motto
%------------------------------------------------------------
\def\motto{%
  \clearpage\thispagestyle{chapterheading}%
\null\vfill%Force the content of acknowledment to bottom page
\phantomsection 
\addcontentsline{toc}{chapter}{Halaman Motto}
}

%------------------------------------------------------------
%Preface
%------------------------------------------------------------
\def\preface{%
  \chapter*{\prefacename}%
\addcontentsline{toc}{chapter}{\prefacename}
}

%------------------------------------------------------------
%Nomenclature
%------------------------------------------------------------
\def\lambang{%
  \clearpage\thispagestyle{chapterheading}%
  \printglossary%
\addcontentsline{toc}{chapter}{\nomenclaturename}
}

%------------------------------------------------------------
%Redefine Abstract in Indonesian
%------------------------------------------------------------
\def\abstractind{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\abstractname}
  \thispagestyle{chapterheading}%
  {\parindent \z@ \centering \normalfont
  {\large\textbf{\abstractname}} \\

  \vspace{1.0cm}
   {\large\textbf{\@titleind}}
        \par\nobreak
        \vskip 12\p@
    \interlinepenalty\@M
    {\normalsize Oleh\par 
   \vspace{0.5cm}
    \@fullname\\
    \@idnum\\
    \vskip 10\p@
    }\par\nobreak
    }
  \begin{singlespace}%
  \vskip 20\p@
}
\def\endabstractind{\par\vfil\null\end{singlespace}}

%------------------------------------------------------------
%Redefine Abstract in English
%------------------------------------------------------------
\def\abstracteng{%
  \clearpage
  \selectlanguage{english}
  \phantomsection
  \addcontentsline{toc}{chapter}{\abstractname}
  \thispagestyle{chapterheading}%
  {\parindent \z@ \centering \normalfont
  {\large\textbf{\abstractname}}\\
  
  \vspace{1.0cm}
   {\large\textbf{\@titleeng}}
        \par\nobreak
        \vskip 12\p@
    \interlinepenalty\@M
    {\normalsize By\par 
   \vspace{0.5cm}
    \@fullname\\
    \@idnum\\
    \vskip 10\p@
    }\par\nobreak
    }  
  \begin{singlespace}%
  \vskip 20\p@
  }
\def\endabstracteng{\par\vfil\null\end{singlespace}%
\selectlanguage{bahasa}\clearpage\pagenumbering{arabic}\setcounter{page}{1}}


\AtBeginDocument{%
\if@doublesp%
\doublespacing%
\else\if@singlesp%
\singlespacing%
\else
\onehalfspacing%
\fi%
\fi
}

\AtBeginDocument{%
\if@langindo%
\selectlanguage{bahasa}%
\else
\selectlanguage{english}%
\fi
}

\endinput
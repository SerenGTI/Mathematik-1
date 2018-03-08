\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simonkoenigmathe}[2018/03/08 Simon Koenig Matheskript-Klasse]

\LoadClass[a4paper, oneside]{report}

\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage[top=3cm, bottom=4cm, outer=3.5cm, inner=3.5cm, heightrounded]{geometry}
\RequirePackage[default]{sourcesanspro}
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage{hyperref}

\RequirePackage{multicol}
\RequirePackage[fleqn]{mathtools}
\RequirePackage{amssymb}
\RequirePackage{latexsym}
\RequirePackage{amsfonts}

\RequirePackage[noindentafter]{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[framemethod=TikZ]{mdframed}

\RequirePackage{titling}
\newcommand{\subtitle}[1]{%
  \posttitle{%
    \par\end{center}
    \begin{center}\large#1\end{center}
    \vskip0.5em}%
}


\setlength{\parindent}{0pt}

\definecolor{accent}{rgb}{0,0.65,0.37}
\DeclareOption{green}{\definecolor{accent}{rgb}{0,0.65,0.37}}
\DeclareOption{red}{\definecolor{accent}{rgb}{0.75,0.22,0.22}}
\DeclareOption{orange}{\definecolor{accent}{rgb}{1, 0.6, 0}}
\DeclareOption{blue}{\definecolor{accent}{rgb}{0, 0.2, 0.6}}
\DeclareOption{purple}{\definecolor{accent}{rgb}{0.65,0,0.37}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%Malpunkte
\mathcode`\*="8000
{\catcode`\*\active\gdef*{\cdot}}



%%%TITLE%%%


\renewcommand{\maketitle}{%


  \medskip
	\thispagestyle{empty}
	\begin{center}

	  \vspace*{12em}

	  {\Huge \@title}

	  {
	  \color{accent}\rule{0.7\textwidth}{0.7pt}
	  }


	    \vfill


	  {\tiny\color{darkgray}\rule{0.3\textwidth}{0.5pt}
	  \vspace{0.5em}

	  \normalsize \@author}
	\end{center}
}





%%%SECTIONING AND LAYOUT%%%


\newlength\sectionnumberspace
\setlength\sectionnumberspace{3.5em}
\newcounter{satz}
\stepcounter{satz}
\newcounter{def}
\stepcounter{def}
\newcounter{lemma}
\stepcounter{lemma}

%SATZ
\newenvironment{satz}[1]
{\begin{mdframed}[style=Satzframe]
{\Large\raggedright\bfseries Satz \thechapter.\thesatz\stepcounter{satz}: \large #1}\vspace{1em} \newline
}
{\end{mdframed}\par}

%LEMMA
\newenvironment{lemma}[1]
{\begin{mdframed}[style=Satzframe]
{\Large\raggedright\bfseries Lemma \thechapter.\thelemma\stepcounter{lemma}: \large #1}\vspace{1em} \newline
}
{\end{mdframed}\par}


%CHAPTER
\titleformat{\chapter}[hang]
{\setcounter{def}{1}
\setcounter{lemma}{1}
\setcounter{satz}{1}
\Huge\centering\scshape}
{\color{accent}\bfseries\thechapter\Large: }
{0pt}
{\huge}
\titlespacing*{\chapter}{0pt}{0pt}{7em}

%SECTION
\titleformat{\section}[hang]
{\LARGE\raggedright\bfseries}
{\llap{\makebox[\sectionnumberspace][l]{\textcolor{accent}{\thesection}}\hfill}}
{0pt}
{\Large}
\titlespacing*{\section}{0pt}{3em}{1.2em}

%SUBSECTION, LEMMA, DEFINITION
\titleformat{\subsection}[hang]
{\Large\raggedright\bfseries}
{\llap{\makebox[\sectionnumberspace][l]{\textcolor{accent}{\thesubsection}}\hfill}}
{0em}
{\large}
\titlespacing*{\subsection}{0pt}{1.6em}{1em}

\newcommand{\definition}[1]{\subsection*{Definition \thechapter.\thedef\stepcounter{def}: #1}}


%BEWEIS, BEMERKUNG
\titleformat{\subsubsection}[hang]
{}
{}
{3pt}
{\large\bfseries}
\titlespacing*{\subsubsection}{0pt}{1em}{0.7em}

\newcommand{\beweis}{\subsubsection*{Beweis:}}
\newcommand{\bemerkung}{\subsubsection*{Bemerkung:}}

%BEISPIEL, MERKSATZ
\titleformat{\paragraph}[runin]
{}
{}
{3pt}
{\scshape\bfseries}
\titlespacing*{\paragraph}{0pt}{0.5em}{1em}




%%%PAGEHEADER%%%


\pagestyle{fancy}
\lfoot{Simon \textsc{König}}
\cfoot{Seite \thepage\thinspace von\thinspace\pageref{LastPage}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.4pt}

\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[C]{Seite \thepage\thinspace von\thinspace\pageref{LastPage}}%
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0.4pt}
}




%%%SATZ-LAYOUT%%%


\mdfdefinestyle{Satzframe}{
  skipabove=2em,
  linecolor=accent,
  outerlinewidth=1pt,
  roundcorner=2pt,
  innertopmargin=1.5em,
  innerbottommargin=\baselineskip,
  innerrightmargin=15pt,
  innerleftmargin=15pt,
  backgroundcolor=white!90!gray
}




%%%COMMANDS%%%



\newcommand{\intd}{\ensuremath\ \mathrm{d}}
\newcommand{\N}{\ensuremath\mathbb{N}}
\newcommand{\Z}{\ensuremath\mathbb{Z}}
\newcommand{\Q}{\ensuremath\mathbb{Q}}
\newcommand{\R}{\ensuremath\mathbb{R}}
\newcommand{\C}{\ensuremath\mathbb{C}}
\newcommand{\LM}{\ensuremath\mathbb{L}}%Lösungsmenge
\renewcommand{\P}{\ensuremath\mathcal{P}}%Potenzmenge
\newcommand{\Pot}{\ensuremath\mathrm{Pot}}%Potenzmenge
\renewcommand{\i}{\ensuremath\mathfrak{i}}%imaginäre Einheit
\renewcommand{\Im}{\ensuremath\mathfrak{Im}}
\renewcommand{\Re}{\ensuremath\mathfrak{Re}}

\newcommand{\spann}[1]{\ensuremath\mathrm{Span}\! \left(#1\right)}
\renewcommand{\vector}[1]{\ensuremath\begin{pmatrix} #1 \end{pmatrix}}
\renewcommand{\matrix}[1]{\ensuremath\begin{pmatrix} #1 \end{pmatrix}}
\renewcommand{\det}[1]{\ensuremath\mathrm{det}\! \left( #1 \right)}
\newcommand{\detmatrix}[1]{\ensuremath\begin{vmatrix} #1 \end{vmatrix}}

\newcommand{\rank}[1]{\ensuremath\mathrm{rk}\left(#1\right)}
\renewcommand{\dim}[1]{\ensuremath\mathrm{dim}\left(#1\right)}
\newcommand{\im}[1]{\ensuremath\mathrm{im}\,#1}
\renewcommand{\ker}[1]{\ensuremath\mathrm{ker}\,#1}

\newcommand{\set}[2]{\ensuremath \left\{ #1 \,\middle|\, #2 \right\}}%Menge
\newcommand{\simpleset}[1]{\ensuremath \left\{ #1 \right\}}%aufzählende Menge
\renewcommand{\emptyset}{\ensuremath\varnothing}

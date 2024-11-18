% Peadar Grant's notes format
\NeedsTeXFormat{LaTeX2e}

\ProvidesPackage{pgnotes}[2020/05/14 peadar grant's online lecture notes single]

\newif\ifslides
\DeclareOption{slides}{\slidestrue}
\ProcessOptions\relax

% Load correct document class
\ifslides
\PassOptionsToClass{oneside,20pt,titlepage}{extarticle}
\PassOptionsToPackage{paperheight=18.5cm,paperwidth=32cm,margin=0.5cm,bmargin=2.0cm,tmargin=2.0cm,rmargin=1.5cm}{geometry}
\else
\PassOptionsToClass{a4paper,12pt,oneside}{extarticle}
\PassOptionsToPackage{margin=1.0cm,tmargin=2.0cm,bmargin=3.0cm}{geometry}
\fi

% Load doc class w/ options
\LoadClass{extarticle}

\author{Dr Peadar Grant}

% Set geometry
\RequirePackage{geometry}

% Needed for auto-fill of commands
\RequirePackage{xspace}

% Nat Bib
\RequirePackage{natbib}
\RequirePackage{bibentry}

% Colour
\RequirePackage[usenames,dvipsnames,svgnames]{xcolor}

\date{\today}

% Math
\RequirePackage{amsmath}

% Symbology
\newcommand{\PUE}{\ensuremath{\mbox{PUE}}}
\newcommand{\MTBF}{\ensuremath{\mbox{MTBF}}}
\newcommand{\MTTR}{\ensuremath{\mbox{MTTR}}}
\newcommand{\EER}{\ensuremath{\mbox{EER}}}
\newcommand{\COP}{\ensuremath{\mbox{COP}}}
\newcommand{\Tdp}{\ensuremath{T_{\mbox{dp}}}}

% formatting for units
\RequirePackage[binary-units,detect-all]{siunitx}
\DeclareSIUnit{\BTU}{BTU}
\DeclareSIUnit{\year}{year}
\DeclareSIUnit{\fahrenheit}{\degree F}
\DeclareSIUnit{\failures}{failures}
\DeclareSIUnit{\days}{days}
\DeclareSIUnit{\months}{months}
\DeclareSIUnit{\years}{years}
\DeclareSIUnit{\hours}{hours}

% double spaced, no indent 
\RequirePackage[parfill]{parskip}

% disable hyphenation (confusing in notes)
\RequirePackage[none]{hyphenat}
\RequirePackage[document]{ragged2e}

% Image handling
\RequirePackage{graphicx}

% PDF switching used for detecting web version
\RequirePackage{ifpdf}

% document fonts
\ifpdf
\RequirePackage{helvet}
\renewcommand{\rmdefault}{\sfdefault}
\RequirePackage{sfmath}
\RequirePackage{inconsolata}
\fi

% caption formatting
\RequirePackage[font=sf,labelfont=bf]{caption}

% table formatting
\RequirePackage{booktabs}
\RequirePackage{tabularx}

\RequirePackage{tikz}
\usetikzlibrary{arrows,positioning}
\RequirePackage{pgfplots}
\RequirePackage[most]{tcolorbox}


\RequirePackage{environ}

% Highlight box
\newtcolorbox{hlbox}[1]{fonttitle=\bfseries\upshape,arc=2mm, colback=blue!5!white,colframe=blue!75!black, title=#1}
\newtcolorbox{greenbox}[1]{fonttitle=\bfseries\upshape,arc=2mm, colback=DarkGreen!5!white,colframe=DarkGreen!75!black, title=#1}
\newtcolorbox{bluebox}[1]{fonttitle=\bfseries\upshape,arc=2mm, colback=DarkBlue!5!white,colframe=DarkBlue!75!black, title=#1}
\newtcolorbox{redbox}[1]{fonttitle=\bfseries\upshape,arc=2mm, colback=DarkRed!5!white,colframe=DarkRed!75!black, title=#1}


% Example blocks
\tcbset{examplestyle/.style={fonttitle=\bfseries\upshape, fontupper=\slshape,arc=2mm, colback=DarkGreen!5!white,colframe=DarkGreen!75!black},}
\newtcbtheorem{example}{Example}{examplestyle}{example}


% source code formatting
\RequirePackage{xpatch}
\RequirePackage{minted}
\usemintedstyle{emacs}
% fix for minted with imports
%\xpatchcmd\inputminted
%  {#3}
%  {\import@path #3}
%  {}{\fail}

\ifslides
\def\fps@figure{hpbt}
\def\fps@table{hpbt}
\else
\def\fps@figure{htbp}
\def\fps@table{htbp}
\fi

\newcommand{\autoimage}[3]{
  % 1 = image file
  % 2 = caption
  % 3 = label
  \ifslides
  \newpage
  \fi
  \begin{figure}
    \centering
    \ifslides
    \includegraphics[width=1.0\linewidth,height=0.7\paperheight,keepaspectratio]{#1}
    \else
    \includegraphics[width=0.6\linewidth]{#1}
    \fi
  \caption{#2}
  \label{fig:#3}
\end{figure}
\ifslides
\clearpage
\newpage
\fi
}


\newcommand{\autompimage}[3]{
  % 1 = image file
  % 2 = caption
  % 3 = label
  \begin{center}
    \ifslides
    \includegraphics[width=1.0\linewidth,height=0.7\paperheight,keepaspectratio]{#1}
    \else
    \includegraphics[width=0.6\linewidth]{#1}
    \fi
  \captionof{figure}{#2}
  \label{fig:#3}
  \end{center}

}


\newcommand{\autoimagefull}[3]{
  % 1 = image file
  % 2 = caption
  % 3 = label
  \begin{figure}
    \centering
    \ifslides
    \includegraphics[width=1.0\linewidth,height=0.7\paperheight,keepaspectratio]{#1}
    \else
    \includegraphics[width=1.0\linewidth]{#1}
    \fi
  \caption{#2}
  \label{fig:#3}
\end{figure}
}


\makeatother

\newcommand{\requiredreading}{
  \bibliographystyle{plainnat}
  \bibliography{bibliography}
}

\RequirePackage[pdfusetitle]{hyperref}

\pagestyle{headings}

\ifslides
\renewcommand{\thepage}{S.\arabic{page}}
\RequirePackage{titlesec}
\newcommand{\sectionbreak}{\newpage}
\newcommand{\subsectionbreak}{\newpage}
\newcommand{\subsubsectionbreak}{\newpage}
\setcounter{tocdepth}{1}

\titleformat{\section}{\color{DarkBlue}\normalfont\Large\bfseries}{\color{DarkBlue}\thesection}{1em}{}
\titleformat{\subsection}{\color{DarkBlue}\normalfont\bfseries}{\color{DarkBlue}\thesubsection}{1em}{}
\titleformat{\subsubsection}{\color{DarkGreen}\normalfont\bfseries}{\color{DarkGreen}\thesubsubsection}{1em}{}

\fi

\providecommand{\tightlist}{\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

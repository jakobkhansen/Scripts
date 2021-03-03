filename=$1

touch $filename

echo '\documentclass[12pt]{article}

\setlength\parindent{0pt}

\usepackage[norsk]{babel}
\usepackage{graphicx}
\usepackage{amsmath}
\usepackage{tikz}
\usepackage{hyperref}
\usepackage{graphicx}
\usepackage[a4paper, total={6.25in, 9.5in}]{geometry}
\setlength{\voffset}{0.25in}
\setlength{\headsep}{5pt}
\setlength{\parskip}{1em}
\usepackage{listings}

\definecolor{pblue}{rgb}{0.2,0.2,0.7}
% \definecolor{pgreen}{rgb}{0,0.5,0}
\definecolor{pred}{rgb}{0.7,0.2,0.2}
\definecolor{pgrey}{rgb}{0.46,0.45,0.48}

\lstset{
  backgroundcolor = \color{lightgray},
  language=Bash,
  showstringspaces=false,
  columns=flexible,
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3
}

\hbadness=10000

\usetikzlibrary{automata, positioning, arrows}

\tikzset{
    ->,
    node distance=3cm,
    initial text=$ $,
}

\title{Tittel}

\author{Jakob Hansen}

\date{\today}

\begin{document}
\maketitle

\section*{Oppgave 1}
\subsection*{1a}

\end{document}' > $filename

filename=$1

touch $filename

echo '\documentclass[12pt]{article}

\setlength\parindent{0pt}

\usepackage[norsk]{babel}
\usepackage{graphicx}
\usepackage{amsmath}
\usepackage{tikz}
\usetikzlibrary{automata, positioning, arrows}

\tikzset{
    ->,
    node distance=3cm,
    initial text=$ $,
}

\title{\vspace*{-3cm}Tittel}

\author{Jakob Hansen}

\date{\today}

\begin{document}
\maketitle

\section*{Oppgave 1}
\subsection*{1a}

\end{document}' > $filename

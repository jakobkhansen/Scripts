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

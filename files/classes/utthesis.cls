%%
%% This is file `utthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% utthesis.dtx  (with options: `class')
%% ----------------------------------------------------------------
%% utthesis --- A class for the UT thesis
%% E-mail: henryiii@physics.utexas.edu
%% Released under the LaTeX Project Public License v1.3c or later
%% See http://www.latex-project.org/lppl.txt
%% ----------------------------------------------------------------
%% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\jobname}[2016/05/02 v1.1  A class for the UT thesis]
\LoadClass[12pt,oneside]{memoir}
\RequirePackage{xparse}
\RequirePackage{amsmath}
\RequirePackage{etoolbox}
\RequirePackage{setspace}

\setlrmarginsandblock{1.25in}{1.25in}{*} % spine, edge
\setulmarginsandblock{1.25in}{1.5in}{*} % {hupperi}{hloweri}{hratioi}
\setheadfoot{.5in}{.5in} % Headheight, footskip
\setheaderspaces{*}{.25in}{*} % headdrop, headsep, ratio

\checkandfixthelayout
\typeoutlayout

\pagestyle{plain}

\newcommand\UTSpacing{\OnehalfSpacing}
\DeclareOption{double}{\renewcommand\UTSpacing{\DoubleSpacing}}
\DeclareOption{single}{\renewcommand\UTSpacing{\SingleSpacing}}
\ProcessOptions\relax
\UTSpacing

\setsecnumdepth{subsubsection}

\def\UTNumToName#1{%
\if!\ifnum9<1#1!\fi
\NumToName{#1}\else#1\fi}

\renewcommand\chapternumberline[1]{%
   \@chapapp@head\@cftbsnum \UTNumToName{#1}\@cftasnum\afterchapternum}
\renewcommand\cftchaptername{\chaptername~}
\renewcommand{\cftappendixname}{\appendixname~}

\renewcommand{\cftchapterfont}{}
\renewcommand{\cftchapterdotsep}{\cftdotsep}
\renewcommand{\cftchapterleader}{\normalfont\cftdotfill{\cftchapterdotsep}}
\renewcommand{\cftchapterpagefont}{}

\setlength\cftparskip{2ex}
\setlength\cftbeforechapterskip{0em}
\setlength\cftbeforesectionskip{0em}
\renewcommand\insertchapterspace{}

\cftsetindents{section}{2em}{0em}

\let\thesisnumberline\numberline
\renewcommand{\numberline}[1]{}

\let\oldlistoffigures\listoffigures
\def\thesislistoffigures{%
\clearpage
\SingleSpacing
    \let\numberline\thesisnumberline
    \oldlistoffigures
    \renewcommand{\numberline}[1]{}
    \UTSpacing
    }
\let\listoffigures\thesislistoffigures

\let\oldlistoftables\listoftables
\def\thesislistoftables{%
\clearpage
\SingleSpacing
\let\numberline\thesisnumberline
\oldlistoftables
\renewcommand{\numberline}[1]{}
\UTSpacing
}
\let\listoftables\thesislistoftables

\renewcommand{\afterchapternum}{:~}
\renewcommand{\chapnamefont}{\bfseries\Large\centering}
\renewcommand{\chaptitlefont}{\chapnamefont}
\setlength\beforechapskip{-\baselineskip}
\renewcommand{\printchapternum}{\UTNumToName{\thechapter}}

\numberwithin{equation}{chapter}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}

\let\oldtableofcontents\tableofcontents
\RenewDocumentCommand \tableofcontents { s t. } {%
\clearpage
\SingleSpacing
\IfBooleanTF #2 {%
\let\numberline\thesisnumberline
\cftsetindents{section}{1em}{2em}
\oldtableofcontents*
\cftsetindents{section}{1em}{0em}
\renewcommand\numberline[1]{}
}{%
    \renewcommand\numberline[1]{}
    \oldtableofcontents*
    }
    \UTSpacing
}
\newcommand{\UTdegree}{Ph.D.}
\newcommand{\UTlongdegree}{Doctor of Philosophy}
\newcount\UTyear
\UTyear=\year
\DeclareDocumentCommand{\UTcopyrightlegend}{  }{%
\begin{titlingpage*}
\begin{vplace}
\centering\Large\bfseries
Copyright\\
by\\
\theauthor\\
\the\UTyear
\end{vplace}
\end{titlingpage*}}
\DeclareDocumentCommand{\UTaddcommittee}{ m }{
\vskip 3em
\hrule
\vskip .4em
#1

}
\DeclareDocumentCommand{\UTaddsupervisor}{ m }{
\vskip 3em
\hrule
\vskip .4em
#1, Supervisor
}
\DeclareDocumentCommand{\UTaddcosupervisor}{ m }{
\vskip 3em
\hrule
\vskip .4em
#1, Co-Supervisor
}
\DeclareDocumentCommand{\UTtitlepage}{m m}{
\begin{titlingpage*}
\begin{vplace}
\centering
{
\bfseries
\thetitle
}

\vskip 1em

by

\vskip 1em

{
\bfseries
\theauthor, #1

\vskip 3em
Dissertation
}

Presented to the Faculty of the Graduate School of\\
The University of Texas at Austin\\
in Partial Fulfillment\\
of the Requirements\\
for the degree of\\
{\bfseries \UTlongdegree}

\vskip 3em

The University of Texas at Austin\\
#2, \the\UTyear
\end{vplace}
\end{titlingpage*}}
\DeclareDocumentEnvironment{UTabstract}{ s O{} m  }{ %
\begin{center}
{\bfseries\thetitle}

\vskip 2em
\IfBooleanTF{#1}{
Publication No. \underline{\hspace{3.7cm}}
\vskip 2em
}{}

\theauthor, \UTdegree

The University of Texas at Austin, \the\UTyear

\vskip 2em

Supervisor#2: #3

\vskip 2em

\end{center}
\indent
}{}
\DeclareDocumentEnvironment{UTcommittee}{ }{ %
\begin{titlingpage*}
\bfseries
\begin{center}
\begin{SingleSpace}
The Dissertation Committee for \theauthor\ certifies that this is the approved version of the following dissertation:
\end{SingleSpace}
\vskip 2.5em
\large
\thetitle
\end{center}
\vskip 5em
\begin{flushright}
\begin{minipage}[b]{3in}
\begin{flushleft}
Committee:
}{ %
\end{flushleft}
\end{minipage}
\end{flushright}
\end{titlingpage*}}
\DeclareDocumentCommand{\UTdedication}{m}{%
\begin{titlingpage*}
\begin{vplace}[0.7]
\begin{center}
#1
\end{center}
\end{vplace}
\end{titlingpage*}
}
%% 
%% Copyright (C) 2014 by Henry Schreiner <henryiii@physics.utexas.edu>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Henry Schreiner.
%% 
%% This work consists of the file  utthesis.dtx
%% and the derived files           utthesis.ins,
%%                                 utthesis.pdf,
%%                                 utthesis.cwl, and
%%                                 utthesis.cls.
%% 
%%
%% End of file `utthesis.cls'.

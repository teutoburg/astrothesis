\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{astrothesis}[2022/01/02 Astro Master's thesis class (template)]

\newcommand{\loadgeo}{\RequirePackage[pass]{geometry}}

\DeclareOption{tightmargins}{\renewcommand{\loadgeo}{\RequirePackage[a4paper, inner=2.5cm, hmarginratio=4:5, top=3.5cm, vmarginratio=4:5]{geometry}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[11pt]{book}


\RequirePackage{menukeys}
\RequirePackage[parfill]{parskip}
\RequirePackage[super]{nth}
\RequirePackage{textgreek}
\RequirePackage{hyperref}
\RequirePackage{rotating}
\RequirePackage{suffix}
\RequirePackage{siunitx}
\RequirePackage{aasmacros}
\RequirePackage{graphicx}
\RequirePackage{appendix}

\loadgeo

\RequirePackage{natbib}
\bibliographystyle{plainnat}
\setcitestyle{authoryear, round}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% https://tex.stackexchange.com/questions/287657/learning-to-use-xparse
% https://tex.stackexchange.com/questions/217757/special-behavior-if-optional-argument-is-not-passed
% https://tex.stackexchange.com/questions/53068/how-to-check-if-a-macro-value-is-empty-or-will-not-create-text-with-plain-tex-co
% https://tug.org/TUGboat/tb28-1/tb88flynn.pdf

% **************   TITLE PAGE   **************
\makeatletter

\newcommand{\headline}[1]{{\fontsize{24}{0}\fontseries{b}\selectfont#1}}
\newcommand{\titleline}[1]{{\fontsize{18}{0}\fontseries{b}\selectfont ``#1''}}
\newcommand{\nameline}[1]{{\fontsize{14}{0}\selectfont#1}}

\newcommand{\supervisorline}{
    Betreut von / Supervisor:\vspace*{0.4cm} & \@supervisor \\
    }

\newcommand{\cosupervisorline}{
    \if\@cosupervisor\relax

    \else
        Mitbetreut von / Co-Supervisor: & \@cosupervisor \\
    \fi
    }

\renewcommand{\maketitle}{
    \newgeometry{left=25mm,right=20mm, top=15mm, bottom=20mm} % only for title page
    \thispagestyle{empty} % no page number on title page

    %\twocolumn[%\begin{@twocolumnfalse}
    {\fontsize{10}{10}\sffamily\selectfont
        \begin{center}
            \begin{figure}
                \hspace{9.1cm}
                \includegraphics[width=7.31cm]{uni_logo.png}
            \end{figure}

            \vspace*{50pt}

            {\fontsize{11}{11}\selectfont
                \headline{MASTERARBEIT / MASTER'S THESIS}\\
                \vspace{48pt}
                Titel der Masterarbeit / Title of the Master's Thesis\\
                \vspace{6pt}
                \titleline{\@title}\\
                \vspace{80pt}
                verfasst von / submitted by\\
                \vspace{6pt}
                \nameline{\@author}\\
                \vspace{62pt}
                angestrebter akademischer Grad / in partial fulfilment of the requirements for the degree of\\
                \vspace{6pt}
                \nameline{\@degree}\\
            }
        \end{center}

        \vspace{45pt}

        \begin{tabular}{p{8cm}p{11.25cm}}
            {\fontsize{11}{0}\selectfont Wien,  \@date \ / Vienna, \@date}  & \\[55pt]

        	Studienkennzahl lt. Studienblatt / & \@degreecode \\
            degree programme code as it appears on & \\
            the student record sheet: & \\[6pt]

        	Studienrichtung lt. Studienblatt / & \@degreename \\
            degree programme as it appears on & \\
            the student record sheet: & \\[6pt]

        	\supervisorline
        	\cosupervisorline
        \end{tabular}
        }
    \restoregeometry
    %\end{@twocolumnfalse}
    %]
    \cleardoublepage
    \begin{center}
        \vspace*{10ex}
        {\LARGE\textbf{\@title}}

        \vspace{4ex}
        {\Large\@author}

        \vspace{8ex}
        \textbf{Abstract}

        \begin{quotation}
            \@abstract
        \end{quotation}

    \end{center}
    }

\newcommand\supervisor[1]{\renewcommand\@supervisor{#1}}
\newcommand\@supervisor{\@latex@error{No \noexpand\supervisor given}\@ehc}
\def\@cosupervisor{\relax}
\newcommand{\cosupervisor}[1]{\gdef\@cosupervisor{#1}}

\def\@degree{Master of Science \ (MSc)} % akademischer Grad
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\def\@degreecode{UA 066 861} % Studienkennzahl
\newcommand{\degreecode}[1]{\gdef\@degreecode{#1}}
\def\@degreename{Astronomie} % Studienrichtung
\newcommand{\degreename}[1]{\gdef\@degreename{#1}}

\newcommand\abstract[1]{\renewcommand\@abstract{#1}}
\newcommand\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}

\makeatother

% **************   END TITLE PAGE   **************

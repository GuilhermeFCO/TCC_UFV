\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tcc}[2020/09/01 TCC Pattern UFV]
\newcommand*{\getclass}{tcc}
\newcommand*{\getclassdir}{TCC}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\newcommand*{\@DefUniv}{}
\newtoggle{@SHORT}
\newtoggle{@EBOOK}
\newtoggle{@TWOSIDE}
\newcommand*{\@TEXTMODE}{final}
\newcommand*{\@EQNALINEMENT}{}
\newcommand*{\@SIDES}{oneside}
\newcommand*{\@OPENCHAPTER}{openany}
\newcommand*{\@ClearPreamblePage}{\clearpage}
\newcommand*{\@JumpPage}
{%
  \iftoggle{@EBOOK}{\clearpage}
  {%
    \clearpage
    \thispagestyle{empty}
    \null
    \addtocounter{page}{-1}
    \newpage
  }
}
\DeclareOption{short}  {\toggletrue{@SHORT}}
\DeclareOption{ebook}  {\toggletrue{@EBOOK}}
\DeclareOption{twoside}{\toggletrue{@TWOSIDE}
                        \renewcommand*{\@SIDES}{twoside}
                        \renewcommand*{\@ClearPreamblePage}
{\@JumpPage}}
\DeclareOption{draft}  {\renewcommand*{\@TEXTMODE}    
{draft}}
\DeclareOption{fleqn}  {\renewcommand*{\@EQNALINEMENT}
{fleqn}}
\DeclareOption*
{
  \PackageWarning{\getclass}{Unknown ‘\CurrentOption’}
}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,onecolumn,notitlepage,\@TEXTMODE,\@EQNALINEMENT,\@SIDES,\@OPENCHAPTER]{book}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,brazil]{babel}
\RequirePackage{indentfirst}
\RequirePackage{icomma}
\RequirePackage{csquotes}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ae}
\RequirePackage[T1]{fontenc}
\RequirePackage[final]{microtype}
\raggedbottom
\RequirePackage[nottoc,notlot,notlof]{tocbibind}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}
\setstretch{1.1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[overload]{textcase}
\RequirePackage{latexsym}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\def\fps@figure{htbp}
\def\fps@table{htbp}
\setcounter{topnumber}{4}
\setcounter{bottomnumber}{4}
\setcounter{totalnumber}{10}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.70}
\renewcommand{\floatpagefraction}{0.66}
\setcounter   {dbltopnumber}           {2}
\renewcommand*{\dbltopfraction}        {1}
\renewcommand*{\dblfloatpagefraction}{0.9}
\RequirePackage[width=0.96\linewidth,justification=centerlast,labelfont=bf]{caption}
\RequirePackage[below]{placeins}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{changepage}
\RequirePackage{pdfpages}
\RequirePackage{comment}
\RequirePackage{textpos}
\RequirePackage{array}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[a4paper]{geometry}
\geometry{margin=20mm,top=30mm}
\iftoggle{@EBOOK}{\geometry{inner=30mm,outer=30mm}}
                 {\geometry{inner=40mm}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}
\RequirePackage[tocflat]{tocstyle}
\usetocstyle{standard}
\RequirePackage[bf,rm,compact,raggedright]{titlesec}
\font\bigrm = cmr10 at 40pt
\titleformat{\chapter}[display]
            {\normalfont\huge\sffamily}
            {\rightline{\normalfont\bigrm{\thechapter}}}
            {-1cm}                                
            {\bfseries}
            [{\vspace{-5mm}\hrulefill\\[.8ex]}] 
\titlespacing{\chapter}                                                      
            {0cm}{0.5cm}{1.5cm}
            
\@ifpackagelater{titlesec}{2016/03/21}{}
{
  \patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}
  \patchcmd{\ttlh@hang}{\noindent}{}{}{}
}
\RequirePackage{fancyhdr}
\renewcommand*{\chaptermark}[1]{\markboth{\thechapter.\ #1}{} }
\renewcommand*{\sectionmark}[1]{\markright{\thesection\ #1}}  
\lhead[\fancyplain{}{\bfseries\thepage}]
      {\fancyplain{}{\small\slshape\bfseries\textit{\nouppercase{\leftmark}}}}
\rhead[\fancyplain{}{\small\slshape\bfseries\textit{\nouppercase{\rightmark}}}] 
      {\fancyplain{}{\bfseries\thepage}}
\cfoot[\fancyplain{\bfseries\thepage}{}]
      {\fancyplain{\bfseries\thepage}{}}
\renewcommand*{\headrulewidth}{0.3pt}                       

\setlength{\headheight}{15pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \RequirePackage[backend=biber,%
%                 style=numeric,%
%                 isbn=false,%
%                 sorting=nyt,%
%                 language=brazil,%
%                 block=space,%
%                 urldate=long,%
%                 uniquename=false,%
%                 sorting=nty,%
%                 giveninits=true]{biblatex}
% 
% \DeclareNameAlias{default}{last-first}
% \renewbibmacro{in:}{}
% 
% \AtBeginBibliography{%
%     \setstretch{1}%
%     \vspace{-3\baselineskip}%
% }
% 
% \renewcommand*{\bibname}{Bibliografia}
% \renewcommand*{\bibfont}{\small}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\urlstyle{same}
\def\UrlBreaks{\do\/\do-}
\iftoggle{@EBOOK}{ \hypersetup{colorlinks=true,linkcolor=black} }
                 { \hypersetup{hidelinks} }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newtheoremstyle{teostyle}
{1.1\topsep}
{1.1\topsep}
{}
{}
{\bfseries}
{:}
{.5\parindent}
{\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}
\theoremstyle{teostyle}
\newtheorem{axioma}    {Axioma}    [chapter]
\newtheorem{definicao} {Definição} [chapter]
\newtheorem{postulado} {Postulado} [chapter]
\newtheorem{proposicao}{Proposição}[chapter]
\newtheorem{lema}      {Lema}      [chapter]
\newtheorem{teorema}   {Teorema}   [chapter]
\newtheorem{corolario} {Corolário} [chapter]
\newtheorem{exemplo}   {Exemplo}   [section]
\newtheorem{exercicio} {Exercício} [section]
\renewenvironment{proof}[1][\proofname]
{%
  \par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \list{}{\leftmargin=.5\parindent
          \rightmargin=.5\parindent
          \settowidth{\itemindent}{\itshape#1}%
          \labelwidth=\itemindent
          \parsep=0pt 
	  \listparindent=\parindent 
  }
  \item[\hskip\labelsep
        \itshape
    #1\@addpunct{.}]\ignorespaces
}
{%
  \popQED\endlist\@endpefalse
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{quote}
{%
    \list{}{\rightmargin\leftmargin}%
    \item\relax\itshape%
}
{%
    \endlist%
}
\renewenvironment{quotation}
{%
    \list{}{%
        \listparindent 1.5em%
        \itemindent    \listparindent
        \rightmargin   \leftmargin
        \parsep        \z@ \@plus\p@}%
    \item\relax\itshape%
}
{%
    \endlist%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\sin\relax        \DeclareMathOperator{\sin}{sen}
\let\csc\relax        \DeclareMathOperator{\csc}{cossec}
\let\tan\relax        \DeclareMathOperator{\tan}{tg}
\let\cot\relax        \DeclareMathOperator{\cot}{cotg}
\let\arcsin\relax     \DeclareMathOperator{\arcsin}{arcsen}
\let\arctan\relax     \DeclareMathOperator{\arctan}{arctg}
\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccsc}{arccossec}
\DeclareMathOperator{\arccot}{arccotg}
\newcommand*{\N}{\mathbb{N}}
\newcommand*{\Z}{\mathbb{Z}}
\newcommand*{\Q}{\mathbb{Q}}
\newcommand*{\R}{\mathbb{R}}
\newcommand*{\Co}{\mathbb{C}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\TheUNI}        {UFV} 
\newcommand*{\TheLogo}       {logo-ufv}
\newcommand*{\ThePlace}      {Florestal \\ Minas Gerais -- Brasil}
\newcommand*{\TheUniversity} {Universidade Federal de Viçosa}
\newcommand*{\TheCatalogName}{ficha\_catalografica\_ufv.pdf}
\newcommand*{\TheCatalogFile}{ficha_catalografica_ufv.pdf}
\newcommand*{\@TheDeclaration}
{%
  Trabalho de Conclusão de Curso apresentado à Universidade Federal de Viçosa, 
  como parte das exigências para obter o diploma.
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\@Place}
{
  \null
  \vfill
  \begin{spacing}{1}
  \begin{center}
    \textsc{\ThePlace \\ \@TheYear}
  \end{center}
  \end{spacing}
}
\newcommand*{\@Declaration}
{%
  \begin{spacing}{1}
  % Author name
  \begin{textblock*}{\linewidth}(0cm,-\baselineskip)
    \begin{center}
      \textsc{\large\@TheAuthor}
    \end{center}
  \end{textblock*}
  % Dissertation title
  \begin{textblock*}{\linewidth}[0,0.5](0cm,0.23\textheight)
    \begin{center}
        \textbf{\large\@TheTITLE}
    \end{center}
  \end{textblock*}
  % Declaration
  \begin{textblock*}{0.7\linewidth}(0.28\linewidth,0.35\textheight)
    \noindent \@TheDeclaration
  \end{textblock*}
  \end{spacing}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\@Monthpt}[1]
{%
  \ifcase#1
  \or janeiro%    1
  \or fevereiro%  2
  \or março%      3
  \or abril%      4
  \or maio%       5
  \or junho%      6
  \or julho%      7
  \or agosto%     8
  \or setembro%   9
  \or outubro%   10
  \or novembro%  11
  \or dezembro%  12
  \fi%
}
\newcommand*{\@MonthPT}[1]
{%
  \ifcase#1
  \or Janeiro%    1
  \or Fevereiro%  2
  \or Março%      3
  \or Abril%      4
  \or Maio%       5
  \or Junho%      6
  \or Julho%      7
  \or Agosto%     8
  \or Setembro%   9
  \or Outubro%   10
  \or Novembro%  11
  \or Dezembro%  12
  \fi%
}
\newcommand*{\@MonthEN}[1]
{%
  \ifcase#1
  \or January%    1
  \or February%   2
  \or March%      3
  \or April%      4
  \or May%        5
  \or June%       6
  \or July%       7
  \or August%     8
  \or September%  9
  \or October%   10
  \or November%  11
  \or December%  12
  \fi%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\@SignatureBox}[1]
{
  \begin{minipage}[t][5.5\baselineskip]{0.45\linewidth}
    \begin{spacing}{1}
      \begin{center}
        \hrulefill \\ {#1}
      \end{center}
    \end{spacing}
  \end{minipage}
}
\newcommand*{\@SignaturesTableThree}[3]
{
  \begin{center}
    \@SignatureBox{#1} \hfill
    \@SignatureBox{#2} \\
    \@SignatureBox{#3}
  \end{center}
}
\newcommand*{\@SignaturesTableFour}[4]
{
  \begin{center}
    \@SignatureBox{#1} \hfill
    \@SignatureBox{#2} \\
    \@SignatureBox{#3} \\
    \@SignatureBox{#4}
  \end{center}
}
\newcommand*{\@SignaturesTableFive}[5]
{
  \begin{center}
    \@SignatureBox{#1} \hfill
    \@SignatureBox{#2} \\
    \@SignatureBox{#3} \hfill
    \@SignatureBox{#4} \\
    \@SignatureBox{#5}
  \end{center}
}
\newcommand{\@SignaturesTableSix}[6]
{
  \begin{center}
    \@SignatureBox{#1} \hfill
    \@SignatureBox{#2} \\
    \@SignatureBox{#3} \hfill
    \@SignatureBox{#4} \\
    \@SignatureBox{#5} \hfill
    \@SignatureBox{#6} \\
  \end{center}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\protected\def\reversename#1{\xreverseit{}#1 \relax}
\def\xreverseit#1#2 #3{%
\ifx\relax#3%
\MakeUppercase{#2},#1%
\expandafter\xthree
\fi
\xreverseit{#1 #2}#3}
\def\xthree#1#2#3{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\@TheTitle}{Título do Trabalho}
\newcommand*{\@TheTITLE}{TÍTULO DO TRABALHO}
\newcommand*{\@TheTitleEn}{Thesis Title}
\newcommand*{\@TheTITLEEN}{THESIS TITLE}
\renewcommand*{\title}  [1]{\renewcommand*{\@TheTitle}  {{#1}} \renewcommand*{\@TheTITLE}  {\MakeUppercase{#1}}}
\newcommand*  {\titleEn}[1]{\renewcommand*{\@TheTitleEn}{{#1}} \renewcommand*{\@TheTITLEEN}{\MakeUppercase{#1}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\@AuthorTitle}     {Autor(a)}
\newcommand*{\@TheAuthor}       {Nome do Autor(a)}
\newcommand*{\@TheAuthorSurname}{Autor(a), Nome do(a)}
\newcommand*{\autor} [1]{ \renewcommand*{\@AuthorTitle}{Autor}  \renewcommand*{\@TheAuthor}{{#1}} \renewcommand*{\@TheAuthorSurname}{\reversename{#1}} }
\newcommand*{\autora}[1]{ \renewcommand*{\@AuthorTitle}{Autora} \renewcommand*{\@TheAuthor}{{#1}} \renewcommand*{\@TheAuthorSurname}{\reversename{#1}} }
\renewcommand{\author}[1]{\autor{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\@AdvisorResumo}  {Orientador(a): Nome do(a) Orientador(a).}
\newcommand*{\@AdvisorAbstract}{Adviser:       Nome do(a) Orientador(a).}
\newcommand*{\@CoadvisorResumo}  {}
\newcommand*{\@CoadvisorAbstract}{}
\newcommand*{\orientador} [1]{ \renewcommand*{\@AdvisorResumo}{Orientador:  {#1}. } \renewcommand*{\@AdvisorAbstract}{Adviser: {#1}. } }
\newcommand*{\orientadora}[1]{ \renewcommand*{\@AdvisorResumo}{Orientadora: {#1}. } \renewcommand*{\@AdvisorAbstract}{Adviser: {#1}. } }
\newcommand*{\coorientador}  [1]{ \renewcommand*{\@CoadvisorResumo}{Coorientador:   {#1}.        } \renewcommand*{\@CoadvisorAbstract}{Co-adviser:  {#1}.          } }
\newcommand*{\coorientadora} [1]{ \renewcommand*{\@CoadvisorResumo}{Coorientadora:  {#1}.        } \renewcommand*{\@CoadvisorAbstract}{Co-adviser:  {#1}.          } }
\newcommand*{\coorientadores}[2]{ \renewcommand*{\@CoadvisorResumo}{Coorientadores: {#1} e {#2}. } \renewcommand*{\@CoadvisorAbstract}{Co-advisers: {#1} and {#2}. } }
\newcommand*{\coorientadoras}[2]{ \renewcommand*{\@CoadvisorResumo}{Coorientadoras: {#1} e {#2}. } \renewcommand*{\@CoadvisorAbstract}{Co-advisers: {#1} and {#2}. } }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\@TheDay}      {31}
\newcommand*{\@TheMonth}    {02}
\newcommand*{\@TheYear}     {2000}
\newcommand*{\@TheMonthpt}  {\@Monthpt{2}}
\newcommand*{\@TheMonthPT}  {\@MonthPT{2}}
\newcommand*{\@TheMonthEN}  {\@MonthEN{2}}
\newcommand*{\@TheDate}     {\@TheDay\ de \@TheMonthpt\ de \@TheYear}
\renewcommand*{\date}[3]
{
  \renewcommand*{\@TheDay}  {{#1}}
  \renewcommand*{\@TheMonth}{{#2}}
  \renewcommand*{\@TheYear} {{#3}}
  \renewcommand*{\@TheMonthpt}{\@Monthpt{#2}}
  \renewcommand*{\@TheMonthPT}{\@MonthPT{#2}}
  \renewcommand*{\@TheMonthEN}{\@MonthEN{#2}}
  \renewcommand*{\@TheDate}   {\@TheDay\ de \@TheMonthpt\ de \@TheYear}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\@SignaturesTable}{\@SignaturesTableThree{Membro da Banca}{Membro da Banca}{Membro da Banca}}
\DeclareDocumentCommand{\board}{ m m m g g g }
{
  \newcounter{@listcounter}
  \defcounter{@listcounter}{3}
  \IfNoValueF{#4}{\defcounter{@listcounter}{4}}
  \IfNoValueF{#5}{\defcounter{@listcounter}{5}}
  \IfNoValueF{#6}{\defcounter{@listcounter}{6}}
  \ifnumequal{\value{@listcounter}}{3}{ \renewcommand*{\@SignaturesTable}{\@SignaturesTableThree{#1}{#2}{#3}             }}{}
  \ifnumequal{\value{@listcounter}}{4}{ \renewcommand*{\@SignaturesTable}{\@SignaturesTableFour {#1}{#2}{#3}{#4}         }}{}
  \ifnumequal{\value{@listcounter}}{5}{ \renewcommand*{\@SignaturesTable}{\@SignaturesTableFive {#1}{#2}{#3}{#4}{#5}     }}{}
  \ifnumequal{\value{@listcounter}}{6}{ \renewcommand*{\@SignaturesTable}{\@SignaturesTableSix  {#1}{#2}{#3}{#4}{#5}{#6} }}{}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\MakeTitlePage}
{%
  \begin{center}
    \textsc{ {\large \TheUniversity} \\[1mm] Trabalho de Conclusão de Curso} \\[5mm]
    \includegraphics[height=.15\textheight]{figs/\TheLogo}
  \end{center}
  \begin{textblock*}{\linewidth}(0cm,0.03\textheight)
    \begin{center}
      \textsc{\large\@TheAuthor}
    \end{center}
  \end{textblock*}
  \begin{textblock*}{\linewidth}(0cm,0.2\textheight)
    \begin{center}
      \begin{spacing}{1.7}
        \textsc{\LARGE\@TheTitle}
      \end{spacing}
    \end{center}
  \end{textblock*}
  \@Place
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\MakeDeclarationPage}
{%
  \@Declaration
  \@Place
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\MakeIndexCardPage}
{%
  \IfFileExists{./\TheCatalogFile}
  {%
    \includepdf[pages=last-last]{\TheCatalogFile}
  }{% else
    \clearpage
    \null\vspace{5cm}
    \begin{center}
      \textsc{\Large Ficha Catalográfica} \\[5cm]
      { \large
	Copie o arquivo 
	\\[4mm]
	{\Large\texttt{\TheCatalogName}}
	\\[4mm]
        fornecido pela \TheUNI{} para a pasta do trabalho e a ficha catalográfica será automaticamente incluída aqui.
      }
    \end{center}
    \clearpage
  }
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\@MakeSignaturesPage}
{%
  \@Declaration
  \vspace{0.48\textheight}
  \noindent\textsc{Aprovada}: \@TheDate.
  \vspace{2.5\baselineskip}
  \begin{adjustwidth}{2mm}{2mm}
    \@SignaturesTable
  \end{adjustwidth}
}
\newcommand*{\MakeSignaturesPage}
{%
  \iftoggle{@EBOOK}
  {%
    \IfFileExists{./assinaturas.pdf}{\includepdf{./assinaturas.pdf}}{
    \IfFileExists{./assinaturas.pdf.pdf}{\includepdf{./assinaturas.pdf.pdf}}
    {%
      \@MakeSignaturesPage
    }}
  }{%
    \@MakeSignaturesPage
  }
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\CreateEnvironment}[4]
{
  \newenvironment{#1}
  {
    \chapter*{#2}
    \begin{adjustwidth}{#3}{#4}
    \vspace{-\baselineskip}
    \hspace{\parindent}
  }
  {
    \end{adjustwidth}
    \@ClearPreamblePage
  }
}
\iftoggle{@SHORT}
{
  \excludecomment{acknowledgement}
}
{
  \CreateEnvironment{acknowledgement}{Agradecimentos}{2cm}{1cm}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\iftoggle{@TWOSIDE}
{
  \let\OriginalListOfFigures\listoffigures
  \renewcommand*{\listoffigures}
  {
    \@ClearPreamblePage
    \OriginalListOfFigures
  }
  \let\OriginalListOfTables\listoftables
  \renewcommand*{\listoftables}
  {
    \@ClearPreamblePage
    \OriginalListOfTables
  }
}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{Resumo}
{
  %% \@ClearPreamblePage
  \chapter*{Resumo}
  \vspace{-4\baselineskip}
  \begin{spacing}{1}
  \noindent
  \@TheAuthorSurname,
  \TheUniversity,
  \@TheMonthpt\ de\ \@TheYear.
  \textbf{\@TheTitle}.
  \@AdvisorResumo
  \@CoadvisorResumo
  \end{spacing}
  \vspace{2\baselineskip}
  \begin{spacing}{1.5}
  \noindent\trivlist\item\ignorespaces
}
{
  \endtrivlist
  \end{spacing}
}
\newenvironment{Abstract}
{
  %% \@ClearPreamblePage
  \chapter*{Abstract}
  \vspace{-4\baselineskip}
  \begin{spacing}{1}
  \noindent
  \@TheAuthorSurname,
  \TheUniversity,
  \@TheMonthEN, \@TheYear.
  \textbf{\@TheTitleEn}.
  \@AdvisorAbstract
  \@CoadvisorAbstract
  \end{spacing}
  \vspace{2\baselineskip}
  \begin{spacing}{1.5}
  \begin{otherlanguage}{english}
  \noindent\trivlist\item\ignorespaces
}
{
  \endtrivlist
  \end{otherlanguage}
  \end{spacing}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument
{%
  \pagestyle{empty}
  \iftoggle{@EBOOK}
  {%
    \MakeTitlePage 
    \@ClearPreamblePage
  }
  {
    \clearpage
  }
  \iftoggle{@SHORT}{}
  {%
    \MakeDeclarationPage%
    \MakeIndexCardPage
    \@ClearPreamblePage
    \MakeSignaturesPage
    \@ClearPreamblePage
  }

  \pagestyle{fancyplain}
  \pagenumbering{roman}
  \setcounter{page}{2}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\OriginalTableOfContents\tableofcontents
\renewcommand*{\tableofcontents}
{
  \@ClearPreamblePage
  \OriginalTableOfContents
  \@openrighttrue
  \@ClearPreamblePage
  \pagenumbering{arabic}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{listings}
\usepackage{color}
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{gray}{0.3}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\definecolor{myred}{rgb}{0.6,0,0}
\definecolor{myblue}{rgb}{0,0,0.6}
\lstset{ %
    language=[LaTeX]TeX,             % the language of the code
    backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}; should come as last argument
    basicstyle=\small\color{myblue}, % the size of the fonts that are used for the code
    breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
    breaklines=true,                 % sets automatic line breaking
    captionpos=t,                    % sets the caption-position to bottom
    abovecaptionskip=-\baselineskip,
    belowcaptionskip=0pt,
    xleftmargin=\parindent,
    xrightmargin=\parindent,
    commentstyle=\color{mygray},     % comment style
    deletekeywords={...},            % if you want to delete keywords from the given language
    escapeinside={(*}{*)},           % if you want to add LaTeX within your code
    extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
    frame=none,	                     % adds a frame around the code
    keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
    keywordstyle=\bfseries\color{myred}, % keyword style
    morekeywords={\\documentclass,\\begin,\\end,\\usepackage,
          \\title,\\titleEn,
          \\date,\\author,\\autor,\\autora,
          \\coorientador,\\coorientadora,\\orientador,\\orientadora,\\board,
          \\alpha,\\beta,\\gamma,\\lambda,
          \\textit,\\emph,\\footnote,\\item,\\textsuperscript
          \\text,\\leq,\\sum,\\infty,\\frac,
          \\includegraphics,\\label,\\caption,\\centering,
          \\listoffigures,\\listoftables,\\tableofcontents,
          \\ref,\\LaTeX,\\left,\\right,\\hspace,\\fbox,
          \\chapter,\\section,\\subsection,\\subsubsection,
          \\cite,\\nocite,\\bibliographystyle,\\bibliography,\\addbibresource,\\bibitem,
          @PhdThesis,@MastersThesis,@Book,@Article,@misc,@Online,
          Title,Author,and,Date,Url,Urldate,Edition,ISBN,Pages,Publisher,Series}
    alsoletter={\\},
    numbers=none,                    % where to put the line-numbers; possible values are (none, left, right)
    numbersep=5pt,                   % how far the line-numbers are from the code
    numberstyle=\tiny\color{mygray}, % the style that is used for the line-numbers
    rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
    showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
    showstringspaces=false,          % underline spaces within strings only
    showtabs=false,                  % show tabs within strings adding particular underscores
    stepnumber=2,                    % the step between two line-numbers. If it's 1, each line will be numbered
    stringstyle=\color{mymauve},     % string literal style
    tabsize=2,	                     % sets default tabsize to 2 spaces
    title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput
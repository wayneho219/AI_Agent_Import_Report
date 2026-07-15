%-------------------------------------------------------------
% This class file is for thesis/dissertation of
% National Central University, TW, adapted from 
%
% (1) ociamthesis v2.2 (22/11/2010) By Keith A. Gillow 
% <gillow@maths.ox.ac.uk>. Version 1.0 released 26/11/1997
% (2) also from "Minutes in less than Hours: 
% Using \LaTeX Resources" by Jim Hefferon,
% <ftpmaint@tug.ctan.org>
%
% By Jesse LO, Mechanical Engineering, NCU
%   
% For usages limited to personal and within an organization.
% If you modified this file, you should keep this section 
% and MOST importantly DO NOT use the same file name 
% as the file name is for this file EXCLUSIVELY.
%--------------------------------------------------------------
\def\fileversion{0.01}
\def\filedate{2015/09/15}%{2011/01/10}
\typeout{}
\typeout{Document Class: MyCourseBeamer.cls 
        \filedate \space v\fileversion \space (Vickrey Wei)}
\typeout{Vickrey, TW.}
\typeout{}

%-------------------------- identification -------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MyCourseBeamer}[2015/09/15 My custom Course class]
%-------------------------- initial code -----------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
%-------------------------- executation ---------------------
\ProcessOptions\relax
\LoadClass[xcolor=svgnames,11pt]{beamer}  % 單或雙面印刷 
%\if@twoside\else\raggedbottom\fi 



%\documentclass[xcolor=svgnames,12pt,
%%handout
%]{beamer}

%----
%\definecolor{color01}{rgb}{0.55,0.7,0.44}		% 主架構顏色
%\definecolor{color02}{rgb}{0.93,1,0.88}
%\definecolor{color04}{rgb}{0.44,0.5,0.38}		% 文字顏色

%
%\usecolortheme[named=color01]{structure}
%\usetheme{Copenhagen}
\usetheme{Madrid}
%\useoutertheme[subsection=false]{miniframes}
\useoutertheme{default}

\RequirePackage{amsmath, amssymb} % AMS 套件
\RequirePackage{epsfig} %for figures
\RequirePackage{booktabs} % 表格用
%\RequirePackage[disable]{todonotes}         % Use [disable] to del. all
\RequirePackage[backend=biber, doi=true, isbn=true, url=true, eprint=false, giveninits=true, defernumbers=true, style=numeric, maxnames=99]{biblatex}
\RequirePackage{etoolbox}


\renewcommand*{\bibfont}{\scriptsize}
\setbeamertemplate{bibliography item}{\insertbiblabel}

\graphicspath{{images/}} % 設定圖形路徑
%\usepackage{hyperref}
 %\hypersetup{colorlinks=true,citecolor=blue, allcolors=blue}


%%%% 字型設定 -- 這裡改成自己的字型
%==================================================
\RequirePackage{xeCJK}
%\setCJKmainfont[BoldFont={cwTeX Q Hei Bold}]{cwTeX Q Yuan Medium} % 設預設中文字型
%\setCJKmainfont{微軟正黑體} % 設預設中文字型
\setCJKmainfont{黑體-繁} % 設預設中文字型
%\setmainfont[Mapping=tex-text,LetterSpace=-1.25]{DejaVu Sans}
%\setsansfont[Mapping=tex-text,LetterSpace=-1.25]{DejaVu Sans}
%\setmonofont[Color=00663300]{DejaVu Sans Mono}

%\setCJKfamilyfont{kai}{cwTeX Q Kai Medium}			    % 楷書	      			
%\setCJKfamilyfont{hei}{cwTeX Q Hei Bold}				% 黑體
%\setCJKfamilyfont{ming}{cwTeX Q Ming Medium}			% 明體
%\setCJKfamilyfont{yuan}{cwTeX Q Yuan Medium}			% 圓體
%\setCJKfamilyfont{fsong}{cwTeX Q Fangsong Medium}		% 仿宋體
%
%\newcommand{\kai}[1]{{\CJKfamily{kai}#1}}   	% 用 \kai{使用楷書}
%\newcommand{\hei}[1]{{\CJKfamily{hei}#1}}   	% 用 \hei{使用黑體}
%\newcommand{\ming}[1]{{\CJKfamily{ming}#1}}		% 用 \ming{使用明體}
%\newcommand{\yuan}[1]{{\CJKfamily{yuan}#1}}		% 用 \yuan{使用圓體}
%\newcommand{\fsong}[1]{{\CJKfamily{fsong}#1}}	% 用 \fsong{使用仿宋體}

\usefonttheme{serif}
\usefonttheme{professionalfonts}
%\setromanfont[Mapping=tex-text,BoldFont={Gill Sans}]{Century Gothic}
%\setmonofont[Scale=MatchLowercase]{AmericanTypewriter} % 指定等寛字型
%==================================================
\setmainfont{Arial}



\setbeamertemplate{frametitle continuation}{\insertcontinuationcount}
\setbeamercolor{alerted text}{fg=blue}

%%%% 排版設定
\linespread{1.2}


\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{tikz}

%\RequirePackage{listings}
\RequirePackage{color}
\defaultfontfeatures{Extension = .otf}
\RequirePackage{fontspec}

\RequirePackage{fontawesome}

%\newfontfamily{\FA}{FontAwesome Regular}
%\def\twitter{{\FA \faTwitter}
	
%\setbeamercolor{normal text}{bg=color02}
%\setbeamercolor{normal text}{fg=color04} 

\newcommand{\fullframegraphic}[2][]{%
\begin{frame}[plain]%
\begin{tikzpicture}[remember picture,overlay]%
\node[at=(current page.center)] {%
\includegraphics[height=\paperheight,width=\paperwidth,keepaspectratio]{#2}%
};%
% optional argument: credits on lower-right corner
\ifx\relax#1\relax\else%
\node[at=(current page.south east), anchor=south east,font=\tiny,text=white,fill=black,fill opacity=.5,text opacity=1,inner sep=2pt,text height=1ex,text depth=.25ex] {#1};%
\fi%
\end{tikzpicture}%
\end{frame}}

\newcommand{\TitleFrame}[1]{\begin{frame}\begin{center}\Huge #1\end{center}\end{frame}} 

% Section 開始
%\AtBeginSection[] 
%{ 
%\begin{frame}
%\begin{center}
%\Huge\insertsection
%\end{center}
%\end{frame}
%}
\AtBeginSection[] 
{ 
\TitleFrame{\insertsection}
}

\AtBeginSubsection[] 
{ 
	\TitleFrame{\insertsubsection}
}


\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

%\lstset{ %
%  language=R,                     % the language of the code
%  basicstyle=\footnotesize,       % the size of the fonts that are used for the code
%  numbers=left,                   % where to put the line-numbers
%  numberstyle=\tiny\color{gray},  % the style that is used for the line-numbers
%  stepnumber=1,                   % the step between two line-numbers. If it's 1, each line
%                                  % will be numbered
%  numbersep=5pt,                  % how far the line-numbers are from the code
%  backgroundcolor=\color{white},  % choose the background color. You must add \usepackage{color}
%  showspaces=false,               % show spaces adding particular underscores
%  showstringspaces=false,         % underline spaces within strings
%  showtabs=false,                 % show tabs within strings adding particular underscores
%  frame=single,                   % adds a frame around the code
%  rulecolor=\color{black},        % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. commens (green here))
%  tabsize=2,                      % sets default tabsize to 2 spaces
%  captionpos=b,                   % sets the caption-position to bottom
%  breaklines=true,                % sets automatic line breaking
%  breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
%  title=\lstname,                 % show the filename of files included with \lstinputlisting;
%                                  % also try caption instead of title
%  keywordstyle=\color{blue},      % keyword style
%  commentstyle=\color{dkgreen},   % comment style
%  stringstyle=\color{mauve},      % string literal style
%  escapeinside={\%*}{*)},         % if you want to add a comment within your code
%  morekeywords={*,...}            % if you want to add more keywords to the set
%} 


%\newcounter{cont}
%\makeatletter
%\setbeamertemplate{frametitle continuation}{%
%    \setcounter{cont}{\beamer@endpageofframe}%
%    \addtocounter{cont}{1}%
%    \addtocounter{cont}{-\beamer@startpageofframe}%
%    (\insertcontinuationcount/\arabic{cont})%
%}
%\makeatother
\newcounter{cont}
\makeatletter
\setbeamertemplate{frametitle continuation}{%
    \setcounter{cont}{\beamer@endpageofframe}%
    \addtocounter{cont}{1}%
    \addtocounter{cont}{-\beamer@startpageofframe}%
    \ifnumgreater{\value{cont}}{1}{(\insertcontinuationcount/\arabic{cont})}{}
}
\makeatother

\let\oldfootnote\footnote
\renewcommand\footnote[1][]{\oldfootnote[frame,#1]}

\let\oldfootnotesize\footnotesize
\renewcommand*{\footnotesize}{\oldfootnotesize\tiny}

%\setbeamerfont{itemize/enumerate subbody}{size=\normalsize} %to set the body size

\setbeamertemplate{itemize/enumerate body begin}{\large }
\setbeamertemplate{itemize/enumerate subbody begin}{\normalsize}
\setbeamertemplate{itemize/enumerate subsubbody begin}{\small }

\setbeamertemplate{itemize item}{\large\raise1.25pt\hbox{\donotcoloroutermaths$\bullet$}}  %to set the symbol size


\setbeamertemplate{itemize subitem}{\normalsize\raise1.25pt\hbox{\donotcoloroutermaths$\blacktriangleright$}}  %to set the symbol size

\setbeamertemplate{itemize subsubitem}{\normalsize\raise1.25pt\hbox{\donotcoloroutermaths$\vartriangleright$}}  %to set the symbol size

% ChangeItemFont
% \ChangeItemFont{<font commands 1st level>}{<font commands 2nd level>}{<font commands 3rd level>}
\setbeamertemplate{frametitle}{\linespread{1}\insertframetitle\\\insertframesubtitle}
%\setbeamerfont{frametitle}{size={\LARGE }}
\setbeamerfont{framesubtitle}{size=\small}

\endinput            % totaling OOO lines


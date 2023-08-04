%%
%% This is file `simplesnt.cls'.
%%
%% ---------------------------------------------------------------------------
%% The simplesnt class --- A simple package to create show and tell slides
%% Maintained by Jay Lee
%% E-mail: jaeho.lee@snu.ac.kr
%% Released under the MIT License.
%% ---------------------------------------------------------------------------
%%
\RequirePackage{expl3}
\ProvidesExplClass
  {simplesnt}
  {2023/07/04}
  {1.0}
  {A simple package to create show and tell slides}

\RequirePackage{l3keys2e}
\keys_define:nn { simplesnt } {
  no-fonts .bool_set:N = \l_simplesnt_no_fonts_bool,
}
\ProcessKeysOptions { simplesnt }

\LoadClass{beamer}

\RequirePackage{kotex}

%%% Math settings
\usepackage{amssymb, amsmath} % Before unicode-math
\usepackage[math-style=TeX, bold-style=TeX]{unicode-math}


%%% Beamer settings
\usetheme[numbering=fraction, progressbar=frametitle]{metropolis}
\useoutertheme[subsection=false]{miniframes}
\usecolortheme{rose}

\setbeamertemplate{itemize item}[square]
\setbeamertemplate{itemize subitem}[triangle]
\setbeamertemplate{itemize subsubitem}[circle]

\setbeamercolor{background~canvas}{bg=white}

\titlegraphic{%
  \begin{tikzpicture}[overlay,remember~picture]
    \node at (current~page.145) [xshift=3em, yshift=-1.3em] {
      \includegraphics[width=3em]{img/snu-symbol.png}
    };
    \node at (current~page.35) [xshift=-3em, yshift=-1.3em] {
      \includegraphics[width=2.5em]{img/ropas-symbol.png}
    };
  \end{tikzpicture}%
}


%%% Font settings
\bool_if:NF \l_simplesnt_no_fonts_bool
  {
    \setmainfont{LibertinusSerif}[
      UprightFont = *-Regular,
      BoldFont = *-Bold,
      ItalicFont = *-Italic,
      BoldItalicFont = *-BoldItalic,
    ]
    \setsansfont{LibertinusSans}[
      UprightFont = *-Regular,
      BoldFont = *-Bold,
      ItalicFont = *-Italic,
    ]
    \setmonofont{JuliaMono}[
      Scale = MatchLowercase,
      UprightFont = *-Regular,
      BoldFont = *-Bold,
      ItalicFont = *-RegularItalic,
      BoldItalicFont = *-BoldItalic,
    ]

    \setmathfont{Libertinus~Math} % Before set*hangulfont
    \setmathfont{TeX~Gyre~Pagella~Math}[range={\lbrace,\rbrace},Scale=1.1]
    \setmathfont{TeX~Gyre~Pagella~Math}[range={\mathbb,\mathfrak},Scale=MatchUppercase]
    \setmathfont{Asana~Math}[range={\checkmark,\bigtriangledown,\cup,\sqcup,\cap,\sqcap,\subseteq,\supseteq,\sqsubseteq,\sqsupseteq,\subset,\supset,\sqsubset,\sqsupset,\in,\ni,\notin},Scale=MatchUppercase]

    \setmainhangulfont{Noto~Serif~CJK~KR}[
      FakeSlant = 0.2,
      UprightFont = *-Regular,
      BoldFont = *-Bold,
    ]
    \setsanshangulfont[BoldFont={*~Bold}]{KoPubWorldDotum_Pro}
    \setmonohangulfont{D2Coding}

    % Get double angle brackets (\llangle and \rrangle)
    \makeatletter
    \DeclareFontFamily{OMX}{MnSymbolE}{}
    \DeclareSymbolFont{MnLargeSymbols}{OMX}{MnSymbolE}{m}{n}
    \SetSymbolFont{MnLargeSymbols}{bold}{OMX}{MnSymbolE}{b}{n}
    \DeclareFontShape{OMX}{MnSymbolE}{m}{n}{
        <-6>  MnSymbolE5
    <6-7>  MnSymbolE6
    <7-8>  MnSymbolE7
    <8-9>  MnSymbolE8
    <9-10> MnSymbolE9
    <10-12> MnSymbolE10
    <12->   MnSymbolE12
    }{}
    \DeclareFontShape{OMX}{MnSymbolE}{b}{n}{
        <-6>  MnSymbolE-Bold5
    <6-7>  MnSymbolE-Bold6
    <7-8>  MnSymbolE-Bold7
    <8-9>  MnSymbolE-Bold8
    <9-10> MnSymbolE-Bold9
    <10-12> MnSymbolE-Bold10
    <12->   MnSymbolE-Bold12
    }{}

    \let\llangle\@undefined
    \let\rrangle\@undefined
    \DeclareMathDelimiter{\llangle}{\mathopen}%
                        {MnLargeSymbols}{'164}{MnLargeSymbols}{'164}
    \DeclareMathDelimiter{\rrangle}{\mathclose}%
                        {MnLargeSymbols}{'171}{MnLargeSymbols}{'171}
    \makeatother

    \RequirePackage{newunicodechar}
    \newfontfamily{\fallbackfonta}{EB~Garamond}
    \newfontfamily{\fallbackfontb}{JuliaMono}
    \DeclareTextFontCommand{\textfallbacka}{\fallbackfonta}
    \DeclareTextFontCommand{\textfallbackb}{\fallbackfontb}
    \newunicodechar{⩴}{\textfallbacka{⩴}}
  }


%% Default info
\institute{ROPAS@SNU}

% \AtBeginDocument{
% }


%% The MIT License (MIT)
%%
%% Copyright © 2023 Jay Lee <jaeho.lee@snu.ac.kr>
%%
%% Permission is hereby granted, free of charge, to any person obtaining
%% a copy of this software and associated documentation files (the "Software"),
%% to deal in the Software without restriction, including without limitation
%% the rights to use, copy, modify, merge, publish, distribute, sublicense,
%% and/or sell copies of the Software, and to permit persons to whom the
%% Software is furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included
%% in all copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
%% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
%% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
%% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
%% DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
%% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
%% OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%%
%% End of file `simplesnt.cls'.

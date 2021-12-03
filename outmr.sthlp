{smcl}
{* *! version 1.0  3 Dec 2021}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "Install command2" "ssc install command2"}{...}
{vieweralsosee "Help command2 (if installed)" "help command2"}{...}
{viewerjumpto "Syntax" "outmr##syntax"}{...}
{viewerjumpto "Description" "outmr##description"}{...}
{viewerjumpto "Options" "outmr##options"}{...}
{viewerjumpto "Remarks" "outmr##remarks"}{...}
{viewerjumpto "Examples" "outmr##examples"}{...}
{title:Title}
{phang}
{bf:outmr} {hline 2} A command to export mrobust results into LaTex or Word

{marker syntax}{...}
{title:Syntax}
{p 8 17 2}
{cmdab:outmr}
[anything]
[using]
[{cmd:,}
{it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}

{syntab:Optional}
{synopt:{opt t:itle(string)}} Title to be included in LaTex.

{synopt:{opt l:abel(string)}} Label to be included in LaTex.

{synopt:{opt n:otes(string asis)}} Notes for the table.  For new line, use "\\".

{synopt:{opt coef:labels(string asis)}} Coefficient labels.  This option is currently not supported.

{synopt:{opt rep:lace}} specifies that the old help file is replaced.

{synopt:{opt d:ec(#)}} # for decimal places.  The default is 4.

{synoptline}
{p2colreset}{...}
{p 4 6 2}

{marker description}{...}
{title:Description}
{pstd}

{pstd}
 {cmd:outmr} Exports results from mrobust into LaTex and Word.  Currently only LaTex is supported with minimal customization.

{marker options}{...}
{title:Options}
{dlgtab:Main}

{phang}
{opt t:itle(string)}  Title to be included in LaTex.

{phang}
{opt l:abel(string)}  Label to be included in LaTex.

{phang}
{opt n:otes(string asis)}  Notes for the table.  For new line, use "\\".

{phang}
{opt coef:labels(string asis)}  Coefficient labels.  This option is currently not supported.

{phang}
{opt rep:lace} replace specifies that the old help file is replaced.

{phang}
{opt d:ec(#)}  # for decimal places.  The default is 4.



{marker examples}{...}
{title:Examples}

 {stata sysuse nlsw88, clear}
 
 {stata mrobust regress union hours age grade collgrad married south smsa c_city ttl_exp tenure , noplot}
 
 {stata outmr using results.tex, title(Add this title to the table) notes(This is a note) replace}


{title:Author}
{p}

Aristeidis Dadoukis, The University of Nottingham.

Email {browse "mailto:aristeidis.dadoukis@gmail.com":aristeidis.dadoukis@gmail.com}



{title:See Also}
Related commands:

{help mrobust} (if installed) {stata ssc install mrobust, replace} (to install this command)
{help texdoc}  (if installed) {stata ssc install texdoc, replace}  (to install this command)




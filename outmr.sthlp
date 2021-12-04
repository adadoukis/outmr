{smcl}
{* *! version 1.0  4 Dec 2021}{...}
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

{synopt:{opt coef:labels(string asis)}} Coefficient labels.  This option is currently not supported.  The current version will report the labels of the variables.  You can include LaTex math notations using \( \).

{synopt:{opt rep:lace}} specifies that the old help file is replaced.

{synopt:{opt d:ec(#)}} Set format for statistics.  The default is 4dp.

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
{opt coef:labels(string asis)}  Coefficient labels.  This option is currently not supported.  The current version will report the labels of the variables.  You can include LaTex math notations using \( \).

{phang}
{opt rep:lace} replace specifies that the old help file is replaced.

{phang}
{opt d:ec(#)}  Set format for statistics.  The default is 4dp.



{marker examples}{...}
{title:Examples}

{pstd}Setup: Example 1

{phang2}{stata sysuse nlsw88, clear}

{pstd}Execute mrobust 

{phang2}{stata mrobust regress union hours age grade collgrad married south smsa c_city ttl_exp tenure , noplot}

{pstd}Export results to results.tex file

{phang2}{stata outmr using results.tex, title(Add this title to the table) notes(This is a note) replace}
 
{pstd}Setup: Example 

{phang2}{stata sysuse nlsw88, clear}

{pstd}Change the label of age to age_it 

{stata label var age "\(age_{it}\)"}

{pstd}Execute mrobust 

{phang2}{stata mrobust regress union hours age grade collgrad married south smsa c_city ttl_exp tenure , noplot}

{pstd}Export results to results.tex file using 3 decimal points

{phang2}{stata outmr using results.tex, title(Add this title to the table) notes(This is a note) dec(3) replace}
 


{title:Author}
{p}

Aristeidis Dadoukis, The University of Nottingham.

Email {browse "mailto:aristeidis.dadoukis@gmail.com":aristeidis.dadoukis@gmail.com}



{title:See Also}
Related commands:

{help mrobust} (if installed) {stata ssc install mrobust, replace} (to install this command)
{help texdoc}  (if installed) {stata ssc install texdoc, replace}  (to install this command)




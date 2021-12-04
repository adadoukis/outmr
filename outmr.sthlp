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
{synopt:{opt t:itle(string)}} Specifies the caption of the table.

{synopt:{opt l:abel(string)}} Specifies the label of the table

{synopt:{opt n:otes(string asis)}} Specifies the notes of the table

{synopt:{opt coef:labels(string asis)}} Specifies the format of the coefficient labels.  The current version of outmr is using the labels of each variable.  To include math notation in LaTex use \(\).

{synopt:{opt d:ec(#)}} Specifies the format of the coefficients.  The default is 4dp.

{synopt:{opt rep:lace}} replace 

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
{opt t:itle(string)}  Specifies the caption of the table.

{phang}
{opt l:abel(string)}  Specifies the label of the table

{phang}
{opt n:otes(string asis)}  Specifies the notes of the table

{phang}
{opt coef:labels(string asis)}  Specifies the format of the coefficient labels.  The current version of outmr is using the labels of each variable.  To include math notation in LaTex use \(\).

{phang}
{opt d:ec(#)}  Specifies the format of the coefficients.  The default is 4dp.

{phang}
{opt rep:lace} replace 



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

{phang2}{stata label var age "\(age_{it}\)"}

{pstd}Execute mrobust 

{phang2}{stata mrobust regress union hours age grade collgrad married south smsa c_city ttl_exp tenure , noplot}

{pstd}Export results to results.tex file using 3 decimal points

{phang2}{stata outmr using results.tex, title(Add this title to the table) notes(This is a note) dec(3) replace}
 


{title:Author}
{p}

Aristeidis Dadoukis, The University of Nottingham, Department of Finance Risk and Banking.

Email {browse "mailto:aristeidis.dadoukis@gmail.com":aristeidis.dadoukis@gmail.com}



{title:See Also}
Related commands:

{help mrobust} (if installed) {stata ssc install mrobust, replace} (to install this command)
{help texdoc}  (if installed) {stata ssc install texdoc, replace}  (to install this command)




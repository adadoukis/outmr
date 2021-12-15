{smcl}
{* *! version 1.0  7 Dec 2021}{...}
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

{synopt:{opt l:abel(string)}} Specifies the label of the table.

{synopt:{opt n:otes(string asis)}} Specifies the notes of the table.

{synopt:{opt coef:labels(string asis)}} Specifies the format of the coefficient labels.  The current version of outmr is using the labels of each variable.  To include math notation in LaTex use \( \).

{synopt:{opt d:ec(#)}} Specifies the format of the coefficients.  The default is 4dp.

{synopt:{opt rep:lace}} replace the extisting file.

{synoptline}
{p2colreset}{...}
{p 4 6 2}

{marker description}{...}
{title:Description}
{pstd}

{pstd}
 {cmd:outmr} Exports results from mrobust into LaTex and Word.  Currently only LaTex is supported with minimal customization.  The current version of {it:outmr} relies heaviliy on texdoc and putdoxc. {p_end}

{marker options}{...}
{title:Options}
{dlgtab:Main}

{phang}
{opt t:itle(string)}  Specifies the caption of the table.

{phang}
{opt l:abel(string)}  Specifies the label of the table.

{phang}
{opt n:otes(string asis)}  Specifies the notes of the table.

{phang}
{opt coef:labels(string asis)}  Specifies the format of the coefficient labels.  The current version of {it:outmr} is using the labels of each variable.  To include math notation in LaTex use \( \).

{phang}
{opt d:ec(#)}  Specifies the format of the coefficients.  The default is 4dp.

{phang}
{opt rep:lace} replace the extisting file.



{marker examples}{...}
{title:Examples}

{pstd}Example 1: Estimate model uncertaining using {it:mrobust}, and export the results to results.tex. {p_end}

{phang2}{cmd: sysuse nlsw88, clear}

{phang2}{cmd: mrobust regress union hours age grade collgrad married south smsa c_city ttl_exp tenure , noplot}

{phang2}{cmd: outmr using results.tex, title(Add this title to the table) notes(This is a note) replace}

 
{pstd}Example 2: Label the variable age to age_it, before the estimation of {it:mrobust}, and export the results to results.tex file using 3 decimal points. {p_end}

{phang2}{cmd: sysuse nlsw88, clear}

{phang2}{cmd: label var age "\(age_{c -(}it{c )-}\)"}

{phang2}{cmd: mrobust regress union hours age grade collgrad married south smsa c_city ttl_exp tenure , noplot}

{phang2}{cmd: outmr using results.tex, title(Add this title to the table) notes(This is a note) dec(3) replace}

{pstd}Example 3: Estimate model uncertainty using {it:mrobust}, and export the results to results.docx. {p_end}

{phang2}{cmd: sysuse nlsw88, clear}

{phang2}{cmd: mrobust regress union hours age grade , noplot}

{phang2}{cmd: outmr using results.docx, title(This is a table created in word) notes(This is a note) replace}

{title:Author}
{p}

Aristeidis Dadoukis, The University of Nottingham, Nottingham University Business School Department of Finance, Risk and Banking.

Email {browse "mailto:aristeidis.dadoukis@gmail.com":aristeidis.dadoukis@gmail.com}



{title:See Also}
Related commands:

{help mrobust} (if installed) {stata ssc install mrobust, replace} (to install this command)
{help texdoc}  (if installed) {stata ssc install texdoc, replace}  (to install this command)
{help putdox} {if installed}

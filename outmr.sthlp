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
{synopt:{opt t:itle(string)}}  

{synopt:{opt l:abel(string)}}  

{synopt:{opt n:otes(string asis)}}  

{synopt:{opt coef:labels(string asis)}}  

{synopt:{opt rep:lace}} replace 

{synopt:{opt d:ec(#)}}  Default value is 4.

{synoptline}
{p2colreset}{...}
{p 4 6 2}

{marker description}{...}
{title:Description}
{pstd}

{pstd}
 {cmd:sampsi_gehan} calculates the sample sizes for the first and second stages of the Gehan design
    (1961).

{marker options}{...}
{title:Options}
{dlgtab:Main}

{phang}
{opt t:itle(string)}  

{phang}
{opt l:abel(string)}  

{phang}
{opt n:otes(string asis)}  

{phang}
{opt coef:labels(string asis)}  

{phang}
{opt rep:lace} replace 

{phang}
{opt d:ec(#)}  



{marker examples}{...}
{title:Examples}

 {stata sysuse nlsw88, clear}
 {stata mrobust regress union hours age grade collgrad married south smsa c_city ttl_exp tenure}


{title:References}
{pstd}

{pstd}

{pstd}

{pstd}

{pstd}


{title:Author}
{p}

Aristeidis Dadoukis, The University of Nottingham.

Email {browse "mailto:aristeidis.dadoukis@gmail.com":aristeidis.dadoukis@gmail.com}



{title:See Also}
Related commands:

{help mrobust} (if installed)  {stata ssc install mrobust, replace} (to install this command)




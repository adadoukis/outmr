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
{bf:outmr} {hline 2} a command to give the parameters of the single stage Gehan design

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

{synopt:{opt d:ec(#)}}  Default value is 4.

{synopt:{opt rep:lace}} replace 

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
{opt d:ec(#)}  

{phang}
{opt rep:lace} replace 



{marker examples}{...}
{title:Examples}

 {stata sampsi_gehan, p1(0.2) beta(0.05) se(0.1) precp(0.4)}


{title:References}
{pstd}

{pstd}
Gehan, E.A. (1961) The Determination of the Number of Patients Required in a Preliminary and 
Follow-Up Trial of a New Chemotherapeutic Agent. Journal of Chronic Diseases, 13, 346-353.

{pstd}

{pstd}


{title:Author}
{p}

Prof Adrian Mander, Cardiff University.

Email {browse "mailto:mandera@cardiff.ac.uk":mandera@cardiff.ac.uk}



{title:See Also}
Related commands:

{help sampsi_fleming} (if installed)  {stata ssc install sampsi_fleming} (to install this command)

{help simon2stage} (if installed)   {stata ssc install simon2stage} (to install this command)



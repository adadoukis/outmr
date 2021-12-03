
// https://www.learnlatex.org/en/lesson-08
// mrobust_export v1 - 02-12-2021
// A. Dadoukis

capture program drop outmr
program define outmr  
version 14 


syntax [anything] [using] [, Title(string) Label(string) Notes(string asis) COEFlabels(string asis) REPlace Dec(int 4) ]
// 
	if missing(`dec')  {
		local dp = 4
	}
		else { 
			local dp = `dec'
		}

local all_vars = r(varlist)								// save all variables included in mrobust into a local
local tex_title = "`title'"
local tex_label = "`label'"
local tex_notes = "`notes'"

local obs = r(N)									   	// Observations
local meanR2 : display %10.0`dp'f r(meanr2)			   	// Mean R-squared
local mc : display %10.0`dp'f r(mc) 				   	// Average multicollinearity
local no_models = r(nmodels)						   	// number of estimated models
local outcome  = r(depvar) 							   	// name of the outcome variable(s)
local interest = r(intvar)							   	// name of the interest variable(s)
local model = r(title)								   	// type(s) of regression model
local n_terms = r(nterms) 							   	// number of grouped control terms (independent variables)

// Collect Significance Testing:
matrix r = r(sigrates)
local sign_stability: display %10.0f r[2,1]			   	// Sing stability
local sig_rate : display %10.0f r[3,1]				   	// Significance rate
local positive : display %10.0f r[4,1]				   	// Positive
local pos_and_sig : display %10.0f r[5,1]			   	// Positive and Sig
local negative : display %10.0f r[6,1]				   	// Negative
local neg_and_sig : display %10.0f r[7,1] 			   	// Negative and Sig                
local inf_cons : display %10.0`dp'f r(infcons_b)	   	// Inference constant
loca inf_R2: display %10.0`dp'f r(infr2_b)			   	// Inference R-squared

// Collect Model Robustness Statistics:
local mean_b : display %10.0`dp'f r(meanb) 				// Mean(b)              
local samplingSE : display %10.0`dp'f r(samplingSE) 	// Sampling SE          
local modelingSE : display %10.0`dp'f r(modelingSE)  	// Modeling SE          
local totalSE : display %10.0`dp'f r(totalSE) 			// Total SE                
local rob_ratio : display %10.0`dp'f r(rratio)			// Robustness Ratio


// Save variable labels - to be used in the output
foreach x of local all_var {
  local label_x : variable label `x'
  }

// Collect Model Influence:

local matrix_rownames : rownames r(infstats_default)

local counter = 1
foreach v of local matrix_rownames {
   local name_`counter' = `"`v'"'
   local n_`counter' = substr("`name_`counter''",3,.)
   local l_`counter' : variable label `n_`counter''
   local counter = (`counter'+1)
}


forvalues i = 1/`n_terms' {
	local pct_chg_`i' : display %10.1f r(infstats_default)[`i',3]
	local b_`i' : display %10.0`dp'f r(infstats_default)[`i',2]
}



gettoken path using0: using
    if `"`using'"'!="" {
        _getfilename `"`using0'"'
        //local fn = r(filename)
		local fn `"`r(filename)'"'
		local suffix = substr(`"`fn'"',-4,.)
		
    }

		if `"`suffix'"' == ".tex"			local mode tex
		else if `"`suffix'"' == ".rtf"		local mode rtf
		
		else if `"`suffix'"'!=".tex" | `"`suffix'"'!=".rtf" { 
			di as error "The current version supports word (.rtf) or LaTex (.tex)"
			exit 198 
		}		

		if "`mode'"== "rtf" {
			di as error "Word is not supported yet"
		}
			else if "`mode'" == "tex" {
				
texdoc init "`fn'", replace force
tex \begin{table}[htbp]\centering
tex \begin{threeparttable}
tex \caption{`tex_title'}
tex \label{`tex_label'}


tex \begin{tabular}{p{2.2in}p{0.8in}p{1.6in}p{0.8in}p{0.8in}}
tex \toprule
tex \multicolumn{5}{l}{\textit{\textbf{Panel A: Linear regression}}} \\ \hline 
 
tex \addlinespace
tex Variable of interest        	& `interest'           & \multicolumn{2}{l}{} 										\\
tex Outcome variable             	& `outcome'            & \multicolumn{1}{l}{Observations}  & \multicolumn{2}{r}{`obs'}		\\
tex Possible control terms       	& `n_terms'            & Mean \(R^2\)		           & \multicolumn{2}{r}{`meanR2'} \\
tex Number of models             	& `no_models'          & Multicollinearity         & \multicolumn{2}{r}{`mc'}	\\ \hline
tex \addlinespace
tex \textit{\textbf{Panel B: Robustness Statistics}} & & \textit{\textbf{Significance Testing}} & \\ \hline

tex \addlinespace
tex Mean (b)                     	& `mean_b'             & Sign stability            & \multicolumn{2}{r}{`sign_stability'\%}		\\
tex Sampling SE                		& `samplingSE'         & Significance rate         & \multicolumn{2}{r}{`sig_rate'\%} \\
tex Modelling SE                 	& `modelingSE'         & Positive                  & \multicolumn{2}{r}{`positive'\%}	\\
tex Total SE                     	& `totalSE'            & Positive and significant  & \multicolumn{2}{r}{`pos_and_sig'\%} \\
tex Robustness ratio            	& `rob_ratio'          & Negative                  & \multicolumn{2}{r}{`negative'\%}	\\
tex                              	&                      & Negative and significance & \multicolumn{2}{r}{`neg_and_sig'\%}	\\ \hline
tex \addlinespace
tex \multicolumn{5}{l}{\textit{\textbf{Panel C: Model Influence}}}	   																 \\ \hline

tex \addlinespace
tex    						& \multicolumn{2}{c}{\begin{tabular}{c}Marginal Effect \\of Variable Inclusion\end{tabular}}   & \multicolumn{2}{c}{\begin{tabular}{c}Percent Change \\from Mean (b)\end{tabular}}  \\
forvalues j = 1/`n_terms' {
tex `l_`j'' & \multicolumn{2}{c}{`b_`j''}  & \multicolumn{2}{c}{`pct_chg_`j''\%}  \\  
}
tex \addlinespace
tex Constant & \multicolumn{2}{c}{`inf_cons'}  & \multicolumn{2}{c}{}  \\  
tex \(R^2\) & \multicolumn{2}{c}{`inf_R2'}  & \multicolumn{2}{c}{}  \\  

tex \bottomrule
tex \end{tabular}

tex \begin{tablenotes}
tex \small
tex \item []`notes'
tex \end{tablenotes}

tex \end{threeparttable}
tex \end{table}
texdoc close			

}
end 



/* START HELP FILE
title[A command to export mrobust results into LaTex or Word]

desc[
 {cmd:sampsi_gehan} calculates the sample sizes for the first and second stages of the Gehan design
    (1961).
]
opt[beta() specifies the first stage maximum probability of seeing no responses.]
opt[p1() specifies the desired probability of response.]
opt[se()  specifies the desired standard error in the second stage.]
opt[start() specifies the smallest n to start the search from.]
opt[precp() specifies the probability used in the standard error formula.]


opt2[precp() specifies the probability used in the standard error formula.
and I wanted more than one line for the longer  descriptions of the
option precp() later in the help file]

example[
 {stata sysuse nlsw88, clear}
 {stata mrobust regress union hours age grade collgrad married south smsa c_city ttl_exp tenure}
]
author[Aristeidis Dadoukis]
institute[The University of Nottingham]
email[aristeidis.dadoukis@gmail.com]

return[n1 The first stage sample size]
return[p1 The interesting p1 ]
return[beta The type 2 error]
return[se Standard error]
return[n2 The second stage sample size]

freetext[]

references[

]

seealso[
{help mrobust} (if installed)  {stata ssc install mrobust, replace} (to install this command)


]

END HELP FILE */

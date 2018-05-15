OPTIONS ERRORS=1 nocenter nofullstimer;  *  mprint mlogic symbolgen;
/*
     Project       : Polypharm
     Program name  : /projects/active/27385/riskpolypharm/polypharm/programs/CCHANG/out_py4FAD.sas
     Programmed by : C. Chang
     Function      : 40p - out for table
     Last update   : 4/05/2018
     */
*-------------------------------------------------------------;
libname inlib '/projects/active/27385/riskpolypharm/idata/gouri/final_data';
libname inlib2 '/projects/active/27385/riskpolypharm/idata/gouri/cohort';
libname out '/projects/active/27385/riskpolypharm/idata/gouri/model';
*libname modelout '/projects/active/27385/riskpolypharm/idata/cchang/model';  
libname modelout '/projects/active/27385/riskpolypharm/polypharm/programs/remeny';

*options obs=100000;

title1 '20% Exclude 3+FAD days model data';
title2 'single and double exposure hip fracture';
data label;
length rx $ 22 label $49;
input rx $ 2-23 label $ 27-75;
datalines;
"si_thiazDiur           " "Thiazide Diuretics                               "
"si_PPI                 " "Proton Pump Inhibitors (PPI)                     "
"si_SSRISNRI            " "SSRI/SNRI (SSRI/SNRI)                            "
"si_loopDiur            " "Loop Diuretics                                   "
"si_Opioids             " "Opioids                                          "
"si_antiConv            " "Anticonvulsants                                  "
"si_Thiazolid           " "Thiazolidinediones (TZD)                         "
"si_Inhster             " "Inhaled Glucocorticoids                          "
"si_SedHYP              " "Sedative Hypnotics                               "
"si_Oralster            " "Oral Glucocorticoids                             "
"si_H2RA                " "H2 Receptor Antagonists (H2RA)                   "
"si_Benzo               " "Benzodiazepines                                  "
"si_Nitrates            " "Nitrates                                         "
"si_antiPark            " "Antiparkinsons Agents                            "
"si_SGAP                " "2nd Generation Antispychotics (SGAP)             "
"si_TCAD                " "Tricyclic Antidepressants (TCA)                  "
"si_caaHTN              " "Central Acting Antihypertensives (CAAH)          "
"si_fgAHist             " "1st Generation Antihistamines (H1 Blockers)      "
"si_FGAP                " "1st Generation Antipsychotics (FGAP)             "
"si_Barbit              " "Barbiturates                                     "
"si_musclrlx            " "Muscle Relaxers                                  "
"pr_Thiazolid_thiazDiur " "TZD & Thiazide Diuretics                         "
"pr_Thiazolid_TCAD      " "TZD & TCA                                        "
"pr_Thiazolid_SSRISNRI  " "TZD & SSRI/SNRI                                  "
"pr_Thiazolid_SedHYP    " "TZD & Sedative Hypnotics                         "
"pr_Thiazolid_Opioids   " "TZD & Opioids                                    "
"pr_Thiazolid_Nitrates  " "TZD & Nitrates                                   "
"pr_Thiazolid_loopDiur  " "TZD & Loop Diuretics                             "
"pr_Thiazolid_antiPark  " "TZD & Antiparkinsons Agents                      "
"pr_Thiazolid_antiConv  " "TZD & Anticonvulsants                            "
"pr_thiazDiur_SGAP      " "Thiazide Diuretics & SGAP                        "
"pr_thiazDiur_Opioids   " "Thiazide Diuretics & Opioids                     "
"pr_thiazDiur_Nitrates  " "Thiazide Diuretics & Nitrates                    "
"pr_thiazDiur_loopDiur  " "Thiazide Diuretics & Loop Diuretics              "
"pr_thiazDiur_FGAP      " "Thiazide Diuretics & FGAP                        "
"pr_TCAD_thiazDiur      " "TCA & Thiazide Diuretics                         "
"pr_TCAD_SGAP           " "TCA & SGAP                                       "
"pr_TCAD_SedHYP         " "TCA & Sedative Hypnotics                         "
"pr_TCAD_Opioids        " "TCA & Opioids                                    "
"pr_TCAD_loopDiur       " "TCA & Loop Diuretics                             "
"pr_TCAD_Benzo          " "TCA & Benzodiazepines                            "
"pr_TCAD_antiPark       " "TCA & Antiparkinsons Agents                      "
"pr_SSRISNRI_thiazDiur  " "SSRI/SNRI & Thiazide Diuretics                   "
"pr_SSRISNRI_TCAD       " "SSRI/SNRI & TCA                                  "
"pr_SSRISNRI_SGAP       " "SSRI/SNRI & SGAP                                 "
"pr_SSRISNRI_SedHYP     " "SSRI/SNRI & Sedative Hypnotics                   "
"pr_SSRISNRI_Opioids    " "SSRI/SNRI & Opioids                              "
"pr_SSRISNRI_Nitrates   " "SSRI/SNRI & Nitrates                             "
"pr_SSRISNRI_loopDiur   " "SSRI/SNRI & Loop Diuretics                       "
"pr_SSRISNRI_FGAP       " "SSRI/SNRI & FGAP                                 "
"pr_SSRISNRI_fgAHist    " "SSRI/SNRI & H1 Blockers                          "
"pr_SSRISNRI_caaHTN     " "SSRI/SNRI & CAAH                                 "
"pr_SSRISNRI_Benzo      " "SSRI/SNRI & Benzodiazepines                      "
"pr_SSRISNRI_Barbit     " "SSRI/SNRI & Barbiturates                         "
"pr_SSRISNRI_antiPark   " "SSRI/SNRI & Antiparkinsons Agents                "
"pr_SGAP_loopDiur       " "SGAP & Loop Diuretics                            "
"pr_SedHYP_thiazDiur    " "Sedative Hypnotics & Thiazide Diuretics          "
"pr_SedHYP_SGAP         " "Sedative Hypnotics & SGAP                        "
"pr_SedHYP_Opioids      " "Sedative Hypnotics & Opioids                     "
"pr_SedHYP_Nitrates     " "Sedative Hypnotics & Nitrates                    "
"pr_SedHYP_loopDiur     " "Sedative Hypnotics & Loop Diuretics              "
"pr_SedHYP_fgAHist      " "Sedative Hypnotics & H1 Blockers                 "
"pr_SedHYP_caaHTN       " "Sedative Hypnotics & CAAH                        "
"pr_SedHYP_antiPark     " "Sedative Hypnotics & Antiparkinsons Agents       "
"pr_PPI_Thiazolid       " "PPI & TZD                                        "
"pr_PPI_thiazDiur       " "PPI & Thiazide Diuretics                         "
"pr_PPI_TCAD            " "PPI & TCA                                        "
"pr_PPI_SSRISNRI        " "PPI & SSRI/SNRI                                  "
"pr_PPI_SGAP            " "PPI & SGAP                                       "
"pr_PPI_SedHYP          " "PPI & Sedative Hypnotics                         "
"pr_PPI_Opioids         " "PPI & Opioids                                    "
"pr_PPI_Nitrates        " "PPI & Nitrates                                   "
"pr_PPI_musclrlx        " "PPI & Muscle Relaxers                            "
"pr_PPI_loopDiur        " "PPI & Loop Diuretics                             "
"pr_PPI_H2RA            " "PPI & H2RA		                 	    "
"pr_PPI_FGAP            " "PPI & FGAP                                       "
"pr_PPI_fgAHist         " "PPI & H1 Blockers                                "
"pr_PPI_caaHTN          " "PPI & CAAH                                       "
"pr_PPI_Benzo           " "PPI & Benzodiazepines                            "
"pr_PPI_Barbit          " "PPI & Barbiturates                               "
"pr_PPI_antiPark        " "PPI & Antiparkinsons Agents                      "
"pr_PPI_antiConv        " "PPI & Anticonvulsants                            "
"pr_Oralster_Thiazolid  " "Oral Glucocorticoids & TZD                       "
"pr_Oralster_thiazDiur  " "Oral Glucocorticoids & Thiazide Diuretics        "
"pr_Oralster_TCAD       " "Oral Glucocorticoids & TCA                       "
"pr_Oralster_SSRISNRI   " "Oral Glucocorticoids & SSRI/SNRI                 "
"pr_Oralster_SedHYP     " "Oral Glucocorticoids & Sedative Hypnotics        "
"pr_Oralster_PPI        " "Oral Glucocorticoids & PPI                       "
"pr_Oralster_Opioids    " "Oral Glucocorticoids & Opioids                   "
"pr_Oralster_Nitrates   " "Oral Glucocorticoids & Nitrates                  "
"pr_Oralster_loopDiur   " "Oral Glucocorticoids & Loop Diuretics            "
"pr_Oralster_H2RA       " "Oral Glucocorticoids & H2RA		 	    "
"pr_Oralster_fgAHist    " "Oral Glucocorticoids & H1 Blockers               "
"pr_Oralster_Benzo      " "Oral Glucocorticoids & Benzodiazepines           "
"pr_Oralster_antiPark   " "Oral Glucocorticoids & Antiparkinsons Agents     "
"pr_Oralster_antiConv   " "Oral Glucocorticoids & Anticonvulsants           "
"pr_Opioids_SGAP        " "Opioids & SGAP                                   "
"pr_Opioids_loopDiur    " "Opioids & Loop Diuretics                         "
"pr_Nitrates_Opioids    " "Nitrates & Opioids                               "
"pr_Nitrates_loopDiur   " "Nitrates & Loop Diuretics                        "
"pr_musclrlx_thiazDiur  " "Muscle Relaxers & Thiazide Diuretics             "
"pr_musclrlx_Opioids    " "Muscle Relaxers & Opioids                        "
"pr_Inhster_Thiazolid   " "Inhaled Glucocorticoids & TZD                    "
"pr_Inhster_thiazDiur   " "Inhaled Glucocorticoids & Thiazide Diuretics     "
"pr_Inhster_SSRISNRI    " "Inhaled Glucocorticoids & SSRI/SNRI              "
"pr_Inhster_SGAP        " "Inhaled Glucocorticoids & SGAP                   "
"pr_Inhster_SedHYP      " "Inhaled Glucocorticoids & Sedative Hypnotics     "
"pr_Inhster_PPI         " "Inhaled Glucocorticoids & PPI                    "
"pr_Inhster_Oralster    " "Inhaled Glucocorticoids & Oral Glucocorticoids   "
"pr_Inhster_Opioids     " "Inhaled Glucocorticoids & Opioids                "
"pr_Inhster_Nitrates    " "Inhaled Glucocorticoids & Nitrates               "
"pr_Inhster_loopDiur    " "Inhaled Glucocorticoids & Loop Diuretics         "
"pr_Inhster_H2RA        " "Inhaled Glucocorticoids & H2RA 	  	    "
"pr_Inhster_Benzo       " "Inhaled Glucocorticoids & Benzodiazepinesi       "
"pr_Inhster_antiPark    " "Inhaled Glucocorticoids & Antiparkinsons Agents  "
"pr_Inhster_antiConv    " "Inhaled Glucocorticoids & Anticonvulsants        "
"pr_H2RA_Thiazolid      " "H2RA & TZD                                       "
"pr_H2RA_thiazDiur      " "H2RA & Thiazide Diuretics                        "
"pr_H2RA_TCAD           " "H2RA & TCAD                                      "
"pr_H2RA_SSRISNRI       " "H2RA & SSRI/SNRI                                 "
"pr_H2RA_SGAP           " "H2RA & SGAP                                      "
"pr_H2RA_SedHYP         " "H2RA & Sedative Hypnotics                        "
"pr_H2RA_Opioids        " "H2RA & Opioids                                   "
"pr_H2RA_Nitrates       " "H2RA & Nitrates                                  "
"pr_H2RA_loopDiur       " "H2RA & Loop Diuretics                            "
"pr_H2RA_fgAHist        " "H2RA & H1 Blockers                               "
"pr_H2RA_caaHTN         " "H2RA & CAAH                                      "
"pr_H2RA_Benzo          " "H2RA & Benzodiazepines                           "
"pr_H2RA_antiPark       " "H2RA & Antiparkinsons Agents                     "
"pr_H2RA_antiConv       " "H2RA & Anticonvulsants                           "
"pr_FGAP_SGAP           " "FGAP & SGAP                                      "
"pr_fgAHist_thiazDiur   " "H1 Blockers & Thiazide Diuretics                 "
"pr_fgAHist_Opioids     " "H1 Blockers & Opioids                            "
"pr_fgAHist_loopDiur    " "H1 Blockers & Loop Diuretics                     "
"pr_caaHTN_thiazDiur    " "CAAH & Thiazide Diuretics                        "
"pr_caaHTN_Opioids      " "CAAH & Opioids                                   "
"pr_caaHTN_loopDiur     " "CAAH & Loop Diuretics                            "
"pr_Benzo_thiazDiur     " "Benzodiazepines & Thiazide Diuretics             "
"pr_Benzo_SGAP          " "Benzodiazepines & SGAP                           "
"pr_Benzo_SedHYP        " "Benzodiazepines & Sedative Hypnotics             "
"pr_Benzo_Opioids       " "Benzodiazepines & Opioids                        "
"pr_Benzo_loopDiur      " "Benzodiazepines & Loop Diuretics                 "
"pr_Benzo_fgAHist       " "Benzodiazepines & H1 Blockers                    "
"pr_Benzo_antiPark      " "Benzodiazepines & Antiparkinsons Agents          "
"pr_Barbit_thiazDiur    " "Barbiturates & Thiazide Diuretics                "
"pr_antiPark_thiazDiur  " "Antiparkinsons Agents & Thiazide Diuretics       "
"pr_antiPark_SGAP       " "Antiparkinsons Agents & SGAP                     "
"pr_antiPark_Opioids    " "Antiparkinsons Agents & Opioids                  "
"pr_antiPark_loopDiur   " "Antiparkinsons Agents & Loop Diuretics           "
"pr_antiPark_FGAP       " "Antiparkinsons Agents & FGAP                     "
"pr_antiConv_thiazDiur  " "Anticonvulsants & Thiazide Diuretics             "
"pr_antiConv_TCAD       " "Anticonvulsants & TCA                            "
"pr_antiConv_SSRISNRI   " "Anticonvulsants & SSRI/SNRI                      "
"pr_antiConv_SGAP       " "Anticonvulsants & SGAP                           "
"pr_antiConv_SedHYP     " "Anticonvulsants & Sedative Hypnotics             "
"pr_antiConv_Opioids    " "Anticonvulsants & Opioids                        "
"pr_antiConv_Nitrates   " "Anticonvulsants & Nitrates                       "
"pr_antiConv_loopDiur   " "Anticonvulsants & Loop Diuretics                 "
"pr_antiConv_fgAHist    " "Anticonvulsants & H1 Blockers                    "
"pr_antiConv_caaHTN     " "Anticonvulsants & CAAH                           "
"pr_antiConv_Benzo      " "Anticonvulsants & Benzodiazepines                "
"pr_antiConv_Barbit     " "Anticonvulsants & Barbiturates                   "
"pr_antiConv_antiPark   " "Anticonvulsants & Antiparkinsons Agents          "
"pr_Benzo_FGAP		" "Benzodiazepines & FGAP 	  		    "
"pr_Benzo_Nitrates	" "Benzodiazepines & Nitrates 			    "
"pr_Benzo_caaHTN	" "Benzodiazepines & CAAH		  	    "
"pr_Benzo_musclrlx	" "Benzodiazepines & musclrlx 			    "
"pr_Benzo_Barbit	" "Benzodiazepines & Barbit 			    "
"pr_TCAD_FGAP		" "TCAD & FGAP					    "
"pr_TCAD_Nitrates 	" "TCAD & Nitrates				    "
"pr_TCAD_caaHTN		" "TCAD & CAAH					    "
"pr_TCAD_fgAHist	" "TCAD & H1 Blockers				    "
"pr_TCAD_musclrlx	" "TCAD & musclrlx				    "
"pr_TCAD_Barbit		" "TCAD & Barbit				    "
"pr_SSRISNRI_musclrlx	" "SSRISNRI & musclrlx				    "
"pr_antiConv_FGAP	" "antiConv & FGAP				    "
"pr_antiConv_musclrlx   " "antiConv & musclrlx				    "
"pr_Thiazolid_SGAP	" "TZD & SGAP					    "
"pr_Thiazolid_FGAP	" "TZD & FGAP					    "
"pr_Thiazolid_caaHTN	" "TZD & CAAH					    "
"pr_Thiazolid_fgAHist	" "TZD & H1 Blockers				    "
"pr_Thiazolid_musclrlx	" "TZD & musclrlx				    "
"pr_Thiazolid_Barbit	" "TZd & Barbit					    "
"pr_Thiazolid_Benzo	" "TZD & Benzo					    "
"pr_H2RA_FGAP	     	" "H2RA & FGAP					    "
"pr_H2RA_musclrlx	" "H2RA & musclrlx				    "
"pr_H2RA_Barbit		" "H2RA & Barbit			   	    "
"pr_Oralster_SGAP	" "Oralster & SGAP				    "
"pr_Oralster_FGAP	" "Oralster & FGAP				    "
"pr_Oralster_caaHTN	" "Oralster & CAAH				    "
"pr_Oralster_musclrlx	" "Oralster & musclrlx				    "
"pr_Oralster_Barbit	" "Oralster & Barbit				    "
"pr_Inhster_FGAP	" "Inhster & FGAP			   	    "
"pr_Inhster_caaHTN	" "Inhster & CAAH				    "
"pr_Inhster_fgAHist	" "Inhster & H1 Blockers			    "
"pr_Inhster_musclrlx	" "Inhster & musclrlx				    "
"pr_Inhster_Barbit	" "Inhster & Barbit				    "
"pr_Inhster_TCAD	" "Inhster & TCAD			   	    "
"pr_antiPark_caaHTN	" "antiPark & CAAH				    "
"pr_antiPark_Nitrates	" "antiPark & Nitrates				    "
"pr_Barbit_antiPark	" "Barbit & antiPark				    "
"pr_Barbit_caaHTN	" "Barbit & CAAH				    "
"pr_Barbit_fgAHist	" "Barbit & fgAHist				    "
"pr_Barbit_FGAP		" "Barbit & FGAP				    "
"pr_Barbit_loopDiur	" "Barbit & loopDiur				    "
"pr_Barbit_musclrlx	" "Barbit & musclrlx				    "
"pr_Barbit_Nitrates	" "Barbit & Nitrates				    "
"pr_Barbit_Opioids	" "Barbit & Opioids				    "
"pr_Barbit_SedHYP	" "Barbit & SedHYP				    "
"pr_Barbit_SGAP		" "Barbit & SGAP			  	    "
"pr_caaHTN_FGAP		" "caaHTN & FGAP			   	    "
"pr_caaHTN_Nitrates	" "caaHTN & Nitrates				    "
"pr_caaHTN_SGAP		" "caaHTN & SGAP			            "
"pr_fgAHist_antiPark	" "H1 Blockers & antiPark			    "
"pr_fgAHist_caaHTN	" "H1 Blockers & CAAH				    "
"pr_fgAHist_FGAP	" "H1 Blockers & FGAP			       	    "
"pr_fgAHist_Nitrates	" "H1 Blockers & Nitrates			    "
"pr_fgAHist_SGAP	" "H1 Blockers & SGAP		       		    "
"pr_FGAP_loopDiur	" "FGAP & loopDiur				    "
"pr_musclrlx_antiPark	" "musclrlx & antiPark				    "
"pr_musclrlx_caaHTN	" "musclrlx & CAAH				    "
"pr_musclrlx_fgAHist	" "musclrlx & H1 Blockers			    "
"pr_musclrlx_FGAP	" "musclrlx & FGAP				    "
"pr_musclrlx_loopDiur   " "musclrlx & loopDiur				    "
"pr_musclrlx_Nitrates	" "musclrlx & Nitrates				    "
"pr_musclrlx_SGAP	" "musclrlx & SGAP				    "
"pr_Nitrates_FGAP	" "Nitrates & FGAP				    "
"pr_Nitrates_SGAP	" "Nitrates & SGAP				    "
"pr_Opioids_FGAP	" "Opioids & FGAP	        		    "
"pr_SedHYP_FGAP		" "SedHYP & FGAP  				    "
"pr_SedHYP_musclrlx	" "SedHYP & musclrlx				    "
;


data label;
set label;
new_order=_N_;
proc sort; by rx;

%macro gp(data,short);
data &short;
set modelout.rx_bene_fx_yr_&data;
if nbene<11 then do; nbene= lt11; fx_hip=lt11; hip_py=-99; years=-99; end;
else if 0 < fx_hip < 11 then do; fx_hip=lt11; hip_py=-99; end;
if order=1 then order=233;
format hip_py 8.3;
rename nbene=&short._nbene fx_hip=&short._hip years=&short._py hip_py=&short._hip_py;
proc sort; by descending order;
%mend;
*%gp(all,a);
%gp(female,f);
%gp(male,m);
/*%gp(female_dm,fd);
%gp(male_dm,md);
%gp(female_tobacco,ft);
%gp(male_tobacco,mt);
%gp(female_ltc,fl);
%gp(male_ltc,ml);
*/
data one;
merge /*a*/ f m 
/*fd md ft mt fl ml*/
;
by descending order;

proc sort; by rx;

data one;
merge label (in=a) one (in=b);
by rx;
if a;

title3 '20% 3FAD days flagged; Bene, FX, PY Rate for single and combo FADS';

proc sort; by new_order;

proc print noobs;
var rx label /*a_nbene  a_hip a_py a_hip_py*/
       f_nbene  /*f_hip*/ f_py f_hip_py
       m_nbene  /*m_hip*/  m_py m_hip_py
      /* fd_nbene fd_hip fd_py fd_hip_py
       md_nbene md_hip md_py md_hip_py
       ft_nbene ft_hip ft_py ft_hip_py
       mt_nbene mt_hip mt_py mt_hip_py
       fl_nbene fl_hip fl_py fl_hip_py
       ml_nbene ml_hip ml_py ml_hip_py*/
       ;
/*
proc print noobs;
var rx label a_nbene a_hip a_py a_hip_py
	f_nbene f_hip f_py f_hip_py
       m_nbene m_hip m_py m_hip_py
       fd_nbene fd_hip fd_py fd_hip_py
       md_nbene md_hip md_py md_hip_py
       ft_nbene ft_hip ft_py ft_hip_py
       mt_nbene mt_hip mt_py mt_hip_py
       fl_nbene fl_hip fl_py fl_hip_py
       ml_nbene ml_hip ml_py ml_hip_py;
*/
endsas;


proc sort; by new_order;
proc print noobs;
var label a_hip_py
       f_hip_py
       m_hip_py
       fd_hip_py
       md_hip_py
       ft_hip_py
       mt_hip_py
       fl_hip_py
       ml_hip_py;
title4 'hip per 1000 py';

endsas;
var rx a_hip a_hip_py
       f_hip f_hip_py
       m_hip m_hip_py
       fd_hip fd_hip_py
       md_hip md_hip_py
       ft_hip ft_hip_py
       mt_hip mt_hip_py
       fl_hip fl_hip_py
       ml_hip ml_hip_py;

var rx a_nbene a_hip a_py a_hip_py
       f_nbene f_hip f_py f_hip_py
       m_nbene m_hip m_py m_hip_py
       fd_nbene fd_hip fd_py fd_hip_py
       md_nbene md_hip md_py md_hip_py
       ft_nbene ft_hip ft_py ft_hip_py
       mt_nbene mt_hip mt_py mt_hip_py
       fl_nbene fl_hip fl_py fl_hip_py
       ml_nbene ml__hip ml_py ml_hip_py

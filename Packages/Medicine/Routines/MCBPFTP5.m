MCBPFTP5 ;WISC/TJK,ALG-PFT BRIEF REPORT-SPECIAL STUDIES (PT 1) ;5/14/92  13:30
 ;;2.3;Medicine;;09/13/1996
 S CI95="" G INT:'$D(^MCAR(700,MCARGDA,"S")),INT:'$O(^("S",0)) S MCX=0
 W !! X MCFF Q:$D(MCOUT)  S CI95="",HEAD1="SPECIAL STUDIES",MCSP="" D HEAD1^MCBPFTP2,HEAD2^MCBPFTP2 Q:$D(MCOUT)
SPEC1 S MCX=$O(^MCAR(700,MCARGDA,"S",MCX)) G INT:MCX'?1N.N S MCREC=^(MCX,0),TYPE=$P(MCREC,U),(MCREC1,MCREC2)="" S:$D(^(1)) MCREC1=^(1) S:$D(^(2)) MCREC2=^(2)
 S ND="AS",ND1="S" D PRETEST^MCBPFTP2
 W !!,?5,$S(TYPE="E":"EXERCISE",TYPE="M":"MECHANICS",TYPE="S":"SMALL AIRWAY",1:"MAXIMUM PRESSURES") D PREVDATE^MCBPFTP2
 I MCREC2'="",$P(MCREC2,U,8)'="" W !,?5,"(NOTES): ",$P(MCREC2,U,8) X MCFF Q:$D(MCOUT)
 I TYPE="P" W ! S ND=MCREC2,PC=7,MEAS="PiMAX",UNITS="cmH2O",MCP1=MCP1S2,MCP2=MCP2S2 D PIMAX^MCBPFTP6 Q:$D(MCOUT)  G SPEC1
 G ^MCBPFTP7:TYPE="E" S ND=MCREC G SMAIR:TYPE="S"
 S MEAS="Raw",UNITS="cmH20/L/S",PC=2,MCP1=MCP1S0,MCP2=MCP2S0 D RAW^MCBPFTP6 Q:$D(MCOUT)
 S MEAS="SGaw",UNITS="L/S/cmH20",PC=3 D SGAW^MCBPFTP6 Q:$D(MCOUT)
 S MEAS="Cst",UNITS="4cmH20",PC=4 D CST^MCBPFTP6 Q:$D(MCOUT)
 G SPEC1
SMAIR S MEAS="Cdyn",UNITS="L/cmH20",PC=5 D SETNULL^MCBPFTP6 Q:$D(MCOUT)
 S MEAS="FEF50 He-Air",UNITS="L/Sec",PC=6,MCP1=MCP1S0,MCP2=MCP2S0 D FEF50^MCBPFTP6 Q:$D(MCOUT)
 S MEAS="VISOV",UNITS="L",PC=7 D VISOV^MCBPFTP6 Q:$D(MCOUT)
 S MEAS="CV",PC=8 D SETNULL^MCBPFTP6
 S MEAS="CC",PC=9 D SETNULL^MCBPFTP6
 S CV=$P(MCREC,U,8),(CVVC,CVTL)=""
 I CV'="" S:MCVCN'="" CVVC=CV/MCVCN S:MCTLCN'="" CVTL=CV/MCTLCN
 W !,?5,"CV/VC"
 D CVVC^MCBPFTP6 W ?18,"%",?25,$S(PRED:$J(PRED,5,2),1:""),?35,$J(CVVC,5,2),?45,$S(PRED:$J(CVVC/PRED*100,5,1),1:"") X MCFF Q:$D(MCOUT)
 W !,?5,"CV/TLC",?18,"%",?35,$J(CVTL,5,2) X MCFF Q:$D(MCOUT)
 S VISOV=$P(MCREC,U,7) W !,?5,"VISOV/CV"
 I VISOV'="",+CV'=0 W ?18,"%",?35,$J(VISOV/CV,5,2)
 X MCFF
 K CV,CVTL,CVVC,VISOV Q:$D(MCOUT)  G SPEC1
INT K MCSP G INT^MCBPFTP7
EXIT Q

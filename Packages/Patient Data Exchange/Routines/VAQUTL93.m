VAQUTL93 ;ALB/JFP,JRP - UTILITY ROUTINES; 01-APR-93
 ;;1.5;PATIENT DATA EXCHANGE;**7**;NOV 17, 1993
EP ; -- Entry point for report
 F SEG="MIN","MAS","ELIG","DENTAL","APPOINT","INSURE" D EXTR
 QUIT
 ;
EXTR ;EXTRACT INFORMATION
 W !,"[ ",SEG," ]",!
 W !,?5,"FILE NO.",?25,"FIELD NO",?35,"NODE;PIECE",?48,"DESCRIPT",!
 S (FLENO,ERROR)=0
 F LOOP=1:1 D  Q:(ERROR)
 .S OLDFLE=FLENO
 .S TMP=$T(@SEG+LOOP^VAQDBII1)
 .I ($P(TMP,";;",2)="") S ERROR=1 Q
 .S FLENO=$P(TMP,";",3)
 .S FIELDS=$P(TMP,";",4)
 .I OLDFLE'=FLENO S FLEREF=FLENO W ! ;$G(^DIC(FLENO,0,"GL"))
 .I OLDFLE=FLENO S FLEREF=" "
 .F LP=1:1 D  Q:FLD=""
 ..S FLD=$P(FIELDS,",",LP) Q:FLD=""
 ..S DDNODE=$G(^DD(FLENO,FLD,0))
 ..S FLDDS=$P(DDNODE,U,1)
 ..S FLDLC=$P(DDNODE,U,4)
 ..W !,?5,FLEREF,?25,FLD,?35,FLDLC,?48,FLDDS
 ..S FLEREF=" "
 QUIT
 ;
 ;EXTRACT OTHER ELIGIBILITIES
 D ELIG^VAQDBIP6
 ;EXTRACT APPOINTMENTS
 D APPOINT^VAQDBIP6
 ;EXTRACT DENTAL APPOINTMENTS
 D DENTAL^VAQDBIP6
 ;EXTRACT ACTIVE INSURANCES
 D INSURE^VAQDBIP7
 QUIT
 ;
ADDEDT ;TAG FOR ADD/EDIT OPTIONS
 ;INPUT  : VAQOFLG - Number indicating which option is calling tag
 ;           1 = VAQ (EDIT) ENCRY FIELDS
 ;           2 = VAQ (EDIT) PARAMETER
 ;           3 = VAQ (EDIT) RELEASE GROUP
 ;           4 = VAQ (EDIT) OUTGOING GROUP
 ;           5 = VAQ (EDIT) SEGMENT GRP - ALL
 ;           6 = VAQ (EDIT) SEGMENT GRP - PRIV
 ;           7 = VAQ (EDIT) SEGMENT GRP - PUBL
 ;           8 = VAQ (EDIT) MAX LIMITS
 ;OUTPUT  : None
 ;
 S VAQOFLG=+$G(VAQOFLG)
 Q:((VAQOFLG<1)!(VAQOFLG>8))
 ;DECLARE VARIABLES
 N FNUM,TMPLT,SCRN,DELADD
 S TMPLT="[VAQ EDIT FILE]"
 S SCRN=""
 S DELADD=3
 S:(VAQOFLG=1) FNUM=394.73
 S:(VAQOFLG=2) FNUM=394.81
 S:(VAQOFLG=3) FNUM=394.82
 S:(VAQOFLG=4) FNUM=394.83
 S:(VAQOFLG=5) FNUM=394.84
 S:(VAQOFLG=6) FNUM=394.84,TMPLT="[VAQ EDIT FILE (PRIVATE)]",SCRN="I (($P(^(0),U,2)'=1)&($P(^(0),U,3)=$G(DUZ)))"
 S:(VAQOFLG=7) FNUM=394.84,TMPLT="[VAQ EDIT FILE (PUBLIC)]",SCRN="I $P(^(0),U,2)=1"
 S:(VAQOFLG=8) FNUM=394.71,DELADD=0
 D INPUT(FNUM,TMPLT,SCRN,DELADD)
 Q
INPUT(FILENUM,TEMPLATE,SCREEN,ADDEL) ;ADD/EDIT ENTRIES IN FILES USING INPUT TEMPLATE
 ;INPUT  : FILE - File number
 ;         TEMPLATE - Name of input template (with brackets)
 ;         SCREEN - Optional screen to use during lookup
 ;         ADDEL - Code indicating if add/delete override is allowed
 ;           0 = Don't override add/delete protection (default)
 ;           1 = Override add protection only
 ;           2 = Override delete protection only
 ;           3 = Override add & delete protection
 ;OUTPUT : None
 ;NOTE   : All input is assumed to be in correct format
 ;         (Existance of variables is the only thing checked)
 ;
 Q:('$G(FILENUM))
 Q:($G(TEMPLATE)="")
 S SCREEN=$G(SCREEN)
 S ADDEL=+$G(ADDEL)
 ;INITIALIZE VARIABLES
 N DIC,X,Y,DLAYGO,DTOUT,DUOUT,DIE,DA,DR,DIDEL,STOP
 ;CONTINUOUS LOOP
 S STOP=0
 F  D  Q:(STOP)
 .;ADD/FIND ENTRY
 .K DIC,DLAYGO,X
 .S DIC=FILENUM
 .S DIC(0)="AEMQ"
 .S DIC("DR")=TEMPLATE
 .S:(SCREEN'="") DIC("S")=SCREEN
 .S:((ADDEL=1)!(ADDEL=3)) DLAYGO=FILENUM,DIC(0)="AEMQL"
 .D ^DIC
 .;CHECK FOR ABORT
 .I ($D(DTOUT)!$D(DUOUT)!(Y<0)) S STOP=1 Q
 .;ENTRY ADDED
 .Q:(+$P(Y,"^",3))
 .;EDIT ENTRY
 .K DIE,DA,DR,DIDEL
 .S DIE=FILENUM
 .S DA=+Y
 .S DR=TEMPLATE
 .S:((ADDEL=2)!(ADDEL=3)) DIDEL=FILENUM
 .D ^DIE
 Q

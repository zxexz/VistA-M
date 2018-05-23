PSOERXD1 ;ALB/BWF - eRx Drug display/actions ; 8/3/2016 5:14pm
 ;;7.0;OUTPATIENT PHARMACY;**467,520**;DEC 1997;Build 52
 ;
EN ; -- main entry point for PSO ERX HOLDING QUEUE
 D EN^VALM("PSO ERX DRUG VALIDATION")
 Q
 ;
HDR ; -- header code
 S VALMHDR(1)="eRx Patient: "_$$GET1^DIQ(52.49,PSOIEN,.04,"E")
 S VALMHDR(2)="eRx Reference #: "_$$GET1^DIQ(52.49,PSOIEN,.01,"E")
 I $G(VALMBCK)="R" D INIT
 Q
 ;
INIT ;
 Q:'$G(PSOIEN)
 N LINE,ERXDRG,LINETXT,ERXQTY,ERXQQ,ERXDF,ERXSC,ERXRFLS,ERXDS,ERXDT,ERXDW,ERXDSUB,VADRG,NXTLINE,ORDITEM
 N ERXCOMM,ERXDRUG,ERXSIG,FILLDT,ISSDT,MAILWIN,PATSTAT,SGLOOP,SIGDATA,SIGLINE,SIGLOOP,VACLIN,VACOPIES,VADAYS
 N VADOSE,VADRGIEN,VAENBY,VAENDATE,VAPINST,VAPROV,VAPUS,VAQTY,VAREF,VAREMARK,VAROUTE,VASCHED,VASIG,VAVERB
 N PSODAT,PSONEW,SIGDATA,SGLOOP,PRVCARY,PCRFST,PCLOOP,INSTARY,IFRST,INLOOP,SEPLN,PATINST,PIARY,PILOOP
 N SFIRST,SIGARY,PSOIENS,PSODAT2,PFRST,FN,FSSIG,INST,PATIEN,PCFRST,PRVCOMM,PSODFN,SLOOP,ERXDIR,MANVAL
 N VASIG,VASARY,VALBY,VALDTTM,NFIRST,NLOOP,ERXNARY,DIE,DA,DR,INLOOP,ERXNOTE,PUC,DRGARY,DLP,X,Y,DINUM,DFN
 S LINE=0
 S PSOIENS=PSOIEN_","
 S FN=52.49
 D GETS^DIQ(52.49,PSOIEN,"**","IE","PSODAT")
 S PATIEN=$G(PSODAT(FN,PSOIENS,.05,"I"))
 ; stub entry in file 55 if it doesn't exist
 I $G(PATIEN) D
 .Q:$D(^PS(55,PATIEN,0))
 .S DIC="^PS(55,",DLAYGO=55
 .K DD,DO S DIC(0)="L",(DINUM,X)=PATIEN D FILE^DICN D:Y<1  K DIC,DA,DR,DD,DO,DLAYGO
 ..S $P(^PS(55,PATIEN,0),"^")=PATIEN K DIK,DA S DA=PATIEN,DIK="^PS(55,",DIK(1)=.01 D EN^DIK K DIK,DA
 S ERXDRUG=$G(PSODAT(FN,PSOIENS,3.1,"E"))
 ; quantity
 S ERXQTY=$G(PSODAT(FN,PSOIENS,5.1,"E"))
 ; quantity qualifier
 S ERXQQ=$G(PSODAT(FN,PSOIENS,5.2,"E"))
 ; drug form code
 S ERXDF=$G(PSODAT(FN,PSOIENS,41,"E"))
 ; strength code
 S ERXSC=$G(PSODAT(FN,PSOIENS,43,"E"))
 ; refills
 S ERXRFLS=$G(PSODAT(FN,PSOIENS,5.6,"E"))
 ;/BLB/ PSO*7.0*520 - BEGIN CHANGE
 I ERXRFLS="" D
 .S ERXRFLS=$G(PSODAT(FN,PSOIENS,5.7,"I"))
 ;/BLB/ - END CHANGE
 ; days supply
 S ERXDS=$G(PSODAT(FN,PSOIENS,5.5,"E"))
 ; erx date
 S ERXDT=$G(PSODAT(FN,PSOIENS,.03,"E"))
 ; written date
 S ERXDW=$G(PSODAT(FN,PSOIENS,5.9,"E"))
 ; substitutions
 S ERXDSUB=$G(PSODAT(FN,PSOIENS,5.8,"E"))
 ; va (matched) drug
 S ERXDIR=$G(PSODAT(FN,PSOIENS,7,"E"))
 S VADRG=$G(PSODAT(FN,PSOIENS,3.2,"E"))
 I VADRG']"" S VADRG="NOT LINKED"
 S PUC=$G(PSODAT(FN,PSOIENS,42,"E"))
 D TXT2ARY(.DRGARY,ERXDRUG,,70)
 S LINE=LINE+1 D SET^VALM10(LINE,"eRx Drug: "_$G(DRGARY(1)))
 S DLP=1
 F  S DLP=$O(DRGARY(DLP)) Q:'DLP  D
 .S LINE=LINE+1 D SET^VALM10(LINE,"          "_$G(DRGARY(DLP)))
 S LINE=LINE+1
 D ADDITEM^PSOERX1A(.LINETXT,"Qty: ",ERXQTY,1,26)
 D ADDITEM^PSOERX1A(.LINETXT,"Days Supply: ",ERXDS,28,26)
 D ADDITEM^PSOERX1A(.LINETXT,"Date Written: ",$P(ERXDW,"@"),54,26)
 D SET^VALM10(LINE,LINETXT) S LINETXT=""
 S LINE=LINE+1
 S LINE=LINE+1 D SET^VALM10(LINE,"Qty Qualifier: "_ERXQQ)
 S LINE=LINE+1 D SET^VALM10(LINE,"Drug Form: "_ERXDF)
 S LINE=LINE+1 D SET^VALM10(LINE,"Strength: "_ERXSC)
 S LINE=LINE+1 D SET^VALM10(LINE,"Potency Unit Code: "_PUC)
 S LINE=LINE+1
 S LINE=LINE+1
 D ADDITEM^PSOERX1A(.LINETXT,"Refills: ",ERXRFLS,1,15)
 D ADDITEM^PSOERX1A(.LINETXT,"Do not sub: ",ERXDSUB,28,50)
 D SET^VALM10(LINE,LINETXT) S LINETXT=""
 S SIGDATA=""
 D TXT2ARY(.SIGARY,ERXDIR,,70)
 S SFIRST=$O(SIGARY(0))
 S SGLOOP=0 F  S SGLOOP=$O(SIGARY(SGLOOP)) Q:'SGLOOP  D
 .S LINE=LINE+1 D SET^VALM10(LINE,$S(SGLOOP=SFIRST:"eRx Sig: ",1:"         ")_$G(SIGARY(SGLOOP)))
 S ERXNOTE=$G(PSODAT(FN,PSOIENS,8,"E"))
 D TXT2ARY(.ERXNARY,ERXNOTE,,65)
 S NFIRST=$O(ERXNARY(0))
 S NLOOP=0 F  S NLOOP=$O(ERXNARY(NLOOP)) Q:'NLOOP  D
 .S LINE=LINE+1 D SET^VALM10(LINE,$S(NLOOP=NFIRST:"eRx Notes: ",1:"           ")_$G(ERXNARY(NLOOP)))
 S DFN=$$GET1^DIQ(52.49,PSOIEN,.05,"I")
 S LINE=LINE+1 D SET^VALM10(LINE,"")
 S $P(SEPLN,"-",80)="-" D SET^VALM10(LINE,SEPLN)
 ; vista drug information
 S MANVAL=$$GET1^DIQ(52.49,PSOIEN,1.5,"I")
 S VALBY=$$GET1^DIQ(52.49,PSOIEN,1.11,"E")
 S VALDTTM=$$GET1^DIQ(52.49,PSOIEN,1.12,"E")
 S LINE=LINE+1 D SET^VALM10(LINE,"Status: "_$S(MANVAL:"VALIDATED ("_VALBY_" - "_VALDTTM_")",1:"NOT VALIDATED"))
 ;/BLB/ PSO*7.0*520 - BEGIN CHANGE
 I $$GET1^DIQ(52.49,PSOIEN,.05,"I") D
 .D ALG^PSOERXU1(.LINE)
 ;/BLB/ PSO*7.0*520
 S LINE=LINE+1 D SET^VALM10(LINE,"")
 S VADRGIEN=$G(PSODAT(52.49,PSOIENS,3.2,"I"))
 S VADRG=$S(VADRGIEN:$$GET1^DIQ(50,VADRGIEN,.01,"E"),1:"NOT MATCHED")
 S LINE=LINE+1 D SET^VALM10(LINE," (1) Vista Drug: "_VADRG)
 ; may not need clinic or remarks.
 S (VACLIN,VAREMARK)=""
 S VAPROV=$G(PSODAT(52.49,PSOIENS,2.3,"E"))
 S INST=$G(PSODAT(52.49,PSOIENS,26,"E"))
 ; if erx user comments exist, should we display them separately from the erx provider directions?
 I $D(PSODAT(52.49,PSOIENS,30)) S PRVCOMM=$G(PSODAT(52.49,PSOIENS,30,"E"))
 I '$L($G(PRVCOMM)) S PRVCOMM=$G(PSODAT(52.49,PSOIENS,8,"E"))
 S VADAYS=$G(PSODAT(52.49,PSOIENS,20.2,"E"))
 S VAQTY=$G(PSODAT(52.49,PSOIENS,20.1,"E"))
 S VAVERB=$G(PSODAT(52.49,PSOIENS,20.3,"E"))
 S PATSTAT=$$GET1^DIQ(55,PATIEN,3,"E")
 S MAILWIN=$G(PSODAT(52.49,PSOIENS,20.4,"E")) I MAILWIN="" S DIE="^PS(52.49,",DA=PSOIEN,DR="20.4///W" D ^DIE K DIE
 S VAREF=$G(PSODAT(52.49,PSOIENS,20.5,"E"))
 S PATINST=$G(PSODAT(52.49,PSOIENS,27,"E"))
 S PATINST=$$LSIG^PSOQUTIL(PATINST)
 ; testing instruction building
 ; end testing
 S VACLIN=$G(PSODAT(52.49,PSOIENS,20.6,"E")) I VACLIN="" S DIE="^PS(52.49,",DA=PSOIEN,DR="20.6///"_$$GET1^DIQ(59,PSOSITE,10,"I") D ^DIE K DIE
 D TXT2ARY(.PIARY,PATINST,,55)
 D DOSE
 ; pat instructions built from dosage multiple
 S PFRST="",PFRST=$O(PIARY(0)) I 'PFRST S PFRST=0
 S LINE=LINE+1 D SET^VALM10(LINE," (3) Pat Instructions: "_$G(PIARY(PFRST)))
 S PILOOP=PFRST F  S PILOOP=$O(PIARY(PILOOP)) Q:'PILOOP  D
 .S LINE=LINE+1 D SET^VALM10(LINE,"                       "_$G(PIARY(PILOOP)))
 ; provider comments come from the 'notes' field in 52.49 (#8)
 D TXT2ARY(.PRVCARY,PRVCOMM,,57)
 S PCFRST=$O(PRVCARY(0))
 S PCLOOP=0 F  S PCLOOP=$O(PRVCARY(PCLOOP)) Q:'PCLOOP  D
 .S LINE=LINE+1 D SET^VALM10(LINE,$S(PCFRST=PCLOOP:" (4) Provider Comments: ",1:"                        ")_PRVCARY(PCLOOP))
 ; instructions are the unaltered SIG.
 ; if the instructions are longer than 57, convert to array for display
 S VASIG=""
 S SLOOP=0 F  S SLOOP=$O(^PS(52.49,PSOIEN,"SIG",SLOOP)) Q:'SLOOP  D
 .I '$L($G(VASIG)) S VASIG=$G(^PS(52.49,PSOIEN,"SIG",SLOOP,0)) Q
 .S VASIG=$G(VASIG)_" "_$G(^PS(52.49,PSOIEN,"SIG",SLOOP,0))
 S INLOOP=0 F  S INLOOP=$O(PSODAT(52.49,PSOIENS,31,INLOOP)) Q:'INLOOP  D
 .I '$L(INST) S INST=$G(PSODAT(52.49,PSOIENS,31,INLOOP)) Q
 .S INST=INST_" "_$G(PSODAT(52.49,PSOIENS,31,INLOOP))
 D TXT2ARY(.INSTARY,INST,,57)
 S IFRST=$O(INSTARY(0))
 S INLOOP=0 F  S INLOOP=$O(INSTARY(INLOOP)) Q:'INLOOP  D
 .S LINE=LINE+1 D SET^VALM10(LINE,$S(IFRST=INLOOP:"          Instructions: ",1:"                        ")_$G(INSTARY(INLOOP)))
 S VASIG=VASIG_" "_PATINST_" "_PRVCOMM
 D TXT2ARY(.VASARY,VASIG,,55)
 S FSSIG=$O(VASARY(0))
 S LINE=LINE+1 D SET^VALM10(LINE,"                   SIG: "_$S(FSSIG:$G(VASARY(FSSIG)),1:""))
 S SLOOP=1 F  S SLOOP=$O(VASARY(SLOOP)) Q:'SLOOP  D
 .S LINE=LINE+1 D SET^VALM10(LINE,"                        "_VASARY(SLOOP))
 S LINETXT=""
 S LINE=LINE+1 D SET^VALM10(LINE," (5) Patient Status: "_PATSTAT)
 S LINE=LINE+1
 D ADDITEM^PSOERX1A(.LINETXT," (6) Days Supply: ",VADAYS,1,25)
 D ADDITEM^PSOERX1A(.LINETXT,"     (7) QTY: ",VAQTY,40,30)
 D SET^VALM10(LINE,LINETXT) S LINETXT=""
 S LINE=LINE+1 D SET^VALM10(LINE,"    Provider ordered '"_$S($L(ERXRFLS):ERXRFLS,1:0)_"' refills")
 S LINE=LINE+1
 D ADDITEM^PSOERX1A(.LINETXT," (8) # of Refills: ",VAREF,1,30)
 ; routing defaults to 'M'ail
 D ADDITEM^PSOERX1A(.LINETXT,"(9) Routing: ",MAILWIN,45,25)
 D SET^VALM10(LINE,LINETXT) S LINETXT=""
 S LINE=LINE+1 D SET^VALM10(LINE," (10)    Clinic: "_VACLIN)
 S LINE=LINE+1 D SET^VALM10(LINE,"       Provider: "_VAPROV)
 S VALMCNT=LINE
 S EDTYP="D"
 K PSODAT,PSONEW,DOENT,TDUR
 Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
 ;
EXIT ; -- exit code
 K @VALMAR,EDTYP
 Q
 ;
EXPND ; -- expand code
 Q
 ; ARY - array to store the output (pass by reference)
 ; TEXT - the text to convert into the array format
 ; DELIM - delimiter for text (default is space)
 ; MAXLEN - maximum length of each array items text, defaults to 80
TXT2ARY(ARY,TEXT,DELIM,MAXLEN) ;
 N WORD,I,LCNT,LINETXT,S
 S S=$S($D(DELIM):DELIM,1:" ")
 I '$G(MAXLEN) S MAXLEN=80
 S LCNT=1,LINETXT=""
 F I=1:1:$L(TEXT,S) D
 .S WORD=$P(TEXT,S,I)
 .I $L(LINETXT)+$L(S)+$L(WORD)>MAXLEN D  Q
 ..S ARY(LCNT)=LINETXT
 ..S LCNT=LCNT+1,LINETXT=WORD
 .I '$L(LINETXT) S LINETXT=WORD Q
 .S LINETXT=LINETXT_S_WORD
 ; if there is information left, set it into the array
 I $L(LINETXT) S ARY(LCNT)=$G(LINETXT)
 Q
DOSE ;displays dosing info for pending orders.  called from psoorfi1
 K II,UNITS S DS=1
 I '$O(^PS(52.49,PSOIEN,21,0)) S LINE=LINE+1,LINETXT="" D ADDITEM^PSOERX1A(.LINETXT," (2)          *Dosage:",,1,30) D SET^VALM10(LINE,LINETXT) S LINETXT="" G DOSEX
 F I=0:0 S I=$O(^PS(52.49,PSOIEN,21,I)) Q:'I  S DOSE=$G(^PS(52.49,PSOIEN,21,I,1)),DOSE1=$G(^(2)) D  D DOSE1
 .S II=$G(II)+1 K PSONEW("UNITS",II)
 .S PSONEW("DOSE",II)=$P(DOSE1,"^"),PSONEW("DOSE ORDERED",II)=$P(DOSE1,"^",2),PSONEW("UNITS",II)=$P(DOSE,"^",9),PSONEW("NOUN",II)=$P(DOSE,"^",5)
 .S:$P(DOSE,"^",9) UNITS=$P(^PS(50.607,$P(DOSE,"^",9),0),"^")
 .S PSONEW("VERB",II)=$P(DOSE,"^",10),PSONEW("ROUTE",II)=$P(DOSE,"^",8)
 .S ROUTE="" S:$P(DOSE,"^",8) ROUTE=$P(^PS(51.2,$P(DOSE,"^",8),0),"^")
 .S PSONEW("SCHEDULE",II)=$P(DOSE,"^"),PSONEW("DURATION",II)=$P(DOSE,"^",2)
 .S DOENT=$G(DOENT)+1 I $P(DOSE,"^",6)]"" S PSONEW("CONJUNCTION",II)=$S($P(DOSE,"^",6)="S":"T",$P(DOSE,"^",6)="X":"X",1:"A")
 .I 'PSONEW("DOSE ORDERED",II),$G(PSONEW("VERB",II))]"" D
 ..S LINETXT="" S LINE=LINE+1 D ADDITEM^PSOERX1A(.LINETXT,"               Verb: ",$G(PSONEW("VERB",II)),1,40)
 ..D SET^VALM10(LINE,LINETXT) S LINETXT=""
 .S:$G(DS) LINE=LINE+1 D ADDITEM^PSOERX1A(.LINETXT," (2)","",1,5)
DOSEX S PSONEW("ENT")=+$G(II) K DOSE,DOSE1,II,I,UNITS,ROUTE,DG
 Q
DOSE1 ;
 I $G(DS)=1 D ADDITEM^PSOERX1A(.LINETXT,"        *Dosage:","",4,30) D FMD G DU
 S LINE=LINE+1 D ADDITEM^PSOERX1A(.LINETXT,"            *Dosage:","",1,30) D FMD
DU ;
 S PSODFN=$O(^PS(55,"B",PATIEN,0))
 I 'PSONEW("DOSE ORDERED",I),$P($G(^PS(55,PSODFN,"LAN")),"^") D
 .S LINE=LINE+1,LINETXT="" D ADDITEM^PSOERX1A(.LINETXT,"  Oth. Lang. Dosage: ",$G(PSONEW("ODOSE",I)),1,50) D SET^VALM10(LINE,LINETXT) S LINETXT=""
 I PSONEW("DOSE ORDERED",II),$G(PSONEW("VERB",II))]"" D
 .S LINE=LINE+1 D ADDITEM^PSOERX1A(.LINETXT,"               Verb: ",$G(PSONEW("VERB",II)),1,50) D SET^VALM10(LINE,LINETXT) S LINETXT=""
 .S LINE=LINE+1 D ADDITEM^PSOERX1A(.LINETXT,"     Dispense Units: ",$S($E(PSONEW("DOSE ORDERED",II),1)=".":"0",1:"")_PSONEW("DOSE ORDERED",II),1,50) D SET^VALM10(LINE,LINETXT) S LINETXT=""
 I PSONEW("NOUN",II)]"" D
 .S LINE=LINE+1 D ADDITEM^PSOERX1A(.LINETXT,"               Noun: ",PSONEW("NOUN",II),1,50) D SET^VALM10(LINE,LINETXT) S LINETXT=""
 I $G(ROUTE)]"" D
 .S LINE=LINE+1 D ADDITEM^PSOERX1A(.LINETXT,"             *Route: ",$G(ROUTE),1,50) D SET^VALM10(LINE,LINETXT) S LINETXT=""
 S LINE=LINE+1 D ADDITEM^PSOERX1A(.LINETXT,"          *Schedule: ",PSONEW("SCHEDULE",II),1,50) D SET^VALM10(LINE,LINETXT) S LINETXT=""
 I $G(PSONEW("DURATION",II))]"" D
 .S PSONEW("DURATION",II)=$S($E(PSONEW("DURATION",II),1)'?.N:$E(PSONEW("DURATION",II),2,99)_$E(PSONEW("DURATION",II),1),1:PSONEW("DURATION",II))
 .S TDUR=PSONEW("DURATION",II)_" ("_$S(PSONEW("DURATION",II)["M":"MINUTES",PSONEW("DURATION",II)["H":"HOURS",PSONEW("DURATION",II)["L":"MONTHS",PSONEW("DURATION",II)["W":"WEEKS",1:"DAYS")_")"
 .S LINE=LINE+1 D ADDITEM^PSOERX1A(.LINETXT,"          *Duration: ",TDUR,1,50) D SET^VALM10(LINE,LINETXT) S LINETXT=""
 I $G(PSONEW("CONJUNCTION",II))]"" D
 .S LINE=LINE+1 D ADDITEM^PSOERX1A(.LINETXT,"       *Conjunction: ",$S(PSONEW("CONJUNCTION",II)="T":"THEN",PSONEW("CONJUNCTION",II)="X":"EXCEPT",1:"AND"),1,50) D SET^VALM10(LINE,LINETXT) S LINETXT=""
 Q
FMD ;
 Q:$G(PSONEW("DOSE",II))']""  S MIG=PSONEW("DOSE",II)
 I $E(MIG,1)=".",$G(PSONEW("DOSE ORDERED",II)) S MIG="0"_MIG
 F SG=1:1:$L(MIG," ") D
 .I $L(LINETXT_" "_$P(MIG," ",SG))>80 D  Q
 ..S LINE=LINE+1 D ADDITEM^PSOERX1A(.LINETXT," ","",20,1)
 ..D ADDITEM^PSOERX1A(.LINETXT," ",$P(MIG," ",SG),$L(LINETXT),$L($P(MIG," ",SG))+1)
 .D ADDITEM^PSOERX1A(.LINETXT," ",$P(MIG," ",SG),$L(LINETXT),$L($P(MIG," ",SG))+1)
 D SET^VALM10(LINE,LINETXT) S LINETXT=""
 I $G(UNITS)]"" D
 .I $L(LINETXT_" ("_UNITS_")")>80 D  Q
 ..S LINE=LINE+1,LINETXT=""
 ..D ADDITEM^PSOERX1A(.LINETXT," ","",20,1)
 ..D ADDITEM^PSOERX1A(.LINETXT," ("_UNITS_")",22,50)
 ..D SET^VALM10(LINE,LINETXT) S LINETXT=""
 K DS,MIG,SG
 ; Consider invoking this as a future enhancement.
 ;I '$G(PSONEW("DOSE ORDERED",II)),$P($G(^PS(55,PSODFN,"LAN")),"^") D LAN^PSOORED5
 Q

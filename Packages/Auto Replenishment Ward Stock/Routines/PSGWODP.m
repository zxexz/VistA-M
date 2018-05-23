PSGWODP ;BHAM ISC/PTD,CML-Print an On-Demand Report by Date/AOU ;Oct 17, 2017@14:48
 ;;2.3;Automatic Replenishment/Ward Stock;**18,19**;4 JAN 94;Build 45
 ;
BDT S %DT="AEXT",%DT("A")="BEGINNING date for report: " D ^%DT K %DT G:Y<0 END S BDT=Y,BDT=BDT-.00001
 N PSGWPFLG S PSGWPFLG=0 I $$GET^XPAR("ALL","PSGW_WS_LVL_ON") S PSGWPFLG=1 ; Patch PSGW*2.3*19 are changes active
EDT S %DT="AEXT",%DT(0)=BDT,%DT("A")="ENDING date for report: " D ^%DT K %DT G:Y<0 END S EDT=Y S:EDT'["." EDT=EDT+.24
 I PSGWPFLG S EDT=EDT+.00001
EN D SEL^PSGWUTL1 G:'$D(SEL) END G:SEL="I" EN2
ASKAOU ;
 F JJ=0:0 S DIC="^PSI(58.1,",DIC(0)="QEAM" D ^DIC K DIC Q:Y<0  S AOULP(+Y)=""
 I '$D(AOULP)&(X'="^ALL") G END
 I X="^ALL" F AOU=0:0 S AOU=$O(^PSI(58.1,AOU)) Q:'AOU  S AOULP(AOU)=""
EN2 G:'$D(AOULP) END W !!,"The right margin for this report is 80.",!,"You may queue the report to print at a later time.",!!
DEV K %ZIS,IOP S %ZIS="QM",%ZIS("B")="" D ^%ZIS I POP W !,"NO DEVICE SELECTED OR REPORT PRINTED!" G END
 I $D(IO("Q")) K IO("Q") S ZTRTN="ENQ^PSGWODP",ZTDESC="Print On-Demand Request" S:$D(AOULP) ZTSAVE("AOULP(")="" F G="BDT","EDT","SEL","IGDA" S:$D(@G) ZTSAVE(G)=""
 I  D ^%ZTLOAD,HOME^%ZIS K ZTSK G END
 U IO
 ;
ENQ ;ENTRY POINT WHEN QUEUED
 I '$D(PSGWPFLG) N PSGWPFLG S PSGWPFLG=0 I $$GET^XPAR("ALL","PSGW_WS_LVL_ON") S PSGWPFLG=1 ; Patch PSGW*2.3*19 are changes active
 K ^TMP("PSGWOD",$J) S AOU=0
AOU I $D(AOULP) S AOU=$O(AOULP(AOU)) I 'AOU D PRINT^PSGWODPR G DONE
 I '$D(AOULP) S AOU=$O(^PSI(58.1,AOU)) I 'AOU D PRINT^PSGWODPR G DONE
DRUG ;LOOP THROUGH DRUGS FOR AOU
 S DRGDA=0
DRGLP S DRGDA=$O(^PSI(58.1,AOU,1,DRGDA)) G:'DRGDA AOU D OD G DRGLP
 ;
OD ;ON DEMAND REQUESTS
 Q:'$O(^PSI(58.1,AOU,1,DRGDA,5,0))  S ODA=0
ODLP S ODA=$O(^PSI(58.1,AOU,1,DRGDA,5,ODA)) Q:'ODA  S LOC=^(ODA,0),ODT=$P(LOC,"^") I (ODT<BDT)!(ODT>EDT) G ODLP
 S QD=$P(LOC,"^",2),EDUZ=$S($P(LOC,"^",3)'="":$P(LOC,"^",3),1:"NOT LISTED"),DRGNM=$P(^PSI(58.1,AOU,1,DRGDA,0),"^"),STAN=$S($P(^(0),"^",3)="":0,$P(^(0),"^",3)>DT:0,1:1)
 S LEDUZ=$S(+$P(LOC,"^",5):$P(LOC,"^",5),1:"N/A"),LEDT=$S(+$P(LOC,"^",6):$P(LOC,"^",6),1:"N/A") D BACKORD
 I '$O(^PSDRUG(DRGNM,0)) S DIK="^PSI(58.1,"_AOU_",1,",DA=DRGDA,DA(1)=AOU D ^DIK K DIK G ODLP
 I PSGWPFLG D
 . N IEN S DRGNAME=$$GET1^DIQ(50,DRGNM,.01),IEN=DRGDA_","_AOU_","
 . S ^TMP("PSGWOD",$J,"ARCHSTOCK",$P(ODT,"."),AOU,EDUZ,ODT,DRGNAME)=$$GET1^DIQ(58.11,IEN,1)
 S DRGNAME=$P(^PSDRUG(DRGNM,0),"^"),^TMP("PSGWOD",$J,$P(ODT,"."),AOU,EDUZ,ODT,DRGNAME)=QD_"^"_STAN_"^"_DRGDA_"^"_BOTOT_"^"_LEDUZ_"^"_LEDT G ODLP
DONE I $E(IOST)'="C" W @IOF
 I $E(IOST)="C" D:'QFLG SS^PSGWUTL1
END K EDITDT,PREV,ZTSK,^TMP("PSGWOD",$J),AOULP,JJ,ANS,AOU,BDT,DRGDA,DRGNAME,DRGNM,EDT,EDUZ,J,LEDT,LEDUZ,LOC,ODA,ODT,PGCT,QD,STAN,PSGDA,ADT,CAT,PSGWDT,PSGWODT,PSGWAOU,AMISFL,KEY,ODTM,TMDT,%,%I,%H,DA,G,D,DIE
 K %DT,%W,C,SEL,IGDA,D0,D1,D2,DI,DIC,DIYS,DLAYGO,DQ,IO("Q"),PSGWV,BOTOT,X,Y,BO,QFLG,PSGWDUZ,PRTFLG,PSGWDT,PSGWCAT,BON,ALL,BCFLG,NEWI,PSGDR,PSGWADT,PSGWD,PSGWDN,PSGWPFLG D ^%ZISC
 S:$D(ZTQUEUED) ZTREQ="@" Q
BACKORD ;TOTAL ANY BACKORDERS
 S X=DRGNM,BOTOT=0,DIC="^PSI(58.3,",DIC(0)="" D ^DIC Q:Y<0  S BO=+Y F J=0:0 S J=$S($D(^PSI(58.3,BO,1,AOU,1,J)):$O(^(J)),1:"") Q:'J  S:$S($P(^(J,0),"^",5)="":1,1:0) BOTOT=BOTOT+$P(^(0),"^",2)
 Q

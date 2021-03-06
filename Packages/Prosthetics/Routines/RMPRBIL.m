RMPRBIL ;PHX/RFM/JLT-PROSTHETIC BILLINGS ;8/29/1994
 ;;3.0;PROSTHETICS;**44,55,69,86,92**;Feb 09, 1996
 ;
 ;WLC 3/02/2004 patch #86 - Encapsulation of IB
 ;
 ;RVD 4/29/02 patch #69 - add HCPCS and Short Description in the report.
 ;                        add ICD-9 and description.
 ;                        screen report for station.
 ;
 ;AAC 08/04/04 Patch 92 - Code Set Versioning (CSV)
 ;                      - Used API=ICDDX^ICDCODE to replace direct calls to global ICD9(80)
 ;
 ;DBIA # 3990 - for routine ICDDX^ICDCODE for Patch 92
 ;DBIA # 3823 - for routine INSUR^IBBAPI for Patch 92
 ;
 K ^TMP($J)
 N RMI,HDR2 S HDR2=0
 D HOME^%ZIS,DIV4^RMPRSIT G:$D(X) EXIT W !! S %DT("A")="Start With Delivery Date: ",%DT="AEPX" D ^%DT S RMPRBDT=Y G:Y<0 EXIT
 S %DT("A")="End With Delivery Date: ",%DT="AEX" D ^%DT I RMPRBDT>Y W !,$C(7),"Invalid Date Range Selection!!" G RMPRBIL
 S RMPREDT=Y G:Y<0 EXIT S Y=RMPRBDT D DD^%DT S RMPRX=Y,Y=RMPREDT D DD^%DT S RMPRY=Y
 S %ZIS="MQ" K IOP D ^%ZIS G:POP EXIT
 I '$D(IO("Q")) U IO G PRINT
 K IO("Q") S ZTRTN="PRINT^RMPRBIL",ZTIO=ION,ZTSAVE("RMPRBDT")="",ZTSAVE("RMPREDT")="",ZTSAVE("RMPRX")="",ZTSAVE("RMPRY")="",ZTSAVE("RMPR(""STA"")")="",ZTDESC="PRINT MAS BILLING" D ^%ZTLOAD W:$D(ZTSK) !,"REQUEST QUEUED!" H 1 G EXIT
PRINT S X1=RMPRBDT,X2=-1 D C^%DTC S RO=X,RP=0,PAGE=1,RMPRCOUN=0 I IOST["C-" D WAIT^DICD W !,"...PREPARING TO PRINT PROSTHETIC BILLING..." H 1
 F  S RO=$O(^RMPR(660,"CT",RO)) Q:RO'>0!(RO>RMPREDT)  F  S RP=$O(^RMPR(660,"CT",RO,RP)) Q:RP'>0  D CK
 S RMPT="",RMPREND="" F  S FL=1 S RMPT=$O(^TMP($J,RMPT)) Q:RMPT=""!(RMPREND=1)  F RP=0:0 S RP=$O(^TMP($J,RMPT,RP)) Q:RMPREND=1!(RP'>0)  D WRI
 I $D(RMPREDT)&(RMPRCOUN=0) W @IOF D HDR W !!,"NO SELECTIONS MADE DURING THIS DATE RANGE!!"
 I $D(RMPREDT),RMPRCOUN>0,'$D(RMPREND) W !!?32,"END OF REPORT" H 1
EXIT S:'$D(RMPREND) RMPREND="" I $E(IOST)["C"&($Y<20) F  W ! Q:$Y>20
 I $D(RMPREDT),RMPREND'=1,'$D(DTOUT),'$D(DUOUT),$E(IOST)["C",'$D(RMPRFLL) S DIR(0)="E" D ^DIR
EX K ROI,RMPRFLL,IBINS,J,RMPREND,DFN,DGCRINS,DGCRDD,DGCROUTP,DGCRINDT,DUOUT,DIR,RO,RP,RR,RMPRFLAG,FL,IZ,PAGE,RMPRY,RMPRITEM,RMPRCOUN,RMPRX,RMPRBDT,RMPREDT,RMPT,%DT,X,Y,IT,ZTSK,^TMP($J)
 K RMHCIEN,RMHCPCS,RMHCDES,RMPRICC,RMPRICD,RMPRIC9,RMPRA,RMPRCOD,RMPRDAT,RMPRERR,RMPRERZ
 D ^%ZISC,KVAR^VADPT Q
CK ;
 ; Patch 92 - line below modified from original
 S RMPRERZ=$S('$D(^RMPR(660,RP,"AM")):1,$P(^RMPR(660,RP,0),U,9)="":1,$P(^(0),U,12)="":1,$P(^(0),U,6)="":1,$P(^(0),U,14)="V":1,$P(^(0),U,2)="":1,$P(^(0),U,15)="*":1,$P(^("AM"),U,3)'=4:1,1:0) Q:RMPRERZ'>0
 ;patch #69 (screen for station).
 I $P($G(^RMPR(660,RP,0)),U,10)'=RMPR("STA") Q
 K RMI S DFN=$P(^RMPR(660,RP,0),U,2) K RMI Q:'$$INSUR^IBBAPI(DFN,RO,"RB",.RMI,"*")
 S RMPRCOUN=RMPRCOUN+1,RMPT=$P(^DPT($P(^RMPR(660,RP,0),U,2),0),U,1),^TMP($J,RMPT,RP)=""
 Q
WRI I PAGE=1,'$D(RMPRFLG),$E(IOST)["C" W @IOF D HDR1
 I $Y>(IOSL-8),$E(IOST)["C",$D(RMPRFLAG) W ! S DIR(0)="E" D ^DIR S:Y=""!(Y=0) RMPREND=1 Q:Y=""  S:Y<1 RMPRFLL=1 Q:Y=0  D HDR
 I $Y>(IOSL-8) D HDR
 W ! I FL W !,$E(RMPT,1,20),?22,$E($P(^DPT($P(^RMPR(660,RP,0),U,2),0),U,9),6,9) S DFN=$P(^RMPR(660,RP,0),U,2) K RMI S X=$$INSUR^IBBAPI(DFN,,"RBA",.RMI,"*") I X>0 D DISP E  D ERRORD S FL=0 W !!
 S RMPRA=^RMPR(660,RP,0)
 W $$DAT1^RMPRUTL1($P($P(RMPRA,U,1),".",1))
 ;DELIVERY DATE SORT ON CT X-REF
 W ?9,$$DAT1^RMPRUTL1($P($P(RMPRA,U,12),".",1))
 I $P(RMPRA,U,4)="X" W ?17,"*"
 ;
ITE ;
 ;added by patch #69
HCPCS S (RMHCPCS,RMHCDES)="" K RMHCIEN
 I $D(^RMPR(660,RP,1)) S RMHCIEN=$P(^RMPR(660,RP,1),U,4) D
 .I $G(RMHCIEN) S RMHCPCS=$P($G(^RMPR(661.1,RMHCIEN,0)),U,1),RMHCDES=$P($G(^RMPR(661.1,RMHCIEN,0)),U,2)
 ;
 ; Patch 92 - Code Set Versioning changes below
 ; AAC - 08/04/04
 ;
ICD9 ;
 I $P(^RMPR(660,RP,0),U,4)'="X" D
 .W ?19,$E($P(^PRC(441,$P(^RMPR(661,$P(^RMPR(660,RP,0),U,6),0),U,1),0),U,2),1,30)
 .W ?52,"QTY: ",$P(^RMPR(660,RP,0),U,7),?59,"TOTAL COST: ",?70,$J($FN($P(^RMPR(660,RP,0),U,16),"P",2),9)
 .W !,"HCPCS: ",RMHCPCS,?19,RMHCDES
 .;
 E  D
 .S RMPRITEM=$E($P(^PRC(441,$P(^RMPR(661,$P(^RMPR(660,RP,0),U,6),0),U,1),0),U,2),1,30)
 .I $D(^RMPR(660,RP,1)) W ?19,$E($P(^(1),U,2),1,30)
 .I $D(^RMPR(660,RP,1)),$P(^(1),U,2)="" W ?19,RMPRITEM
 .W ?52,"QTY: ",$P(^RMPR(660,RP,0),U,7),?59,"TOTAL COST: ",?70,$J($FN($P(^RMPR(660,RP,0),U,16),"P",2),9)
 .I '$D(^RMPR(660,RP,1)) W ?19,RMPRITEM
 .W !,"HCPCS: ",RMHCPCS,?19,RMHCDES
 ;
 S (RMPRICD,RMPRIC9,RMPRCOD)="" S RMPRERR=0
 S RMPRDAT=$P($G(^RMPR(660,RP,0)),U,1)
 I $D(^RMPR(660,RP,10)) S RMPRIC9=$P(^RMPR(660,RP,10),U,8)
 ;
 ; RMPRIC9 = Suspense ICD9 Code used in API parameter
 ; RMPRDAT = Entry Date used in API parameter
 ;
 I RMPRIC9'=""  D
 .S RMPRICD=$$ICDDX^ICDCODE(RMPRIC9,RMPRDAT)
 .S RMPRERR=$P(RMPRICD,U,1)
 .I RMPRERR<0 W !,"ICD-9 Message: ",$P(RMPRICD,U,2)
 W !,"ICD-9 Code: "
 I $G(RMPRICD)'="" W $P(RMPRICD,U,2),?19,$E($P(RMPRICD,U,4),1,55) I $P(RMPRICD,U,10)'>0 W " ","** Inactive ** Date: " S Y=$P(RMPRICD,U,12) D DD^%DT W Y
 ; Above Patch 92 code  
 ; End of Patch 92
 ;
 ; I $D(^RMPR(660,RP,"DES",0)) S RR=0 F  S RR=$O(^RMPR(660,RP,"DES",RR)) Q:RR'>0  W !,?4,$P(^RMPR(660,RP,"DES",RR,0),U)
 W !
 Q
HDR W:$Y>(IOSL-8) @IOF
HDR1 W !,?5,"PATIENT NAME",?22,"SSN",?38," " S Y=RMPRBDT D DD^%DT W Y,"-" S Y=RMPREDT D DD^%DT W Y,?64,"STA ",$$STA^RMPRUTIL,?73,"PAGE ",PAGE
 S HDR2=0,PAGE=PAGE+1,FL=1,$P(IZ,"-",IOM)="",RMPRFLAG=1 W !,IZ
 Q
 ;
ERRORD ; network error message
 I $D(RMI("IBBAPI","INSUR","ERROR")) D HDR W !!,"AN ERROR WITH INSURANCE RETRIEVAL HAS CAUSED THIS OPTION TO BE TERMINATED.  PLEASE TRY THIS REPORT AT A LATER TIME."
 Q
 ;
DISP ; mimics DISP^IBCNS
 Q:'$D(DFN)  D:'$D(IOF) HOME^%ZIS
 D HDR2
 I '$D(RMI) W !,"    No Insurance Information" Q
 ;
 S X="" F  S X=$O(RMI("IBBAPI","INSUR",X)) Q:'X  D D1
 W !
 Q
 ;
D1 N J,Y,Z,CAT,DAT,DAT1 Q:'$D(RMI("IBBAPI","INSUR",X,1))
 W !?3,$E($P(RMI("IBBAPI","INSUR",X,1),U,2),1,10)
 ; extract COB indicator
 S Z="",J=$P(RMI("IBBAPI","INSUR",X,7),U,2)
 S Y=+(RMI("IBBAPI","INSUR",X,7)) W ?16,$P("p^s^t",U,+(RMI("IBBAPI","INSUR",X,7)))
 W ?19,$E(RMI("IBBAPI","INSUR",X,14),1,16)
 S Y=$$GET1^DIQ(355.3,+RMI("IBBAPI","INSUR",X,8)_",",.04)
 W ?37,$E(Y,1,10)
 W ?49,$P(RMI("IBBAPI","INSUR",X,12),U,2)
 S DAT=RMI("IBBAPI","INSUR",X,10)
 W:DAT'="" ?57,$E(DAT,4,5)_"/"_$E(DAT,6,7)_"/"_$E(DAT,2,3)
 S DAT1=RMI("IBBAPI","INSUR",X,11)
 W:DAT1'="" ?67,$E(DAT1,4,5)_"/"_$E(DAT1,6,7)_"/"_$E(DAT1,2,3)
 I +RMI("IBBAPI","INSUR",X,9)=0 W ?75," *WNR*"
 ; removed for date parameter.
 ;S Z="" F Y=15:1:17 D
 ;. S CAT=$P("r^o^i",U,(Y-14))
 ;. S:+RMI("IBBAPI","INSUR",X,Y)=1 Z=Z_CAT
 ;W ?75,Z
 Q
HDR2 ;
 W !,?2,"Insurance",?15,"COB",?19,"Subscriber ID",?37,"Group",?49,"Holder",?57,"Effective",?67,"Expires"
 N Z S $P(Z,"=",78)="" W !?2,Z
 S HDR2=0
 Q
 ;

QAOSPNAM ;HISC/DAD-ATTENDING & RESIDENT/PROVIDER REPORT ;6/17/93  11:13
 ;;3.0;Occurrence Screen;;09/14/1993
 K DIR S DIR(0)="SOM^C:Code;N:Name",DIR("A")="Sort report by"
 S DIR("?",1)="",DIR("?")="     Enter the desired sorting method."
 S DIR("B")="Name"
 D ^DIR G:$D(DIRUT) EXIT S QAOSSORT=Y
 K %ZIS,IOP S %ZIS="QM" W ! D ^%ZIS G:POP EXIT
 I $D(IO("Q")) D  G EXIT
 . S ZTRTN="ENTSK^QAOSPNAM",ZTSAVE("QAOSSORT")=""
 . S ZTDESC="Attending & resident/provider report"
 . D ^%ZTLOAD
 . Q
ENTSK ;
 S PAGE=1,%DT="",X="T" D ^%DT X ^DD("DD") S TODAY=Y
 K ^TMP($J,"QAOSPNAM"),UNDL S $P(UNDL,"-",80)="-"
 F QAOSD0=0:0 S QAOSD0=$O(^QA(741,QAOSD0)) Q:QAOSD0'>0  D
 . S QAOSZERO=$G(^QA(741,QAOSD0,0)) Q:QAOSZERO=""
 . F QA=9,10 D
 .. S QAOSCODE=+$P(QAOSZERO,"^",QA) Q:QAOSCODE'>0
 .. S QAOSNAME=$P($G(^VA(200,QAOSCODE,0)),"^")
 .. S:QAOSNAME="" QAOSNAME=QAOSCODE
 .. I QAOSSORT="N" D SET(QAOSNAME,QAOSCODE,QA-7)
 .. E  D SET(QAOSCODE,QAOSNAME,QA-7)
 .. Q
 . Q
 U IO D HEAD
 I '$D(^TMP($J,"QAOSPNAM")) W !!,"NO DATA FOUND FOR THIS REPORT" G EXIT
 S QAOSSUB="",QAOSQUIT=0
 F  S QAOSSUB=$O(^TMP($J,"QAOSPNAM",QAOSSUB)) Q:QAOSSUB=""!QAOSQUIT  D
 . S QAOSDATA=^TMP($J,"QAOSPNAM",QAOSSUB)
 . I QAOSSORT="N" S QAOSNAME=QAOSSUB,QAOSCODE=$P(QAOSDATA,"^")
 . E  S QAOSNAME=$P(QAOSDATA,"^"),QAOSCODE=QAOSSUB
 . W !,QAOSNAME,?35,$J(QAOSCODE,9)
 . W ?53,$P(QAOSDATA,"^",2),?71,$P(QAOSDATA,"^",3)
 . I $Y>(IOSL-6) D:$E(IOST)="C" PAUSE Q:QAOSQUIT  D HEAD
 . Q
EXIT ;
 W ! D ^%ZISC
 K %DT,%ZIS,DIR,DIRUT,DTOUT,DUOUT,PAGE,POP,QA,QAOSD0,QAOSDATA,QAOSCODE
 K QAOSNAME,QAOSQUIT,QAOSSUB,QAOSZERO,TODAY,UNDL,X,Y,ZTRTN,ZTDESC
 K QAOSSORT,^TMP($J,"QAOSPNAM")
 S:$D(ZTQUEUED) ZTREQ="@"
 Q
SET(SUBSCRPT,DATA,PIECE) ;
 S $P(^TMP($J,"QAOSPNAM",SUBSCRPT),"^")=DATA
 S $P(^TMP($J,"QAOSPNAM",SUBSCRPT),"^",PIECE)="X"
 Q
PAUSE ;
 K DIR S DIR(0)="E" D ^DIR K DIR S QAOSQUIT=$S(Y'>0:1,1:0)
 Q
HEAD ;
 W:(PAGE>1)!($E(IOST)="C") @IOF
 W !!?29,"PRACTITIONER CODE LIST",?68,TODAY,!?68,"PAGE: ",PAGE
 S PAGE=PAGE+1 D EN6^QAQAUTL
 W !,"PRACTITIONER",?35,"CODE NUMBER",?49,"ATTENDING",?63,"RESIDENT/PROVIDER"
 W !,UNDL,!
 Q

DGBTEE ;ALB/SCK - BENEFICIARY TRAVEL ENTER/EDIT; 12/3/92@1600 ; 7/2/14 1:17pm
 ;;1.0;Beneficiary Travel;**2,14,20,21,25,30**;September 25, 2001;Build 4
 Q
SCREEN ;
 ;
 I '$D(^DGBT(392,DGBTDT,"D"))&('$D(^DGBT(392,DGBTDT,"T"))) S DGBTSP2M=1 D STUFF^DGBTE1 K DGBTSP2M ;dbe patch DGBT*1.0*25 - added for conversion from SP to M during claim edit
 D SCREEN^DGBTEE1 Q:$G(DGBTTOUT)=-1!($G(DGBTTOUT)=1)  Q:'$D(^DGBT(392,DGBTDT,0))
 ;  The following section of code moved to DGBTEE2 for space problems
 D STUFF^DGBTEE2
MILES ;  get miles between dep. and dest. using function call to DGBTUTL
 ;
 K X,DGBTREC S (DGBTOWRT,DGBTML,DGBTMLT)=""
 I DGBTFR4]""&((DGBTACCT=4)!(DGBTACCT=5)) I $D(^DGBT(392.1,"ACS",DGBTFR4,+VAPA(5))) D
 . S X=$O(^(+VAPA(5),0)) ; naked ref. refers to file #392.1, "ACS", city.  Full reference on line MILES+2^DGBTEE, ^DGBTE(392.1,"ACS",DGBTFR4,+VAPA(5)
 . ;  function $$miles passes city's record# and div name to function, mileage value is returned
 . I X'="" S DGBTREC=X,DGBTML=$$MILES^DGBTUTL(DGBTREC,DGBTDV1),DGBTOWRT="ROUND TRIP" K X
 S (DGBTMAL,DGBTFAB,DGBTME,DGBTCP,DGBTFLAG,DGBTDCV,DGBTDE,DGBTDCM,DGBTDPV,DGBTDPM)=0
DIE1 ;  stuff from,to address, meals, ferry's/bridges
 ;
 Q:'$D(^DGBT(392,DGBTDT,0))
 ;
 S DIE="^DGBT(392,",DA=DGBTDT,DR=$S($G(DGBTACCT)=4:"42//"_$G(DGBTAP),$G(DGBTACCT)=5:"43;S DGBTCP=X;42//"_$G(DGBTAP),1:"44")
 D ^DIE I X=""!(X="^") S DGBTTOUT=-1 Q
 ;
 S DR="21////^S X=DGBTFR1;22////^S X=DGBTFR2;23////^S X=DGBTFR3;24////^S X=DGBTFR4;25////^S X=DGBTTO1;26////^S X=DGBTTO2;27////^S X=DGBTTO3;28////^S X=DGBTTO4" ;;34////^S X=DGBTMAL;35////^S X=DGBTFAB"
 D ^DIE I X=""!(X="^") S DGBTTOUT=-1 Q
 ;
 I DGBTACCT=4!(DGBTACCT=5) D
 . W !!,"Please enter mileage obtained from BT Dashboard ..."
 .S DGBTRMK=$S($D(DGBTREC):$$DICLKUP^DGBTUTL(DGBTREC,DGBTDV1,4),1:"") I $D(DGBTDEF),DGBTDEF S DGBTRMK="DEFAULT MILEAGE USED"
 .I DGBTRMK]"" W !,*7,"MILEAGE REMARKS: ",DGBTRMK,!
 ;
EDIT ;  display trip type, mileage
 I ($G(DGBTACCT)=4)!($G(DGBTACCT)=5) D  Q:$G(DGBTTOUT)=-1  ;20
 .I $G(CHZFLG) N OTRIPTYP S OTRIPTYP=$$GET1^DIQ(392,DGBTDT,31,"I")
 .S DR="32//"_DGBTML_";S DGBTML=X;31//"_DGBTOWRT_";S DGBTOWRT=X;" D ^DIE I X=""!(X="^") S DGBTTOUT=-1 Q  ;20
 .I ($G(CHZFLG))&($G(OTRIPTYP)'=$$GET1^DIQ(392,DGBTDT,31,"I"))&($G(MONTOT)'="") D
 ..N NTRIPTYP S NTRIPTYP=$$GET1^DIQ(392,DGBTDT,31,"I")
 ..I (OTRIPTYP=1)&(NTRIPTYP=2) D  Q
 ...S $P(MONTOT,U)=$P(MONTOT,U)+1
 ...S $P(MONTOT,U,2)=$P(MONTOT,U,2)-1
 ...S $P(MONTOT,U,3)=$P(MONTOT,U,3)+1
 ..I (OTRIPTYP=2)&(NTRIPTYP=1) D  Q
 ...S $P(MONTOT,U)=$P(MONTOT,U)-1
 ...S $P(MONTOT,U,2)=$P(MONTOT,U,2)+1
 ...S $P(MONTOT,U,3)=$P(MONTOT,U,3)-1
 .S DGBTCCT=$$GET1^DIQ(392,DGBTDT,54,"I")
 .S DIR(0)="Y",DIR("B")=$S($G(DGBTCCT)'="":"YES",1:"NO"),DIR("A")="COMMON CARRIER USED" D ^DIR K DIR I $D(DIRUT) S DGBTTOUT=-1 Q  ;20
 .I 'Y,$D(^DGBT(392,DGBTDT,"C")) S $P(^DGBT(392,DGBTDT,"A"),"^",4)="" F I="B","C"  K ^DGBT(392,DGBTDT,I)
 .I Y D  ;20
 ..K DA,DR,DIE,Y S DIE="^DGBT(392,",DA=DGBTDT,DR="44COMMON CARRIER MODE~R" D ^DIE  I $D(Y) S DGBTTOUT=-1 Q  ;20
 ..K DA,DR,DIE,Y S DIE="^DGBT(392,",DA=DGBTDT I $$UP^XLFSTR($$GET1^DIQ(392,DGBTDT,44))["BUS" S DR="52R" D ^DIE I $D(Y) S DGBTTOUT=-1 Q  ;20
 ..K DA,DR,DIE,Y I $$GET1^DIQ(392,DGBTDT,52)="PASS" S DIE="^DGBT(392,",DA=DGBTDT,DR="53R" D ^DIE I $D(Y) S DGBTTOUT=-1 Q  ;20
 ..N %DT S %DT(0)="-NOW" ;prevents future dates Coder CR 53 for DG*1.0*20
 ..K DA,DR,DIE,Y S DIE="^DGBT(392,",DA=DGBTDT,DR="54//"_$P(DGBTDTE,"@",1)_";55;55.1" D ^DIE I $D(Y) S DGBTTOUT=-1 Q  ;20 PAVEL - DGBT*1*20
 S:DGBTACCT=5&(DGBTCP=1) DGBTMR=DGBTMR1 S DGBTMLT=DGBTOWRT*DGBTML*DGBTMR,DGBTMLT=$J(DGBTMLT,0,2),DR="33///"_DGBTMLT
 D ^DIE I X=""!(X="^") S DGBTTOUT=-1 Q
 I $G(^DGBT(392,DGBTDTI,"C"))="" K ^DGBT(392,DGBTDTI,"C"),DGBTVAR("C")
 ;
DIE2 ;  stuff eligibility data, SC%, acct. type
 ;
 S DIE("NO^")="12345" S:'$D(DGBTCD) DGBTCD=""
 I 'DGBTCORE D
 . S DR="3////"_DGBTELIG_";4////"_DGBTSCP_";5///"_DGBTCD_";6////"_DGBTACTN_";I DGBTACCT=4!(DGBTACCT=5) S Y=""@1"";41;7;@1;I DGBTMLFB=0 S Y=""@2"";34//0;W:'X X S DGBTMAL=X;35//0;W:'X X S DGBTFAB=X;@2"
 I DGBTCORE D
 . S DR(1,392,1)="3////"_DGBTELIG_";4////"_DGBTSCP_";5///"_DGBTCD_";6////"_DGBTACTN_";I DGBTACCT=4!(DGBTACCT=5) S Y=""@1"";41;"
 . S DR(1,392,2)="@3;14;S DGBTCSL=$$AFTER^DGBTCSL(392,D0,X,$G(DGBTPRV)) S:DGBTCSL<1 Y=""@3"" W:DGBTCSL<1 ""   Required"" K DGBTPRV,DGBTCSL;@1;I DGBTMLFB=0 S Y=""@2"";34//0;S DGBTMAL=X;35//0;S DGBTFAB=X;@2"
 ;
 ;DIE3 ;  get most econ. cost
 ;
 D ^DIE K DR I $G(DTOUT)!(X="^") S DGBTTOUT=-1 Q
 ;
 ;check for common carrier
 S DGBTMAF=$G(DGBTFAB)+$G(DGBTMAL)
 S (DGBTCC,DGBTCCAMT,DGBTCCREQ,DGBTCCMODE,DGBTMETC)=0
 S DGBTDCM=$P(MONTOT,"^",4)
 S DGBTDCM=$S(DGBTMLT-DGBTDCM'>0:DGBTMLT,1:DGBTDCM)
 I $D(^DGBT(392,DGBTDTI,"C")) D
 .S DGBTCC=$D(^DGBT(392,DGBTDTI,"C"))          ;was common carrier used
 .S DGBTCCAMT=$$GET1^DIQ(392,DGBTDTI,55)    ; amount of common carrier
 .S DGBTCCREQ=$$GET1^DIQ(392,DGBTDTI,55.1),DGBTCCREQ=$S(DGBTCCREQ="YES":1,1:0)        ;common carrier required - 1=yes,0=no
 .S DGBTCCMODE=$$GET1^DIQ(392,DGBTDTI,44,"I")                      ;common carrier mode of transportation
 .S DGBTMETC=$G(DGBTME)+$G(DGBTMAL)    ;$S($D(DGBTMAL):DGBTMAL,1:0)   ;most enco + meals and lodging S DGBTDCM=$P(MONTOT,"^",4) S DGBTDCM=$P(MONTOT,"^",4) S DGBTMAF=$S(DGBTMLFB:DGBTMAL+DGBTFAB,1:0),DGBTMETC=DGBTME+$S($D(DGBTMAL):DGBTMAL,1:0)
 ;
 ;if CC not required reset most econ to 0
 I $G(DGBTCCREQ) D
 .S FDA(392,DGBTDTI_",",8)=0
 .D FILE^DIE(,"FDA")
 S:$D(DGBTREC) DGBTME=$$DICLKUP^DGBTUTL(DGBTREC,DGBTDV1,3) S:DGBTME="" DGBTME=0 S DR="8//"_DGBTME_";W:'X X S DGBTME=X" D ^DIE I X=""!(X="^") S DGBTTOUT=-1 G EXIT
TCOST ; calculate total cost and monthly cum. deductible
MLFB ;
 ;
 N OWAIV
 S OWAIV=$P(MONTOT,U,5)
 S MONTOT=$$ADDTO(.MONTOT)
 I DGBTACCT'=4&(DGBTACCT'=5) S DGBTPA=DGBTMAF+DGBTME G CONT
 I $D(DGBTMLT) D
 .I DGBTMLT+DGBTMAF'>DGBTMETC S DGBTTC=DGBTMLT+DGBTMAF Q
 .I DGBTMLT+DGBTMAF>DGBTMETC&(DGBTME>0) S DGBTTC=DGBTMETC Q
 .I DGBTME'>0 S DGBTTC=DGBTMLT+DGBTMAF Q
 .E  S DGBTTC=DGBTMETC
 I $G(DGBTCCREQ) S DGBTTC=$G(DGBTTC)+DGBTCCAMT
 I DGBTACCT=5 S DGBTDE=0 S DGBTPA=$S((DGBTMLT+DGBTMAF)'=0:DGBTTC,1:DGBTMETC) ;G CONT
 ;  the following section of code moved to DGBTEE2 for space reasons
 I DGBTACCT'=5 D
 .N DGBTDCVX,XY
 .I $G(CHZFLG) N ODED S ODED=$$GET1^DIQ(392,DGBTDT,9)
 .D DED^DGBTEE2
 .I $P($G(MONTOT),"^",5)'["Y" S DGBTDCV=DGBTDCV1
 .;add by Pavel for patch 20
 .I $G(DGBTCC),$G(DGBTCCREQ),'$G(DGBTMLT) S DGBTDCV=0
 .I $G(DGBTCC),'$G(DGBTCCREQ),$G(DGBTMLT)'>0 S DGBTDCV=0
 .I $G(DGBTCC),'$G(DGBTCCREQ),$G(DGBTME)'>0
 .I $G(DGBTCC),'$G(DGBTCCREQ),$G(DGBTME)>0,$G(DGBTME)'>$G(DGBTMLT) S DGBTDCV=0
 .I $G(DGBTCC),$G(DGBTCCREQ),$G(DGBTDE)'<$G(DGBTMLT) S DGBTDE=DGBTMLT
 .I '$G(DGBTCC),'$G(DGBTCCREQ),$G(DGBTMLT)'>0 S DGBTDCV=0
 .I '$G(DGBTCC),DGBTMLT>DGBTDPV S (DGBTDCV,DGBTDE)=DGBTDPV
 .I ($G(CHZFLG))&($$GET1^DIQ(392,DGBTDT,9)=0)&($P($G(MONTOT),U,5)["Y") S (DGBTDCV,DGBTE)=0
 .;dbe patch DGBT*1.0*25 - modified the next line to use the total deductible for the month, MONTOT piece 4
 .I (+$P($G(MONTOT),U,4)<18)&((+$P($G(MONTOT),U,4)+DGBTDCV)>18)&(OWAIV'["Y")&('$G(CHZFLG)) S DGBTDCV=18-$P(MONTOT,U,4),$P(MONTOT,U,5)="NO" ; RFE 12/5/12
 .I (+$G(CHZFLG)&(($P($G(MONTOT),U,7)+DGBTDCV)>18)) S DGBTDCV=18-$P(MONTOT,U,7),$P(MONTOT,U,5)="NO" ; RFE 12/5/12 ;*30
 .I (+$P($G(MONTOT),U,1)>6)!(+$P($G(MONTOT),U,4)>18)!($P($G(MONTOT),U,5)["Y")&('$G(CHZFLG)) S DGBTDCV=0 ; Added ELSE RFE 12/5/12
 .I $$DENIED(DGBTDT) S DGBTDCV=0
 .I $G(CHZFLG)=0 S ($P(MONTOT,U,4),$P(MONTOT,U,7))=$P(MONTOT,U,4)+DGBTDCV
 .S DGBTOTHER=$$GET1^DIQ(392,DGBTDT,43.1,"I")
 .I $G(DGBTNSC) S DGBTDCV=0
 .I $G(DGBTOTHER)=11 S DGBTDCV=0
 .I $G(DGBTOTHER)=12 S DGBTDCV=0
 .I $G(DGBTOTHER)=13 S DGBTDCV=0
 .S XY=$S(DGBTDCV>99:"99.00",1:DGBTDCV)
 .N FDA
 .S FDA(392,DGBTDT_",",9)=XY ;Input transform for field 9 is set to max 99
 .S FDA(392,DGBTDT_",",56)="M"
 .D FILE^DIE(,"FDA")
 .W !,"DEDUCTIBLE AMOUNT: "_DGBTDCV_"// "_XY    ;,"   ",$S($G(DGBTREF):"",1:$G(DGBTDCVX))
 .S DGBTDCV=XY
 .S DGBTDE=DGBTDCV
 .I ($G(CHZFLG))&($G(ODED)'=DGBTDE)&($G(MONTOT)'="") D
 ..S $P(MONTOT,U,4)=$P(MONTOT,U,4)+DGBTDE
 ..S $P(MONTOT,U,4)=$P(MONTOT,U,4)-ODED
CONT ;
 D CONT^DGBTCE1 Q
EXIT ;
 K DGBTDV1,DGBTRMK Q
  ;
DENIED(DGBTDT) ;check for a denied claim
 ;
 N DENIED
 S DENIED=$$GET1^DIQ(392,DGBTDT,45.2,"I")
 ;
 Q DENIED
ADDTO(MONTOT) ;this will add the current trip to the total trips for the month.
 ;
 N TRIPTYP
 I CHZFLG=1 Q MONTOT
 I $D(^DGBT(392,DGBTDT,"M")),$P(^("M"),"^")=1 S TRIPTYP=1
 E  S TRIPTYP=2
 I TRIPTYP=1 S $P(MONTOT,"^",1)=$P(MONTOT,"^",1)+1
 I TRIPTYP=2 S $P(MONTOT,"^",1)=$S($P(MONTOT,"^",1)<6:$P(MONTOT,"^",1)+1,1:$P(MONTOT,"^",1)+2)
 ;S $P(MONTOT,"^",1)=$S(TRIPTYP=1:$P(MONTOT,"^",1)+1,1:$P(MONTOT,"^",1)+2)     ;add current trip to total for month
 I TRIPTYP=1 S $P(MONTOT,U,2)=$P(MONTOT,U,2)+1
 I TRIPTYP=2 S $P(MONTOT,U,3)=$P(MONTOT,U,3)+1
 S $P(MONTOT,"^",6)=$S(TRIPTYP=1:$P(MONTOT,"^",6)+1,1:$P(MONTOT,"^",6)+2)
 I ($P(MONTOT,U,5)'["Y")&($P(MONTOT,U)>6) S $P(MONTOT,U,5)="YES"
 I ($P(MONTOT,U,5)'["Y")&($P(MONTOT,U,2)>18) S $P(MONTOT,U,5)="YES"
 Q MONTOT
 ;

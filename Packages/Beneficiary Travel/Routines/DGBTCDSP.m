DGBTCDSP ;;ALB/BLD-BENEFICIARY TRAVEL CLAIM DISPLAY - SPECIAL MODE;02/03/2012
 ;;1.0;Beneficiary Travel;**20,21,22**;FEBRUARY 4 2012;Build 5
 Q
SCREEN ;this will display the information screen at the end of a claim and 
 N TOSTATE,DPSTATE,Z,INFOLINE
 S:$G(INFOLINE)="" INFOLINE=1
 S:$G(DGBTDT)="" DGBTDT=$G(DGBTDTI)
 I $D(DGBTSP)'>1 D BLDARRY(.DGBTSP)
 S DGBTVAR(0)=^DGBT(392,DGBTDT,0)
 S DPSTATE=$O(^DIC(5,"B",DGBTSP("STATE OF DEPARTURE"),"")),DPSTATE=$P(^DIC(5,DPSTATE,0),"^",2)
 S TOSTATE=$O(^DIC(5,"B",DGBTINST("STATE"),"")),TOSTATE=$P(^DIC(5,TOSTATE,0),"^",2)
 S DGBTACCT=$S($D(DGBTSP("ACCOUNT")):DGBTSP("ACCOUNT"),1:0)
 I DGBTACCT=0 W !!,*7,">> WARNING! No ACCOUNT TYPE for this claim, Please correct through Claim Enter/Edit!" G QUIT^DGBTEND
 W @IOF
 W !?18,"Beneficiary Travel Claim Information <Display>"
 W !!,?2,"Claim Date: ",$S($G(DGBTDTE)'="":DGBTDTE,1:VADATE("E")) W:$G(DGBTINST("DIVISION"))'="" ?40,"Division: ",$G(DGBTINST("DIVISION"))
 D PID^VADPT6
 W !!,"Name: ",VADM(1),?40,"PT ID: ",VA("PID"),?64,"DOB: ",$P(VADM(3),U,2)
 S (DGBTFCTY,DGBTTCTY)=""
FROM W !!," Depart From: ",$G(DGBTSP("PLACE OF DEPARTURE"))
 W ?46,"To: ",$G(DGBTINST("INST NAME"))
 W !?14,DGBTSP("CITY OF DEPARTURE")_", "_DPSTATE_" "_DGBTSP("ZIP CODE/DEPARTURE")
 I $G(DGBTINST("ADDRESS1"))'="" W ?50,DGBTINST("ADDRESS1")
 W !,?50,$G(DGBTINST("CITY"))_", "_TOSTATE_"  "_$G(DGBTINST("ZIP CODE"))
 ;
ELIG W !!,"Eligibility: " W:$P(DGBTVAR(0),U,3) $P(^DIC(8,$P(DGBTVAR(0),U,3),0),U) W ?45,"SC%: ",$S($P(DGBTVAR(0),U,4)="":0,1:$P(DGBTVAR(0),U,4))
 ;
ACCT W !!,"Account: ",$G(DGBTSP("ACCOUNT"))
 ;question added for DG*1.0*20 E18
 W !!,"Mode/Trans: ",$G(DGBTSP("MODE OF TRANS"))
 ;
 W ?45,"One Way/Round Trip: "
 S X=$S($G(DGBTSP("RT/ONE WAY"))="R":"ROUND TRIP",1:"ONE WAY") W ?67,$J(X,11)
 ;
 W !,"Carrier: ",$$GET1^DIQ(392,DGBTDT_",",71) ;dbe patch DGBT*1*22 - modified to use vendor ien
 ;
 W ?45,"Total Miles Traveled: "
 S X=$G(DGBTSP("TOTAL MILES")),X2="2S" D COMMA^%DTC W ?67,X
 ;
 W !,"Invoice: ",$G(DGBTSP("INVOICE NUMBER"))
 ;
 W ?45,"Base Rate Fee: "
 S X=$G(DGBTSP("BASE RATE FEE")),X2="2$" D COMMA^%DTC W ?67,X
 ;
 W !,"Date Received: ",$G(DGBTSP("DT INVOICE REC"))
 ;
 W ?45,"Mileage Fee: "
 S X=$G(DGBTSP("MILEAGE FEE")),X2="2$" D COMMA^%DTC W ?67,X
 ;
 W !,"Pre-Authorized: ",$G(DGBTSP("PRE-AUTHORIZED"))
 ;
 W ?45,"No-Show/No Load Fee: "
 S X=$G(DGBTSP("NO SHOW")),X2="2$" D COMMA^%DTC W ?67,X
 ;
 S PAYMENT=$$GET1^DIQ(392,DGBTDT,85)
 W !,"Payment: ",$S($G(PAYMENT)="YES":"APPROVED",$G(DGBTSP("AUTHORIZED"))="YES":"APPROVED",1:"DENIED")
 ;
 W ?45,"Wait Time Fee: "
 S X=$G(DGBTSP("WAIT TIME")),X2="2$" D COMMA^%DTC W ?67,X
 ;
 ;;changing auth. person to field 12 of file 392 - dbe patch DGBT*1*21
 W !,"Auth. Person: ",$$GET1^DIQ(392,DGBTDT_",",12)
 ;
 W ?45,"Extra Crew Fee: "
 S X=$G(DGBTSP("EXTRA CREW")),X2="2$" D COMMA^%DTC W ?67,X
 ;
 W !  ;,"Reason for Denial: "   ;part of E11 will be added at that time
 ;
 W ?45,"Equipment Fee: "
 S X=$G(DGBTSP("SP EQUIP")),X2="2$" D COMMA^%DTC W ?67,X
 ;
 W !,?45,"Total Invoice Amount: "
 S X=$G(DGBTSP("TOTAL INVOICE")),X2="2$" D COMMA^%DTC W ?67,X
 ;
 W !!,"Remarks: ",$G(DGBTSP("SP MODE OTHER REMARKS"))
 ;
 I INFOLINE D END Q
 ;R !!,"PRESS RETURN TO CONTINUE: ",X
 I 'INFOLINE K DGBTSP,DGBTCMTY ;D QUIT^DGBTEND,DISPLAY^DGBTR Q
 ;D DISPLAY^DGBTR
 Q
 ;
BLDARRY(DGBTSP) ;
 K DGBTSP
 S DGBTSP("ACCOUNT")=$$GET1^DIQ(392,DGBTDT_",",6)
 ;
 S DGBTSP("CLAIM TYPE")=$$GET1^DIQ(392,DGBTDT_",",56)
 S DGBTSP("MODE OF TRANS")=$$GET1^DIQ(392,DGBTDT_",",57)
 S DGBTSP("INVOICE NUMBER")=$$GET1^DIQ(392,DGBTDT_",",58)
 S DGBTSP("DT INVOICE REC")=$$GET1^DIQ(392,DGBTDT_",",59)
 S DGBTSP("TOTAL INVOICE")=$$GET1^DIQ(392,DGBTDT_",",60)
 S DGBTSP("BASE RATE FEE")=$$GET1^DIQ(392,DGBTDT_",",61)
 S DGBTSP("MILEAGE FEE")=$$GET1^DIQ(392,DGBTDT_",",62)
 S DGBTSP("NO SHOW")=$$GET1^DIQ(392,DGBTDT_",",63)
 S DGBTSP("WAIT TIME")=$$GET1^DIQ(392,DGBTDT_",",64)
 S DGBTSP("EXTRA CREW")=$$GET1^DIQ(392,DGBTDT_",",65)
 S DGBTSP("SP EQUIP")=$$GET1^DIQ(392,DGBTDT_",",66)
 S DGBTSP("RT/ONE WAY")=$$GET1^DIQ(392,DGBTDT_",",67)
 S DGBTSP("TOTAL MILES")=$$GET1^DIQ(392,DGBTDT_",",68)
 S DGBTSP("OTHER TRANS REMARKS")=$$GET1^DIQ(392,DGBTDT_",",69)
 S DGBTSP("PRE-AUTHORIZED")=$$GET1^DIQ(392,DGBTDT_",",70)
 ;S DGBTSP("VENDOR")=$$GET1^DIQ(392,DGBTDT_",",71)
 S DGBTSP("SP MODE OTHER REMARKS")=$$GET1^DIQ(392,DGBTDT_",",72)
 S DGBTSP("PLACE OF DEPARTURE")=$$GET1^DIQ(392,DGBTDT_",",73)
 ;
 S DGBTSP("PLACE OF DEPATURE 2")=$$GET1^DIQ(392,DGBTDT_",",74)
 S DGBTSP("CITY OF DEPARTURE")=$$GET1^DIQ(392,DGBTDT_",",75)
 S DGBTSP("STATE OF DEPARTURE")=$$GET1^DIQ(392,DGBTDT_",",76)
 S DGBTSP("ZIP CODE/DEPARTURE")=$$GET1^DIQ(392,DGBTDT_",",77)
 ;
 S DGBTINST("DIVISION")=$$GET1^DIQ(392,DGBTDT_",",78)
 S DGBTINST("INST NAME")=$$GET1^DIQ(392,DGBTDT_",",79)
 S DGBTINST("ADDRESS1")=$$GET1^DIQ(392,DGBTDT_",",80)
 S DGBTINST("CITY")=$$GET1^DIQ(392,DGBTDT_",",81)
 S DGBTINST("STATE")=$$GET1^DIQ(392,DGBTDT_",",82)
 S DGBTINST("ZIP CODE")=$$GET1^DIQ(392,DGBTDT_",",83)
 ;
 S DGBTSP("SP MODE CLAIM AUTHORIZED")=$$GET1^DIQ(392,DGBTDT_",",85)
 S DGBTSP("DATE/TIME AUTHORIZED")=$$GET1^DIQ(392,DGBTDT_",",86)
 ;
 I $G(DGBTSP("AUTHORIZED"))="Y" D
 .S DGBTSP("AUTHORIZED PERSON")=$$GET1^DIQ(392,DGBTDT_",",84)
 S INFOLINE=0
 Q
 ;
END ;display menu prompt at bottom of screen
 ;dbe patch DGBT*1*22 - added variable DGBTSPFG to replace DGANS as the exit flag when returning to the select patient prompt
 N PROMPT,DGBTSPFG
 K DGANS
 S SPCOMPLETE=0
 F  Q:$G(DGANS)="Q"!($D(DIRUT))  D  Q:$G(DGBTSPFG)!($D(DIRUT))!('$D(DGBTSP))
 .S Z="^INFORMATION^DISPLAY^EDIT",PROMPT="<I>nformation, <D>isplay claim, <E>dit claim,"
 .S DIR("A")=PROMPT_" or <Q>uit ",DIR("B")="Quit",DIR("?")="^D HELP^DGBTEND",DIR(0)="SA^Q:Quit;I:Information;D:Display;E:Edit;P:Print"
 .D ^DIR K DIR S DGANS=Y
 .S DGBTX1=$S(DGANS="I":"SCREEN^DGBTE",DGANS="D":"SCREEN^DGBTCDSP",DGANS="E":"SPMODE^DGBTE",DGANS="Q":"PATIENT^DGBTE",1:"QUIT^DGBTEND")
 .I $G(DGBTX1)]""&($G(DGANS)="Q") K DGANS S DGBTSPFG=1 G @DGBTX1 ;dbe patch DGBT*1*22 - modified to correctly return to select patient prompt
 .I $G(DGBTX1)]""&($G(DGANS)'="Q") D @DGBTX1
 Q
 ;
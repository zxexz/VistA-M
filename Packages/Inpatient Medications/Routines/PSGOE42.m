PSGOE42 ;BIR/CML3-REGULAR ORDER ENTRY (CONT.) ;13 May 2019 18:44:10
 ;;5.0;INPATIENT MEDICATIONS ;**366,327**;16 DEC 97;Build 114
 ;
 ;
1 I $G(PSGCLOZ) K PSGCLOZ Q  ;NCC remediation *327/RJS QUIT IF STOP DATE HAS BEEN MODIFIED AND PROCESS
 S:'$G(PSGPR) PSGPR=0 S:'$D(PSGPRN) PSGPRN=""  ; must have provider info
 ; provider
 I '$G(PSJSYSU) S PSTMPI=PSGPR,PSTMPN=PSGPRN G A1
 I $S(+PSJSYSU=3:0,1:$P(PSJSYSU,";",2)) G:$P(PSJSYSW0,"^",24) 5 G DONE
 S PSTMPI=PSGPR,PSTMPN=PSGPRN
A1 ;
 ;*366 - check provider credentials
 I PSGPR N PSJACT S PSJACT=$$ACTPRO^PSGOE1(PSGPR) S:'PSJACT PSGPR=0,PSGPRN=""
 W !,"PROVIDER: ",$S(PSGPR:PSGPRN_"// ",1:"") R X:DTIME I X="^" W $C(7) S PSGOROE1=1 G DONE
 I $S(X="":'PSGPR,1:X="@") W $C(7),"  (Required)" S X="?",PSGF2=1 D ENHLP^PSGOEM(53.1,1) G 1
 I X="",PSGPR S X=PSGPRN I PSGPR'=PSGPRN,$$GET1^DIQ(200,PSGPR,53.1,"I") W "    "_$$GET1^DIQ(200,PSGPR,53.2)_"    "_$$GET1^DIQ(200,PSGPR,53.3) S PSGFOK(1)="" G A2
 S PSGF2=1 I X?1."?" D ENHLP^PSGOEM(53.1,1)
 I $E(X)="^" D FF G:Y>0 @Y G 1
 K DIC S DIC="^VA(200,",DIC(0)="EMQZ",DIC("S")="I $$ACTPRO^PSGOE1(+Y)" D ^DIC K DIC I Y'>0 G 1
 S PSGPR=+Y,PSGPRN=$P(Y(0,0),"^"),PSGFOK(1)=""
A2 ;; START NCC T4 MODS >> 327*RJS
 I $$ISCLOZ^PSJCLOZ(,,,,PSGDRG) D
 .S ANQX=0 D PROVCHK^PSJCLOZ(PSGPR) ;(PSGP,PSGDRG)
 .I ANQX=0 K PSTMPN,PSTMPI
 I $G(ANQX) S PSGPR=PSTMPI,PSGPRN=PSTMPN W ! K ANQX G A1
 ;; END NCC T4 MODS << 327*RJS
5 ; self med
 I '$P(PSJSYSW0,"^",24) G DONE
A5 W !,"SELF MED: " W:PSGSM]"" $P("NO^YES","^",PSGSM+1),"// " R X:DTIME I X="^"!'$T W:'$T $C(7) S PSGOROE1=1 G DONE
 I "01"[X,$L(X)<2 S:PSGSM=""&(X]"") PSGSM=X W:PSGSM]"" "  (",$P("NO^YES","^",PSGSM+1),")" G DONE
 I X="@" W:PSGSM="" $C(7),"  ??" G:PSGSM="" A5 D DEL G:%'=1 A5 S (PSGSM,PSGHSM)="" G DONE
 S PSGF2=5 I X?1"^".E D FF G:Y>0 @Y G A5
 I X?1."?" S PSGF2=5 D ENHLP^PSGOEM(53.1,5) G A5
 D YN I  S PSGSM=$E(X)="Y",PSGFOK(5)="" G 6:PSGSM,DONE
 W $C(7) D ENHLP^PSGOEM(53.1,5) G A5
 ;
6 ; hospital supplied self med
 W !,"HOSPITAL SUPPLIED SELF MED: " W:PSGHSM]"" $P("NO^YES","^",PSGHSM+1),"// " R X:DTIME I X="^"!'$T W:'$T $C(7) S PSGOROE1=1 G DONE
 I "01"[X,$L(X)<2 S:PSGHSM=""&(X]"") PSGHSM=X W:PSGHSM]"" "  (",$P("NO^YES","^",PSGHSM+1),")" G DONE
 I X="@" W:PSGHSM="" $C(7),"  ??" G:PSGHSM="" 6 D DEL G:%'=1 6 S PSGHSM="" G DONE
 S PSGF2=6 I X?1"^".E D FF G:Y>0 @Y G 6
 I X?1."?" D ENHLP^PSGOEM(53.1,6) G 6
 D YN I  S PSGHSM=$E(X)="Y" G DONE
 W $C(7) S PSGF2=6 D ENHLP^PSGOEM(53.1,6) G 6
 Q
 ;
DONE ;
 K F,F0,F1,PSGF2,F3,PSG,SDT Q
 ;
FF ; up-arrow to another field
 D ENFF^PSGOEM I Y>0,Y'=1,Y'=5 S Y=Y_"^PSGOE4"_$S("^109^13^3^7^26^"[("^"_Y_"^"):"",1:1)
 Q
 ;
DEL ; delete entry
 W !?3,"SURE YOU WANT TO DELETE" S %=0 D YN^DICN I %'=1 W $C(7),"  <NOTHING DELETED>"
 Q
 ;
YN ; yes/no as a set of codes
 I X'?.U F Y=1:1:$L(X) I $E(X,Y)?1L S X=$E(X,1,Y-1)_$C($A(X,Y)-32)_$E(X,Y+1,$L(X))
 F Y="NO","YES" I $P(Y,X)="" W $P(Y,X,2) Q
 Q
 ;
2 ; dispense drug multiple
 I PSGDRG,'$D(^PS(53.45,PSJSYSP,2)) S ^(2,0)="^53.4502P^1^1",^(1,0)=PSGDRG_"^"_PSGUD
 K DA,DR S DIE="^PS(53.45,",DA=PSJSYSP,DR=2,DR(2,53.4502)=$S($G(PSGFOK(13)):.02,1:".01;.02") D ^DIE
 I '$O(^PS(53.45,PSJSYSP,2,0)) W $C(7),!!,"WARNING: This order must have at least one dispense drug before pharmacy can",!?9,"verify it!"
 I $G(PSGFOK(13)) Q
 G @FB
 ;

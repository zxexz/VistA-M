GECXPOST ;WISC/RFJ-fix the entry and exit menu actions ;15 Jun 95
 ;;2.0;GCS;**2**;MAR 14, 1995
 N %,DA,DATA,FIND,NEWAPIS,NEWCODE,NEWENTRY,OLDAPIS,OLDCODE,OLDCODX,OLDENTRY
 ;  oldapis is the old application interfaces
 ;  newapis is the new application interfaces
 ;  the last 2 pieces of the variable fix problems with wrong routines
 S OLDAPIS="D ^GECSBATC|D ^GECSE|D BATCHES^GECSLIST|D WAITBAT^GECSLIST|D EDIT^GECSE1|D EN1^GECSA|D DEL^GECSE1|D KEY^GECSA|D ^GECSPURG|D RBAT^GECSLIST|D REBAT^GECSE1|D RETRAN^GECSE2|D REVIEW^GECSE1|D ^GECSTRAN|D RETRAN^GECSE1|D GECSPURG"
 S NEWAPIS="BATCH|EDITBAT|RSTATUS|RBATWA|EDITCOD|CREATE|DELCODE|KEY|PURGE|RCODEBA|REBAT|RETRAN|REVCODE|TRANS|RETRAN|PURGE"
 ;
 S DA=0 F  S DA=$O(^DIC(19,DA)) Q:'DA  S DATA=$G(^(DA,0)) I $P(DATA," ",2)="GECS",$G(^DIC(19,DA,20))["S GECSSYS" D
 .   ;  add K GECSSYS to exit action of option
 .   S OLDCODX=$G(^DIC(19,DA,15)) I OLDCODX'["K GECSSYS" S ^DIC(19,DA,15)=$S(OLDCODX="":"",1:" ")_"K GECSSYS"
 .   ;  change entry action to call new supported label
 .   S OLDENTRY=^DIC(19,DA,20)
 .   F %=1:1:17 I OLDENTRY[$P(OLDAPIS,"|",%) Q
 .   I %>16 Q
 .   S OLDCODE=$P(OLDAPIS,"|",%),FIND=$F(OLDENTRY,OLDCODE)
 .   S NEWCODE="D "_$P(NEWAPIS,"|",%)_"^GECSCALL"
 .   S NEWENTRY=$E(OLDENTRY,1,FIND-$L(OLDCODE)-1)_NEWCODE_$E(OLDENTRY,FIND,9999)
 .   S ^DIC(19,DA,20)=NEWENTRY
 .   I DA#100=0 W "."
 Q

RAONDEM ;BPFO/CLT - RADIOLOGY ON DEMAND REPORT FOR VACO ; 11 Jul 2016  12:06 PM
 ;;5.0;Radiology/Nuclear Medicine;**127**;Mar 16, 1998;Build 119
 ;;Per VHA Directive 10-93-142, this routine should not be modified
 ;
EN ;PRIMARY ENTRY POINT
 K ^TMP("RAONDEM",$J)
 N RABDT,RAEDT,RAPRO,RAPROTOT,RACDT,RASDT,RACOMDT,RAUTOT,RACNM,RAMSG,RARESP
 N RAPROTOT,RAUTOT,RACOMP,RAMATCH,RAM,RAT,RACOL1,RACOL2,RACOL3,RAPAD
 S (RAPROTOT,RAUTOT,RAM,RACNM,RACOL1)=0
 S RACOL2=49,RACOL3=66
 S $P(RABLANK," ",80)=" ",RAPAD=0
 S RAT=7
 ;
LOOK ;LOOK FOR REPORT PARAMETERS
 S RAMSG=XMZ,RABDT=0
 S RABDT=$P(^XMB(3.9,RAMSG,2,1,0),":",2)
 S X=($P(RABDT,"/",3)-1700)_$S($L($P(RABDT,"/",1))=1:"0"_$P(RABDT,"/",1),1:$P(RABDT,"/",1))
 S X=X_$S($L($P(RABDT,"/",2))=1:"0"_$P(RABDT,"/",2),1:$P(RABDT,"/",2))
 S RABDT=X,X=""
 S RAEDT=$P(^XMB(3.9,RAMSG,2,2,0),":",2)
 S X=($P(RAEDT,"/",3)-1700)_$S($L($P(RAEDT,"/",1))=1:"0"_$P(RAEDT,"/",1),1:$P(RAEDT,"/",1))
 S X=X_$S($L($P(RAEDT,"/",2))=1:"0"_$P(RAEDT,"/",2),1:$P(RAEDT,"/",2))
 S RAEDT=X,X=""
 S RARESP=$P(^XMB(3.9,RAMSG,2,3,0),":",2)
LOOP ;LOOP THROUGH NEW PROCEDURES
 S RADT1=RABDT-1 F  S RADT1=$O(^RAMIS(71,"CREAT",RADT1)) Q:RADT1=""  D
 . S RAIEN=0 F  S RAIEN=$O(^RAMIS(71,"CREAT",RADT1,RAIEN)) Q:RAIEN=""  D:$G(^RAMIS(71,RAIEN,"NTRT"))'=""
 .. S RANODE=^RAMIS(71,RAIEN,"NTRT")
 .. S:$P($G(RANODE),U,2)'="" RAUTOT=RAUTOT+1
 .. I $P($G(RANODE),U,5)="",$P($G(RANODE),U,1)="" S RACNM=RACNM+1
 .. S RAPRO=($P(^RAMIS(71,RAIEN,0),U,1)_"                                       ")
 .. S RAPROTOT=RAPROTOT+1
 .. S RAT=RAT+1
 .. ;S RACREAT=$P(RANODE,U,3),RACOMP=$P(RANODE,U,1),RAMATCH=$S($P(RANODE,U,1)="":"No",1:"Yes")
 .. S RACREAT=$P(RANODE,U,3),RAMATCH=$S($P(RANODE,U,1)="":"No",1:"Yes")
 .. N RACREXT S RACREXT=$$FMTE^XLFDT(RACREAT,5) S:RACREXT'["/" RACREXT="" I RACREXT D
 ... N RADTPCNT,RADTPC F RADTPCNT=1:1:2 S RADTPC=$TR($J($P(RACREXT,"/",RADTPCNT),2)," ",0) S $P(RACREXT,"/",RADTPCNT)=RADTPC
 .. S RATXT(RAT)=$E(RAPRO,1,46)_"  " S RAPAD=$E(RABLANK,1,RACOL2-$L(RATXT(RAT))) S RATXT(RAT)=RATXT(RAT)_RAPAD_RACREXT
 .. ;S RATXT(RAT)=$E(RAPRO,1,40)_"  "_$E(RACREAT,4,5)_"/"_$E(RACREAT,6,7)_"/"_($E(RACREAT,1,3)+1700)
 .. ;S RATXT(RAT)=RATXT(RAT)_"  "_$S(RACOMP="":"          ",1:$E(RACOMP,4,5)_"/"_$E(RACOMP,6,7)_"/"_($E(RACOMP,1,3)+1700))_"  "_RAMATCH S:RAMATCH="No" RAM=RAM+1
 .. S RAPAD=$E(RABLANK,1,RACOL3-$L(RATXT(RAT))) S RATXT(RAT)=RATXT(RAT)_RAPAD_RAMATCH S:RAMATCH="No" RAM=RAM+1
 .. ;S RATXT(RAT)=RATXT(RAT)_"              "_RAMATCH S:RAMATCH="No" RAM=RAM+1
 .. S (RAPRO,RACREAT,RAMACH)=""
 .. Q
 . Q
RPT ;BUILD REPORT
 N RAPAD2,RASITENM
 S RAPAD2=0,RASITENM=$P($$SITE^VASITE(),"^",2)
 S RAT=RAT+1
 S RATXT(1)="On demand report for "_$E(RABDT,4,5)_"/"_$E(RABDT,6,7)_"/"_($E(RABDT,1,3)+1700)_" through "_$E(RAEDT,4,5)_"/"_$E(RAEDT,6,7)_"/"_($E(RAEDT,1,3)+1700)
 S RATXT(2)=" "
 S RASITENM=$S($L(RASITENM):RASITENM,1:"Local Database")
 S RATXT(3)="For "_RASITENM  ;$P($G(^XMB(3.9,RAMSG,2,.007,0)),"@",2)
 S RATXT(4)=" "
 S RAPAD=$E(RABLANK,1,RACOL2-$L("PROCEDURE"))
 S RATXT(5)="PROCEDURE"_RAPAD_"CREATED" S RAPAD2=$E(RABLANK,1,RACOL3-($L(RATXT(5))+2)) S RATXT(5)=RATXT(5)_RAPAD2_"MATCHED"
 S RATXT(6)="========="_RAPAD_"=========="_$E(RAPAD2,1,$L(RAPAD2)-3)_"======="
 S RATXT(7)=" "
 S RATXT(RAT)="============================================================================="
 S RALINE="Total:"_RAPROTOT,RAPAD=$E(RABLANK,1,RACOL3-$L(RALINE))
 S RALINE=RALINE_RAPAD_RAM_" Unmatched"
 ;_"                                        "),1,40)_"       "_RAUTOT_" Incomplete"_"       "_RAM_" Unmatched"
 S RATXT(RAT+1)=RALINE
 D MSG G END
MSG ;SEND REPORT RESPONSE
 N XMSUB,XMTEXT,XMY
 S XMSUB="ON DEMAND REPORT"
 S XMY(RARESP)=""
 S XMTEXT="RATXT("
 D ^XMD
END ;END ROUTINE
 K RACREAT,RADT1,RAIEN,RATXT,RALINE,RAMATCH,RALINE,RANODE,X,XMDUN,XMDUZ,XMM,XMDUZ,XMZ,RAMACH
 Q

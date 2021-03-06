PRCA307P ;ALB/BDB - PATCH PRCA*4.5*307 POST-INSTALL ROUTINE ; 11/2/15 4:15pm
 ;;4.5;Accounts Receivable;**307**;Mar 20, 1995;Build 80
 ;;Per VA Directive 6402, this routine should not be modified.
 ; This routine will update a specific list of Station ID's
 ; and queues the Patient Statement Auto-Correction Program
 ;
 Q
EN ;Entry point for PRCA*4.5*307 post-install
 N SDAY,SITE,T
 S SITE=$$SITE^RCMSITE
 I SITE=0 D
 .D MES^XPDUTL(" ")
 .D BMES^XPDUTL(">>> WARNING! STATION ID NOT FOUND!")
 .D MES^XPDUTL(">>> THE PATIENT STATEMENT TRANSMISSION DATE WILL NOT BE UPDATED")
 .D MES^XPDUTL(" ")
 I SITE'=0,$T(@SITE) D
 .D MES^XPDUTL(" ")
 .D BMES^XPDUTL(">>> STATION ID "_SITE_" MATCH FOUND!")
 .D MES^XPDUTL(">>> THE PATIENT STATEMENT TRANSMISSION DATE WILL BE UPDATED")
 .D MES^XPDUTL(" ")
 .;set patient statement day to site statement day
 .S T=$T(@SITE),SDAY=+$P(T,";;",2)
 .S $P(^RC(342,1,0),"^",11)=SDAY
 .S DEB=0 F  S DEB=$O(^RCD(340,"AB","DPT(",DEB)) Q:'DEB  I $D(^RCD(340,+DEB,0)) D
 ..S STDT=$P($G(^RCD(340,+DEB,0)),"^",3) Q:'STDT
 ..S SSTDT=$P($G(^RC(342,1,0)),"^",11)
 ..Q:(SSTDT=STDT)
 ..K ^RCD(340,"AC",STDT,+DEB)
 ..S $P(^RCD(340,+DEB,0),"^",3)=SSTDT
 ..S ^RCD(340,"AC",SSTDT,DEB)=""
 K SDAY,SITE,DEB,STDT,SSTDT,T
 ;
 ;Stations that will have monthly statement build date changed
438 ;;21^SIOUX FALLS,SD
501 ;;21^ALBUQUERQUE,NM
504 ;;21^AMARILLO,TX
542 ;;21^COATESVILLE,PA
562 ;;21^ERIE,PA
568 ;;21^FORT MEADE,SD
649 ;;21^PRESCOTT,AZ
656 ;;21^ST. CLOUD,MN
688 ;;21^WASHINGTON,DC
756 ;;21^EL PASO,TX
565 ;;22^FAYETTEVILLE,NC
621 ;;22^MOUNTAIN HOME,TN
658 ;;22^SALEM,VA
664 ;;22^SAN DIEGO,CA
671 ;;22^SAN ANTONIO,TX
689 ;;22^WEST HAVEN,CT
740 ;;22^TEXAS VALLEY COASTAL,TX

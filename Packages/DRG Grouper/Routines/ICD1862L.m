ICD1862L ;ALB/JDG - UPDATE DX & PX CODES ; 10/5/11 3:23pm
 ;;18.0;DRG Grouper;**62**;Oct 20,2000;Build 10
 ;
 Q
 ;
 ; Update Dx code(s)
ICDUPDDX ; update DX identifier(s)
 D BMES^XPDUTL(">>> UPDATING DX CODE 730.28 IDENTIFIER...")
 N LINE,LINEXX,ICDDXDA,DA,DIE,IDENT,DR
 F LINE=1:1 S LINEXX=$T(PROCUP1+LINE) S ICDDXDA=$P(LINEXX,";;",2) Q:ICDDXDA="EXIT"  D
 .S DA=ICDDXDA
 .S DIE="^ICD9("
 .S IDENT="k"
 .S DR="2///^S X=IDENT"
 .D ^DIE
 ;
 ;
 ;DX - update DX MDC24 field
 D BMES^XPDUTL(">>> UPDATING DX CODE 860.0...")
 N LINE,LINEXX,ICDDXDA,DA,DIE,NMDC24C,DR
 F LINE=1:1 S LINEXX=$T(PROCUP5+LINE) S ICDDXDA=$P(LINEXX,";;",2) Q:ICDDXDA="EXIT"  D
 .S DA=ICDDXDA
 .S DIE="^ICD9("
 .S NMDC24C=2
 .S DR="5.7///^S X=NMDC24C"
 .D ^DIE
 Q
 ;
 ;
 ; Update Px code(s)
ICDUPDPX ; Update Px identifier(s)
 D BMES^XPDUTL(">>> UPDATING PX CODE 31.1 MAJOR O.R. PROCEDURE...")
 N LINE,LINEXX,ICDPXDA3,DA,MAJOR
 S DIE="^ICD0(",DR="20///^S X=MAJOR"
 F LINE=1:1 S LINEXX=$T(PROCUP2+LINE) S ICDPXDA3=$P(LINEXX,";;",2) Q:ICDPXDA3="EXIT"  D
 .S DA=ICDPXDA3
 .S MAJOR="9"
 .D ^DIE
 ;
 ; updating/replacing associated DRGs
 D BMES^XPDUTL(">>> UPDATING PX CODE 80.05 DRGs...")
 N ICDPXIEN,ICDDRGIEN,ICDDRGNUM,ICDDATE1,MDC1,DRGIEN,LINE,LINEXX,ICDTXT,ICDTXTFP,ICDTXTSP,ICDTXTTP
 F LINE=1:1 S LINEXX=$T(PROCUP3+LINE) S ICDTXT=$P(LINEXX,";;",2),ICDTXTFP=$P(ICDTXT,"^"),ICDTXTSP=$P(ICDTXT,"^",2),ICDTXTTP=$P(ICDTXT,"^",3),ICDDATE1=$P(ICDTXT,"^",4),MDC1=$P(ICDTXT,"^",5) Q:ICDTXT="EXIT"  D
 .S ICDPXIENX=ICDTXTFP
 .S ICDDRGREP=ICDTXTTP
 .S ICDPXIEN=$O(^ICD0("AB",ICDPXIENX,""))
 .S ICDDRGIEN=$O(^ICD0(ICDPXIEN,2,"B",ICDDATE1,""))
 .S ICDDRGNUM=ICDTXTSP S DRGIEN=$O(^ICD0(ICDPXIEN,2,ICDDRGIEN,1,MDC1,1,"B",ICDDRGNUM,""))
 .S ICDFDA(80.17111,DRGIEN_","_MDC1_","_ICDDRGIEN_","_ICDPXIEN_",",.01)=ICDDRGREP
 .D UPDATE^DIE("","ICDFDA") K ICDFDA
 ;
 ; add associated DRGs
 D BMES^XPDUTL(">>> UPDATING PX CODE 81.05 DRGs...")
 N ICDPXIEN,ICDDRGIEN,ICDDATE1,MDC1,LINE,LINEXX,ICDTXT,ICDTXTFP,ICDTXTSP,ICDMDCLVL,ICDPXIENX,ICDDRGADD
 F LINE=1:1 S LINEXX=$T(PROCUP4+LINE) S ICDTXT=$P(LINEXX,";;",2),ICDTXTFP=$P(ICDTXT,"^"),ICDTXTSP=$P(ICDTXT,"^",2),ICDDATE1=$P(ICDTXT,"^",3),MDC1=$P(ICDTXT,"^",4) Q:ICDTXT="EXIT"  D
 .S ICDMDCLVL=0
 .S ICDPXIENX=ICDTXTFP
 .S ICDDRGADD=ICDTXTSP
 .S ICDPXIEN=$O(^ICD0("AB",ICDPXIENX,""))
 .S ICDDRGIEN=$O(^ICD0(ICDPXIEN,2,"B",ICDDATE1,""))
 .F  S ICDMDCLVL=$O(^ICD0(ICDPXIEN,2,ICDDRGIEN,1,ICDMDCLVL))  Q:(ICDMDCLVL="")!($G(^ICD0(ICDPXIEN,2,ICDDRGIEN,1,ICDMDCLVL,0))=MDC1)
 .S ICDFDA(80.17111,"+1,"_ICDMDCLVL_","_ICDDRGIEN_","_ICDPXIEN_",",.01)=ICDDRGADD
 .D UPDATE^DIE("","ICDFDA") K ICDFDA
 Q
 ;
 ;
PROCUP1 ;
 ;;4795
 ;;EXIT
 ;
 ;
PROCUP2 ;
 ;;424
 ;;EXIT
 ;
 ;
PROCUP3 ; updating/replacing associated DRGs (;;Px code^old DRG^new DRG^DRG Grouper Effective date^associated MDC)
 ;;80.05^480^463^3071001^1
 ;;80.05^481^464^3071001^1
 ;;80.05^482^465^3071001^1
 ;;EXIT
 ;
 ;
PROCUP4 ; add associated DRGs (;;Px code^DRG^DRG Grouper Effective date^associated MDC)
 ;;81.05^456^3071001^8
 ;;81.05^457^3071001^8
 ;;81.05^458^3071001^8
 ;;81.05^459^3071001^8
 ;;81.05^460^3071001^8
 ;;EXIT
 ;
 ;
PROCUP5 ;
 ;;9962
 ;;EXIT
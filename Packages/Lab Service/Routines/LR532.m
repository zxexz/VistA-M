LR532 ;PBB - LR*5.2*532 PATCH ENVIRONMENT CHECK ROUTINE ;02/20/17
 ;;5.2;LAB SERVICE;**532**;Sep 27, 1994;Build 11
 ;;
EN ; Does not prevent loading of the transport global.
 ; Environment check is done only during the install.
 ; DBIA #7126
 ; DBIA #7127
 I '$G(XPDENV) D  Q
 .N XQA,XQAMSG
 .S XQAMSG="Transport global for patch "_$G(XPDNM,"Unknown patch")
 .S XQAMSG=XQAMSG_" loaded on "_$$HTE^XLFDT($H)
 .S XQA("G.LMI")=""
 .D SETUP^XQALERT
 .S MSG="Sending transport global loaded alert to mail group G.LMI"
 .D BMES^XPDUTL($$CJ^XLFSTR(MSG,80)) K MSG
 ;
 Q
 ;
PRE ; KIDS Pre install for LR*5.2*532
 ;
 N XQA,XQAMSG
 ;K ^XTEMP($J,"LR532") ;Keep field 80 identifier
 S XQAMSG="Installation of patch "_$G(XPDNM,"Unknown patch")
 S XQAMSG=XQAMSG_" started on "_$$HTE^XLFDT($H)
 S XQA("G.LMI")=""
 D SETUP^XQALERT
 ;
 S MSG="Sending install started alert to mail group G.LMI"
 D BMES^XPDUTL($$CJ^XLFSTR(MSG,80)) K MSG
 ;
 ;Disable Screaning records with status DEL.
 ;^DD(95.3,0,"SCR")=I $P($G(^LAB(95.3,Y,4)),U)'=1
 ; DBIA #7126
 K ^DD(95.3,0,"ID",80)
 ; Be sure screening is not there.
 K ^DD(95.3,0,"SCR")
 ;S $P(^LAB(95.3,0),U,3)="95.3Is"
 S $P(^LAB(95.3,0),U,3)="95.3I"
 ; DBIA #7127
 K ^DD(64.061,0,"ID",8)
 N FDA,ERR
 S FDA(64.061,"7489,",.01)="CARDIAC STRESS STUDY" D UPDATE^DIE(,"FDA","","ERR")
 I $D(ERR) D  Q
 .S MSG="Unable to update file 64.061 7489 CARDIAC STRESS STUDY"
 .D BMES^XPDUTL($$CJ^XLFSTR(MSG,80)) K MSG
 .;W !,"Unable to update file 64.061 7489 CARDIAC STRESS STUDY"
 ;
 D BMES^XPDUTL($$CJ^XLFSTR("*** Pre install completed ***",80))
 ;
 Q
 ;
POST ; KIDS Post install for LR*5.2*532
 ;
 N XQA,XQAMSG
 D BMES^XPDUTL($$CJ^XLFSTR("*** Post install started ***",80))
 ; Debugging of DDs change ************************
 ; D BMES^XPDUTL($$CJ^XLFSTR("*** ^DD(95.3,0,""ID"",80) after PREINSTALL ="_$G(^DD(95.3,0,"ID",80))_" ***",80))
 ; ***********************************************
 ;
 ;IDENTIFIED BY: CHECK DIGIT (#15), FULLY SPECIFIED NAME(#80)
 ; DBIA #7126
 S ^DD(95.3,0,"ID",80)="W:$D(^(80)) !,""   "",$P(^(80),U,1)"
 ;S $P(^LAB(95.3,0),U,3)="95.3Is"
 ;S ^DD(95.3,0,"SCR")="I $P($G(^LAB(95.3,Y,4)),U)'=1"
 ; Be sure screening is not there.
 K ^DD(95.3,0,"SCR")
 S $P(^LAB(95.3,0),U,3)="95.3I"
 ; DBIA #7127
 S ^DD(64.061,0,"ID",8)="W ""   "",$P(^(0),U,8)"
 ;Restore file screening if STATUS is DEL.
 ;IDENTIFIED BY: TYPE (#7), DESCRIPTION (#8) 
 ;S ^DD(64.061,0,"ID",7)="W ""   "",@(""$P($P($C(59)_$S($D(^DD(64.061,7,0)):$P(^(0),U,3),1:0)_$E(""_DIC_""Y,0),0),$C(59)_$P(^(0),U,7)_"""":"""",2),$C(59),1)"")"
 ;K ^XTEMP($J,"LR532")
 ;
 S XQAMSG="Installation of patch "_$G(XPDNM,"Unknown patch")
 S XQAMSG=XQAMSG_" completed on "_$$HTE^XLFDT($H)
 S XQA("G.LMI")=""
 D SETUP^XQALERT
 D EN1,NLT1
  ;Reindex file 64 field 1 "C" x-ref
 K DIK S DIK="^LAM(",DIK(1)="1^C" D ENALL2^DIK
 K DIK S DIK="^LAM(",DIK(1)="1^C" D ENALL^DIK
 ;Reindex file 64 field 25 "AH" x-ref
 K DIK S DIK="^LAM(",DIK(1)="25^AH" D ENALL2^DIK
 K DIK S DIK="^LAM(",DIK(1)="25^AH" D ENALL^DIK
 D BMES^XPDUTL($$CJ^XLFSTR("*** Update of LOINC Files: 129.1  129.11  129.12  129.13 started ***",80))
 ;D PRE^LR532RX
 D BMES^XPDUTL($$CJ^XLFSTR("*** Update of LOINC Files: 129.1  129.11  129.12  129.13 completed ***",80))
 D BMES^XPDUTL($$CJ^XLFSTR("*** Post install completed ***",80))
 Q
NLT1 ;
 N I
 F I=.01,1,1.5,1.6,1.7,2,3,3.1,4,5,6,7,8,10,11,13,15,20,21,22,23,24,30,31,32,33,34,35,36,37,38,40,41,56,80,81,99.98,99.99,99.991 S ^DD(95.3,I,9)="^"
 S ^DD(95.3099,.01,9)="^"
 S ^DD(95.3,0,"VRRV")=2.67 ;LAB LOINC
 S ^DD(95.31,0,"VRRV")=2.67 ;LAB LOINC COMPONENT
 S ^DD(64,0,"VRRV")=2.67 ;WKLD CODE
 S ^DD(64.061,0,"VRRV")=2.67 ;LAB ELECTRONIC CODES 
 S ^DD(64.2,0,"VRRV")=2.67 ;WKLD SUFFIX CODES
 S ^DD(64.21,0,"VRRV")=2.67 ;WKLD CODE LAB SECT
 ;S ^DD(64.22,0,"VRRV")=2.67
 ;S ^DD(64.3,0,"VRRV")=2.67
 ;S Y=$$NOW^XLFDT\1 D DD^%DT S Y="2.52 ;;5.2;LAB SERVICE;**532**;"_Y_";Build 01"
 ;S Y="5.2;LAB SERVICE;**532**;MAY 05, 2016;Build 1"
 S Y="2.67;;5.2;LAB SERVICE;**532**;Sep 27, 1994"
 S ^LAB(95.3,"VR")=Y
 S ^LAB(95.31,"VR")=Y
 S ^LAM("VR")=Y
 S ^LAB(64.061,"VR")=Y
 S ^LAB(64.2,"VR")=Y
 S ^LAB(64.21,"VR")=Y
 ;;;;;;;;;;;;;;;;
 ;S ^LAB(64.22,"VR")=Y
 ;S ^LAB(64.3,"VR")=Y
 ;^LAB(95.3,"VR")="2.14 ;;5.2;LAB SERVICE;**334**;Sep 27, 1994;Build 12"
 ;^LAB(64.21,"VR")="2.14 ;;5.2;LAB SERVICE;**334**;Sep 27, 1994;Build 12"
 ;^LAB(64.2,"VR")="2.14 ;;5.2;LAB SERVICE;**334**;Sep 27, 1994;Build 12"
 ;^LAB(95.31,"VR")="2.14 ;;5.2;LAB SERVICE;**334**;Sep 27, 1994;Build 12"
 ;^LAM("VR")="2.14 ;;5.2;LAB SERVICE;**334**;Sep 27, 1994;Build 12"
 ;^LAB(64.061,"VR")=""
 ;$$GET1^DID(95.3,"","","PACKAGE REVISION DATA")
 Q
 ;
EN1 ;Find and correct existing spelling or duplicate numbers errors.
 N DA,DIC,DIK,DIU,X,Y,DIRUT,DTOUT,DUOUT
REINDEX ;Reindex LAM to fire new x-refs
 L +^LAM:999 I '$T G EN1
 D
 . ;N DIK
 . N DIK,DIU
 . ;S DIK="^LAM(" D IXALL^DIK
 . S DIU(0)=1,DIK="^LAM(" D IXALL^DIK
 . S $P(^LAM(0),U,3)=99999
 K ^XTMP("LRNLTERR","LR532") S ^XTMP("LRNLTERR",0)=$$HTFM^XLFDT($H+90,1)_"^"_DT_"^LR52 532 Error Messages"
 K ^XTMP("LRNLT","LR532")
 S ^XTMP("LRNLT",0)=$$HTFM^XLFDT($H+90,1)_"^"_DT_"^LR52 532 Messages"
 N DA,DIK,LRIEN,LRN0,LRN1,LRFILE
 D POST1 ;,ALERT^LR334POA
 L -^LAM
 Q
 ;
CHK N DIC,X,Y
 K LRFDA,LRANS,LRNAMX,LRNUMX,LRNAMY,LRNUMY
 S DIC(0)="ZNMO",(LRNAMX,LRNAMY,X)=$P(LRN0,U)
 I $G(LRFILE)=64 D
 . S DIC=64,(LRNUMY,LRNUMX)=$P(LRN0,U,2)
 . S DIC("S")="I $P(^(0),U,2)=LRNUMX"
 . D ^DIC I Y<1 D DEL Q
 . W:$G(LRDBUG) !,Y_" ( "_LRFILE
 . S LRIENS=+Y_","
 . I $L($P(LRN0,U,8)) D
 . . S LRNAMY=$P(LRN0,U,8)
 . . S LRFDA(LRFILE,LRIENS,.01)=LRNAMY
 . I $P(LRN0,U,3) D
 . . S LRNUMY=$P(LRN0,U,3)
 . . Q:$O(^LAM("C",LRNUMY_" ",0))
 . . S LRFDA(LRFILE,LRIENS,1)=LRNUMY
 I $G(LRFILE)=64.2 D
 . N DIC
 . S (LRNAMX,LRNAMY,X)=$P(LRN0,U)
 . S DIC=64.2,LRNUMX=$P(LRN1,U,2)
 . S DIC("S")="I $P(^(0),U,2)=LRNUMX"
 . D ^DIC I Y<1 D DEL Q
 . S LRIENS=+Y_","
 . I $L($P(LRN0,U,8)) D
 . . S LRNAMY=$P(LRN0,U,8)
 . . S LRFDA(LRFILE,LRIENS,.01)=LRNAMY
 . I $P(LRN1,U,3) D
 . . S LRNUMY=$P(LRN1,U,3)
 . . S LRFDA(LRFILE,LRIENS,1)=LRNUMY
 . I $L($P(LRN1,U,7)) D
 . . S LRSYN=$P(LRN1,U,7),LRSYNIEN=$O(^LAB(64.2,+LRIENS,1,"B",LRSYN,0))
 . . Q:'LRSYNIEN
 . . S LRFDA(64.23,LRSYNIEN_","_LRIENS,.01)="@"
 . W:$G(LRDBUG) !,Y_" ( "_LRFILE
 I $D(LRFDA) D SET
 Q
SET ;
 D FILE^DIE("KS","LRFDA","LRANS")
 I '$D(LRANS) W:$G(LRDBUG) !,"Okay" D  Q
 . D WRT,DEL
 Q  ; EDIT ERRORS are left in ^LAB(64.81)
 ;
DEL ;
 N DA,DIK
 S DA=LRIEN,DIK="^LAB(64.81," D ^DIK
 Q
ERR ;
 W !,LRIEN_" ( "_LRFILE_" ERROR"
 Q
WRT ;
 D SCR(LRNUMX_"    "_LRNAMX)
 D SCR("Was changed to: "_LRNUMY_"    "_LRNAMY)
 Q
POST1 ;TRANSPORT FILE 64.81 INTO FILE 64 IF REQUIRED
 N LRREC,LRREC9
 K ^XTMP("LRNLT","LR532 ") D
 . S ^XTMP("LRNLT",0)=$$HTFM^XLFDT($H+90,1)_U_DT_U_"LR532  Added NLT Codes List"
 . S ^XTMP("LRNLT","LR532 ",0)=""
 ;D DSS W !
P1 F  L +^LAM:10 Q:$T  D BMES^XPDUTL("Attempting to Lock ^LAM Global.")
 S (LRLAST64,LRNEXT)=$O(^LAM(99999),-1)
 S:LRNEXT<1 (LRLAST64,LRNEXT)=0
 S $P(^LAM(0),U,3)=LRNEXT
 S LRN=$O(^XTMP("LRNLT642",1,99999),-1)
 S (LRADD,LRCHG,LRDOT)=0
 D SCR("==========================")
 D SCR("List of WKLD CODES added to ^LAM  (#64)")
 D SCR(" ")
 S LRNEXT=0,LRIEN=50
 F  S LRNEXT=$O(^LAB(64.81,LRIEN,2,LRNEXT)) Q:LRNEXT<1  D
 . K LRFDA,LROUT,LRAR1,LRSIXT4
 . S LRDOT=$G(LRDOT)+1 I LRDOT#50=0 W ". "
 . S LRREC=^LAB(64.81,LRIEN,2,LRNEXT,0),LRERR=0
 . S LRREC9=+$G(^LAB(64.81,LRIEN,2,LRNEXT,9))
 . I $G(LRDBUG) W !,LRREC_" "
 . S LRTRIEN=$P(LRREC,U)
 . I $S($P(LRREC,U,2)["~":1,$P($P(LRREC,U,3),".",2):1,1:0) D KREC Q
 . D CMP
 . Q:LRERR
 . I LRCHG D CHGNM
 . I LRADD D GNDE
 . I $S($G(LROUT(42,"DIERR")):0,$G(LROUT(45,"DIERR")):0,1:1) D KREC
 . K LROUT
 S $P(^LAM(0),U,3)=99999
 D:'$G(LRDBUG)
 .S $ZE="LR532 : Application Error!, please disregard" D ^%ZTER ;MAIL^LR532POA
 S MSG="Sending install completion alert to mail group G.LMI"
 D BMES^XPDUTL($$CJ^XLFSTR(MSG,80)) K MSG
KIL K LRADD,LRANS,LRAR1,LRBEG,LRCHG,LRCNT,LRCODE,LRCTR,LRDOT,LREND
 K LRENODE,LRERR,LRFDA,LRFILE,LRFLD,LRFLE,LRFNAM,LRI,LRIEN,LRIENS
 K LRMLT,LRN,LRN0,LRN1,LRNAMX,LRNAMY,LRNEXT,LRNIEN,LRNODE,LRNUM,LRLAST
 K LRNUMX,LRNUMY,LRNX,LROUT,LRPROCNM,LRREC,LRSC,LRSCR,LRSEQ,LRSIXT4
 K LRSUBFLE,LRSYN,LRSYNIEN,LRTRIEN,LRVAL,LRVR,X,Y
 Q
CHGNM ; CHANGE THE PROCEDURE NAME IN THE RECORD
 K LRFDA
 S LRFDA(42,64,LRCHG_",",.01)=LRPROCNM
 D FILE^DIE("K","LRFDA(42)","LROUT(42)")
 I $G(LROUT(42,"DIERR")) D
 . S LRERR=1
 . S LRENODE="LROUT(42,""DIERR"")"
 . D ERMSG
 I '$G(LROUT(42,"DIERR")) D SCR(LRCODE_"|"_LRPROCNM_"|"_"**Procedure Name Changed**")
 K LRFDA(42),LRPROCNM
 Q
CMP ; COMPARE FOUND CODES AND PROCEDURE NAMES
 N DIC,X,Y,ANS
 S (LRADD,LRCHG,LRERR)=0
 S LRCODE=$P(LRREC,U,3),LRPROCNM=$P(LRREC,U,2)
 S Y=+$$FIND1^DIC(64,"","XO",LRCODE_" ","C","","ANS")
 I Y<1 D
 . S LRADD=1,LRN=$G(LRN)+1
 . D SCR(LRCODE_"|"_LRPROCNM_"|")
 I Y>1,$G(LRREC9) D
 . I $D(^LAM(+Y,0)),$G(^LAM(+Y,9))<1 S $P(^LAM(+Y,9),U)=LRREC9
 Q
SCR(LRMSG) ;Store message in ^XTMP("LRNLT" Global
 S LRSCR=$G(^XTMP("LRNLT","LR532 ",1,0))+1,^(0)=LRSCR
 S ^XTMP("LRNLT","LR532 ",1,LRSCR)=LRSCR_"|"_LRMSG
 Q
SETUP ; SETS UP THE FDA ARRAY TO ADD A NODE
 F  S LRNODE=$Q(@LRNODE) Q:LRNODE=""  D
 . S LRFLE=$QS(LRNODE,1)
 . S LRFLD=$QS(LRNODE,3)
 . I LRFLE=64.8117 D
 . . S LRSUBFLE=64
 . . I LRFLD=1 S LRFLD=.01
 . . I LRFLD>1 S LRFLD=LRFLD-1
 . . S LRIENS="+"_LRTRIEN_","
 . I LRFLE'=64.8117 D
 . .; CONSTRUCT THE SUBFILE NUMBER FOR FILE 64 FROM 64.81
 . . S LRBEG=$P(LRFLE,"8117")
 . . S LREND=$P(LRFLE,"8117",2)
 . . S LRSUBFLE=LRBEG_"0"_LREND
 . . I LRFLD=.01 S LRSEQ=LRSEQ+1
 . . S LRIENS="+"_LRSEQ_","_"+"_LRTRIEN_","
 . S LRVAL=@LRNODE
 . S LRFDA(45,LRSUBFLE,LRIENS,LRFLD)=LRVAL
 . ;W !,"LRFDA(45,"_LRSUBFLE_","_LRIENS_LRFLD_")="_LRVAL
 K LRAR1
 Q
GNDE ; RETRIEVES NODES FROM THE TRANSPORT MULTIPLE
 S LRMLT="",LRCTR=1
 D GETS^DIQ(64.8117,LRTRIEN_","_LRIEN_",",LRMLT_"*","INZ","LRAR1")
 S LRNODE="LRAR1(64.8117_LRMLT)"
 D SETUP
 I $D(^LAB(64.81,50,2,LRTRIEN,1,0)) S LRNUM=$P(^LAB(64.81,50,2,LRTRIEN,1,0),U,4),LRSEQ=LRNUM+1
 E  I '$D(^LAB(64.81,50,2,LRTRIEN,1,0)) S LRSEQ=2
 S LRMLT=18
 D GETS^DIQ(64.8117,LRTRIEN_","_LRIEN_",",LRMLT_"*","INZ","LRAR1")
 S LRNODE="LRAR1(64.8117_LRMLT)"
 D SETUP
 S LRMLT=19,LRSEQ=1
 D GETS^DIQ(64.8117,LRTRIEN_","_LRIEN_",",LRMLT_"*","INZ","LRAR1")
 S LRNODE="LRAR1(64.8117_LRMLT)"
 D SETUP
 D AREC I $G(LRDBUG) W !,"NEW IEN=",$G(LRSIXT4(LRTRIEN))
 K LRSIXT4,LRFDA(45)
 Q
AREC ; ADDS ENTRIES FROM THE TRANSPORT MULTIPLE TO FILE 64
 D UPDATE^DIE("","LRFDA(45)","LRSIXT4","LROUT(45)")
 I $G(LROUT(45,"DIERR")) D
 . S LRENODE="LROUT(45,""DIERR"")"
 . D ERMSG
 K LRFDA(45)
 Q
ERMSG ;STUFF THE TEMP GLOBAL WITH ANY ERROR MESSAGES
 S LRN=$G(^XTMP("LRNLT642",1,0))+1
 S ^XTMP("LRNLT642",1,LRN,0)="|"_LRTRIEN_"|"_LRCODE_"|"_LRPROCNM_"|ERR"
 F  S LRENODE=$Q(@LRENODE) Q:LRENODE=""  D
 . S LRN=LRN+1
 . S ^XTMP("LRNLT642",1,LRN,0)="|"_LRENODE_"|="_@LRENODE
 S ^XTMP("LRNLT642",1,0)=LRN
 S LRERR=1
 K LRENODE
 Q
KREC ; DELETES THE RECORD FROM THE FILE
 Q:$G(LRDBUG)
 N DA,DIK
 S DA(1)=LRIEN,DA=LRTRIEN
 S DIK="^LAB(64.81,"_DA(1)_",2," D ^DIK
 Q
DSS ;Update WKLD CODE file , DSS Feeder Key (#14) field to 'Yes"
 ;for those NLT codes used for AP professional services
 ;D BMES^XPDUTL("Updating DSS Feeder Key for AP NLT Codes")
 N ERR,FDA,IEN,LST,OUT,NODE,X
 S NODE="^LAB(64.81,""AC"")"
 F  S NODE=$Q(@NODE) Q:$QS(NODE,2)'="AC"  D
 . S X=$P($$GET1^DIQ(64.8117,$QS(NODE,5)_","_$QS(NODE,4)_",",2,"I","ERR"),".")
 . Q:'X
 . K OUT,ERR
 . D FIND^DIC(64,"","@;1","M",X,"","C","","","OUT","ERR")
 . Q:$D(ERR)
 . S LST=0 F  S LST=$O(OUT("DILIST",2,LST)) Q:'LST  D
 . . S IEN=$G(OUT("DILIST",2,LST))
 . . Q:'($D(^LAM(IEN,0))#2)
 . . K FDA,ERR S FDA(1,64,IEN_",",14)=1
 . . D FILE^DIE("","FDA(1)","ERR")
 . . I $D(ERR) W !,$C(7),ERR
 . . W "*"
 ;D BMES^LR334("Update DSS AP Feeder Key Complete")
 Q 

DIQGDDF ;SFISC/DCL,MMW-DD ATTRIBUTE RETRIEVER (FILES) ;12:44 PM  26 Sep 1996
 ;;22.2;VA FileMan;;Jan 05, 2016;Build 42
 ;;Per VA Directive 6402, this routine should not be modified.
 ;;Submitted to OSEHRA 5 January 2015 by the VISTA Expertise Network.
 ;;Based on Medsphere Systems Corporation's MSC FileMan 1051.
 ;;Licensed under the terms of the Apache License, Version 2.0.
 ;
 Q  ;not for interactive use
FILE(DIQGR,DR,DIQGPARM,DIQGTA,DIQGERRA,DIQGIPAR) ;
EN2 N DA
 I '$G(DIQGR),$G(DIQGR)]"",$D(^DIC("B",DIQGR)) S DIQGR=$O(^(DIQGR,""))
 N DIQGERR,DIQGEY,DIQGSAL,DIQGFNUL,DIQGSALX,DIQGTAXX
 S DIQGEY(1)=$G(DIQGR)
 I $G(U)'="^" N U S U="^"
 I $G(DIQGIPAR)'["A" K DIERR,^TMP("DIERR",$J)
 I $G(DIQGR)'>0 D 202^DIQGDD("FILE") Q
 I $D(^DD(DIQGR,0))[0 D 202^DIQGDD("FILE") Q
 S DA=DIQGR,DIQGR=1 I '$D(^DIC(DA,0)) D 202^DIQGDD("FILE") Q
 I $G(DIQGTA)']"" D 202^DIQGDD("TARGET ARRAY") Q
 S DIQGPARM=$G(DIQGPARM),DIQGFNUL=DIQGPARM["N"
 I DA'>0 S DIQGEY(3)=DA D 200^DIQGDD Q
 D BLDSAL^DIQGDD(1,.DR,.DIQGSAL)
 I '$D(DIQGSAL),'$D(DIERR) D 200^DIQGDD Q
 I '$D(DIQGSAL) Q
 S DIQGSAL="" F  S DIQGSAL=$O(DIQGSAL(DIQGSAL)) Q:DIQGSAL=""  D
 .I DIQGSAL="REQUIRED IDENTIFIERS" D  Q
 ..N X
 ..S X=$$RIF^DIQGDDU(DA,DIQGSAL,DIQGTA)
 ..S:X]"" @DIQGTA@(DIQGSAL)=X
 ..Q
 .S DIQGTAXX=$S('$D(DIQGSAL(DIQGSAL,"#(word-processing)")):DIQGTA,1:$$OREF^DIQGDD(DIQGTA)_$$Q^DIQGDD(DIQGSAL)_")")
 .S DIQGSALX=$$GET^DIQG("^DIC(",DA,DIQGSAL(DIQGSAL),DIQGPARM,DIQGTAXX,"","1A")
SETF .I DIQGSALX]"" S @DIQGTA@(DIQGSAL)=DIQGSALX Q
 .Q:DIQGFNUL
 .S @DIQGTA@(DIQGSAL)=DIQGSALX
 .Q
 Q

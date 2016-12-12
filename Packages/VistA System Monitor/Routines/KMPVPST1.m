KMPVPST1 ;SP/JML - VSM VERSION 1 POST INSTALL ROUTINE ;9/1/2015
 ;;1.0;VISTA SYSTEM MONITOR;;9/1/2015;Build 89
 ;
 ;
 ;
 N %DT,FDA,X,Y,KMPVDATE,KMPVERR,KMPVMSG,DA,DIK
 S X="T",%DT="ESTX" D ^%DT S KMPVDATE=Y
 ;
 ; KILL ^KMPV in case routine is being run more than once.
 S DA=0,DIK="^KMPV(8969,"
 F  S DA=$O(^KMPV(8969,DA)) Q:+DA=0  D ^DIK
 S DA=0,DIK="^KMPV(8969.02,"
 F  S DA=$O(^KMPV(8969.02,DA)) Q:+DA=0  D ^DIK
 ;
 ; create entries in the VSM CONFIGURAION file for VTCM and VSTM
 ; VTCM
 K FDA,KMPVERR
 S FDA($J,8969,"+1,",.01)="VTCM"
 S FDA($J,8969,"+1,",.02)=0
 S FDA($J,8969,"+1,",.03)="VISTA TIMED COLLECTION MONITOR"
 S FDA($J,8969,"+1,",.04)=1
 S FDA($J,8969,"+1,",.05)=KMPVDATE
 S FDA($J,8969,"+1,",1.01)=7
 S FDA($J,8969,"+1,",1.02)=5
 S FDA($J,8969,"+1,",1.03)="KMPVVTCM"
 S FDA($J,8969,"+1,",1.04)=0
 S FDA($J,8969,"+1,",1.05)="1D"
 S FDA($J,8969,"+1,",1.06)="T+1@01"
 S FDA($J,8969,"+1,",1.07)="KMPV VTCM DATA TRANSMISSION"
 S FDA($J,8969,"+1,",3.01)="s.server@domain.ext"
 S FDA($J,8969,"+1,",3.02)="G.mailgroup@domain.ext"
 S FDA($J,8969,"+1,",3.03)="s.server@domain.ext"
 ; VSTM
 S FDA($J,8969,"+2,",.01)="VSTM"
 S FDA($J,8969,"+2,",.02)=0
 S FDA($J,8969,"+2,",.03)="VISTA STORAGE MONITOR"
 S FDA($J,8969,"+2,",.04)=1
 S FDA($J,8969,"+2,",.05)=KMPVDATE
 S FDA($J,8969,"+2,",1.01)=7
 S FDA($J,8969,"+2,",1.02)=60
 S FDA($J,8969,"+2,",1.03)="KMPVVSTM"
 S FDA($J,8969,"+2,",1.04)=0
 S FDA($J,8969,"+2,",1.05)="1D"
 S FDA($J,8969,"+2,",1.06)="T+1@01"
 S FDA($J,8969,"+2,",1.07)="KMPV VSTM DATA TRANSMISSION"
 S FDA($J,8969,"+2,",3.01)="s.server@domain.ext"
 S FDA($J,8969,"+2,",3.02)="G.mailgroup@domain.ext"
 S FDA($J,8969,"+2,",3.03)="s.server@domain.ext"
 D UPDATE^DIE("","FDA($J)","ZIEN","KMPVERR")
 I $D(KMPVERR) D
 .S KMPVMSG(1)="There was an error in updating the 'VSM CONFIGURATION' file!"
 .S KMPVMSG(2)="Please send message to G.mailgroup@domain.ext for support."
 .S KMPVMSG(3)="OR send email to 'VA IT ESE CPE System Engineering' via Exchange."
 .D MES^XPDUTL(.KMPVMSG)
 ;
 ; create entries in the VSM MONITOR DEFAULTS file for VTCM and VSTM
 ; VTCM
 K FDA,KMPVERR
 S FDA($J,8969.02,"+1,",.01)="VTCM"
 S FDA($J,8969.02,"+1,",.02)=7
 S FDA($J,8969.02,"+1,",.03)=5
 S FDA($J,8969.02,"+1,",.04)="KMPVVTCM"
 S FDA($J,8969.02,"+1,",.05)=0
 S FDA($J,8969.02,"+1,",.06)="1D"
 S FDA($J,8969.02,"+1,",.07)="T+1@01"
 S FDA($J,8969.02,"+1,",.08)="KMPV VTCM DATA TRANSMISSION"
 S FDA($J,8969.02,"+1,",1.01)="s.server@domain.ext"
 S FDA($J,8969.02,"+1,",1.02)="G.mailgroup@domain.ext"
 S FDA($J,8969.02,"+1,",1.03)="s.server@domain.ext"
 ; VSTM
 S FDA($J,8969.02,"+2,",.01)="VSTM"
 S FDA($J,8969.02,"+2,",.02)=7
 S FDA($J,8969.02,"+2,",.03)=60
 S FDA($J,8969.02,"+2,",.04)="KMPVVSTM"
 S FDA($J,8969.02,"+2,",.05)=0
 S FDA($J,8969.02,"+2,",.06)="1D"
 S FDA($J,8969.02,"+2,",.07)="T+1@01"
 S FDA($J,8969.02,"+2,",.08)="KMPV VSTM DATA TRANSMISSION"
 S FDA($J,8969.02,"+2,",1.01)="s.server@domain.ext"
 S FDA($J,8969.02,"+2,",1.02)="G.mailgroup@domain.ext"
 S FDA($J,8969.02,"+2,",1.03)="s.server@domain.ext"
 D UPDATE^DIE("","FDA($J)","ZIEN","KMPVERR")
 I $D(KMPVERR) D
 .S KMPVMSG(1)="There was an error in updating the 'VSM MONITOR DEFAULTS' file!"
 .S KMPVMSG(2)="Please send message to G.mailgroup@domain.ext for support."
 .S KMPVMSG(3)="OR send email to 'VA IT ESE CPE System Engineering' via Exchange."
 .D MES^XPDUTL(.KMPVMSG)
 ;
 ; START MONITORS
 D STARTMON^KMPVCBG("VTCM",1)
 D STARTMON^KMPVCBG("VSTM",1)
 ;
 Q

PXRMP18I ;SLC/PKR - Inits for PXRM*2.0*18. ;10/06/2011
 ;;2.0;CLINICAL REMINDERS;**18**;Feb 04, 2005;Build 152
 Q
 ;==========================================
BSPONB ;Rebuild the B and BN index for the Sponsor file so it matches the
 ;length of the .01.
 N DIK
 S DIK="^PXRMD(811.6,"
 S DIK(1)=".01"
 D BMES^XPDUTL("Rebuilding Sponsor B and BN indexes.")
 K ^PXRMD(811.6,"B"),^PXRMD(811.6,"BN")
 D ENALL^DIK
 Q
 ;
 ;==========================================
CDUERB ;Rebuild custom date due date structure
 N CDUE,IEN,NAME
 D BMES^XPDUTL("Rebuilding Custom Date Due data structures.")
 S NAME=""
 F  S NAME=$O(^PXD(811.9,"B",NAME)) Q:NAME=""  D
 . S IEN=$O(^PXD(811.9,"B",NAME,""))
 . S CDUE=$G(^PXD(811.9,IEN,45))
 . I CDUE="" Q
 . D CDKILL^PXRMCDUE(CDUE,IEN)
 . D CDBUILD^PXRMCDUE(CDUE,IEN)
 Q
 ;
 ;==========================================
CFINC(Y) ;List of computed findings to include in the build.
 N CFLIST,CFNAME
 S CFLIST("VA-ACTIVE PATIENT RECORD FLAGS")=""
 S CFLIST("VA-APPOINTMENTS FOR A PATIENT")=""
 S CFLIST("VA-FILEMAN DATE")=""
 S CFLIST("VA-PCMM PATIENTS ASSIGNED TO A PRACTITIONER")=""
 S CFLIST("VA-PCMM PATIENTS ASSIGNED TO A TEAM")=""
 S CFLIST("VA-PCMM PC TEAM AND INSTITUTION")=""
 S CFLIST("VA-PCMM PRACTITIONERS ASSIGNED TO A PATIENT")=""
 S CFLIST("VA-PATIENT RECORD FLAG INFORMATION")=""
 S CFLIST("VA-PATIENT RECORD FLAG LIST")=""
 S CFLIST("VA-RANDOM NUMBER")=""
 S CFLIST("VA-WAS INPATIENT")=""
 ;S CFLIST("")=""
 S CFNAME=$P($G(^PXRMD(811.4,Y,0)),U)
 Q $S($D(CFLIST(CFNAME)):1,1:0)
 ;
 ;==========================================
CFPRS ;Set the value of the CF PARAMETER REQUIRED field to YES for the 
 ;national computed findings where it is required.
 D BMES^XPDUTL("Setting CF PARAMETER REQUIRED field for national computed findings.")
 N CFLIST,CFNAME,IEN
 S CFLIST("VA-ACTIVE PATIENT RECORD FLAGS")=""
 S CFLIST("VA-ADMISSIONS FOR A DATE RANGE")=""
 S CFLIST("VA-ALLERGY")=""
 S CFLIST("VA-APPOINTMENTS FOR A PATIENT")=""
 S CFLIST("VA-ASU USER CLASS")=""
 S CFLIST("VA-DATE FOR AGE")=""
 S CFLIST("VA-FILEMAN DATE")=""
 S CFLIST("VA-PATIENT RECORD FLAG INFORMATION")=""
 S CFLIST("VA-PATIENT RECORD FLAG LIST")=""
 S CFLIST("VA-PATIENTS WITH APPOINTMENTS")=""
 S CFLIST("VA-PCMM PATIENTS ASSIGNED TO A PRACTITIONER")=""
 S CFLIST("VA-PCMM PATIENTS ASSIGNED TO A TEAM")=""
 S CFLIST("VA-PROGRESS NOTE")=""
 S CFLIST("VA-RANDOM NUMBER")=""
 S CFLIST("VA-REMINDER DEFINITION")=""
 S CFNAME=""
 F  S CFNAME=$O(CFLIST(CFNAME)) Q:CFNAME=""  D
 . S IEN=$O(^PXRMD(811.4,"B",CFNAME,""))
 . I IEN="" Q
 . S $P(^PXRMD(811.4,IEN,0),U,6)=1
 Q
 ;
 ;==========================================
DELDD ;Delete the old data dictionaries.
 N DIU,TEXT
 D EN^DDIOL("Removing old data dictionaries.")
 S DIU(0)=""
 F DIU=801.41,802.4,811.4,811.6,811.9 D
 . S TEXT=" Deleting data dictionary for file # "_DIU
 . D EN^DDIOL(TEXT)
 . D EN^DIU2
 Q
 ;
 ;==========================================
DELFE ;Delete some file entries.
 D DELTLFE^PXRMUTIL(801.41,"VA-MH NOSHOW CONSULT W/SPC&PLAN HF GP")
 D DELTLFE^PXRMUTIL(801.41,"VA-MH NOSHOW CONSULT W/SPC&PLAN WP")
 ;
 D DELTLFE^PXRMUTIL(811.5,"VA-MH NOSHOW CONSULT W/SUPRV&PLAN")
 Q
 ;
 ;==========================================
FFCLEAN ;Remove pieces 4 and 5 from the 0 node of 802.4 since they are no
 ;longer defined.
 N IEN,ZTEMP
 S IEN=0
 F  S IEN=+$O(^PXRMD(802.4,IEN)) Q:IEN=0  D
 . S ZTEMP=$P(^PXRMD(802.4,IEN,0),U,1,4)
 . S ^PXRMD(802.4,IEN,0)=ZTEMP
 Q
 ;
 ;==========================================
INILT ;Initialize list templates
 ;N IEN,IND,LIST,TEMP0
 ;D LTL^PXRMP12I(.LIST)
 ;S IND=0
 ;IA #4123
 ;F  S IND=$O(LIST(IND)) Q:IND=""  D
 ;. S IEN=$O(^SD(409.61,"B",LIST(IND),"")) Q:IEN=""
 ;. S TEMP0=$G(^SD(409.61,IEN,0))
 ;. K ^SD(409.61,IEN)
 ;. S ^SD(409.61,IEN,0)=TEMP0
 Q
 ;
 ;==========================================
LTL(LIST) ;This is the list of list templates that being distributed
 ;in the patch.
 ;S LIST(1)="PXRM EX LIST COMPONENTS"
 ;S LIST(2)="PXRM EX REMINDER EXCHANGE"
 Q
 ;
 ;==========================================
PRE ;Pre-init
 ;Disable options and protocols
 D OPTION^PXRMUTIL("DISABLE")
 D PROTOCOL^PXRMUTIL("DISABLE")
 D RENAME^PXRMP18I
 D DELEXE^PXRMEXSI("EXARRAY","PXRMP18E")
 D DELDD^PXRMP18I
 Q
 ;
 ;==========================================
POST ;Post-init
 D CDUERB^PXRMP18I
 ;Enable options and protocols
 D OPTION^PXRMUTIL("ENABLE")
 D PROTOCOL^PXRMUTIL("ENABLE")
 D SETPVER^PXRMUTIL("2.0P18")
 D FFCLEAN^PXRMP18I
 D BSPONB^PXRMP18I
 ;Install Exchange File entries.
 D SMEXINS^PXRMEXSI("EXARRAY","PXRMP18E")
 ;Make sure national computed finding print names start with VA-.
 D RCFPN^PXRMP18I
 D CFPRS^PXRMP18I
 D DELFE^PXRMP18I
 D SENDIM^PXRMP18I
 Q
 ;
 ;==========================================
RENAME ;Rename various file entries.
 N PXRMINST
 S PXRMINST=1
 D RENAME^PXRMUTIL(801.41,"VA-MH NOSHOW CONSULT W/SUPRV&PLAN HF GP","VA-MH NOSHOW PLAN DEVELOPED HF GP")
 D RENAME^PXRMUTIL(801.41,"VA-MH NOSHOW CONSULT W/SUPRV&PLAN WP GP","VA-MH NOSHOW PLAN DEVELOPED WP GP")
 D RENAME^PXRMUTIL(801.41,"VA-MH NOSHOW CONSULT W/SUPRV&PLAN WP","VA-MH NOSHOW PLAN DEVELOPED WP")
 D RENAME^PXRMUTIL(801.41,"VA-MH SUICIDE ATTEMPT SBR&PLAN HF","VA-MH SUICIDE ATTEMPTED HF")
 D RENAME^PXRMUTIL(801.41,"VA-MH SUICIDE COMPLETED SBR HF","VA-MH SUICIDE COMPLETED HF")
 ;
 D RENAME^PXRMUTIL(802.4,"DIFF_DT","DTIME_DIFF")
 ;
 D RENAME^PXRMUTIL(811.5,"VA-MH NOSHOW INITIATE WELFARE CHECK","VA-MH NOSHOW INITIATE WELLNESS CHECK")
 D RENAME^PXRMUTIL(811.5,"VA-MH NOSHOW CONSULT W/SPC&PLAN","VA-MH NOSHOW PLAN DEVELOPED")
 D RENAME^PXRMUTIL(811.5,"VA-MH SUICIDE ATTEMPT SBR&PLAN","VA-MH SUICIDE ATTEMPTED")
 D RENAME^PXRMUTIL(811.5,"VA-MH SUICIDE COMPLETED SBR","VA-MH SUICIDE COMPLETED")
 ;
 D RENAME^PXRMUTIL(9999999.64,"MH NOSHOW INITIATE WELFARE CHECK","MH NOSHOW INITIATE WELLNESS CHECK")
 D RENAME^PXRMUTIL(9999999.64,"MH NOSHOW CONSULT W/SPC&PLAN","MH NOSHOW PLAN DEVELOPED")
 D RENAME^PXRMUTIL(9999999.64,"MH SUICIDE ATTEMPT-SBR&PLAN","MH SUICIDE ATTEMPTED")
 D RENAME^PXRMUTIL(9999999.64,"MH SUICIDE COMPLETED-SBR","MH SUICIDE COMPLETED")
 Q
 ;
 ;==========================================
RCFPN ;Make sure the print names of all national computed findings
 ;start with VA-.
 N IEN,NAME,PNAME,TEXT
 D BMES^XPDUTL("Checking national computed finding print names.")
 S NAME=""
 F  S NAME=$O(^PXRMD(811.4,"B",NAME)) Q:NAME=""  D
 . S IEN=$O(^PXRMD(811.4,"B",NAME,""))
 . I $P(^PXRMD(811.4,IEN,100),U,1)'="N" Q
 . S PNAME=$P(^PXRMD(811.4,IEN,0),U,4)
 . I $E(PNAME,1,3)="VA-" Q
 . K TEXT
 . S TEXT(1)=" "
 . S TEXT(2)="CF "_NAME
 . S TEXT(3)="Print Name: "_PNAME
 . I (NAME="VA-PATIENT TYPE") S PNAME="Patient Type"
 . I (NAME="VA-TREATING FACILITY LIST") S PNAME="Treating Facility List"
 . I (NAME="VA-WH PAP SMEAR ABNORMAL IN WH PKG"),(PNAME="") D
 .. S PNAME="WH Pap Smear Abnormal in WH pkg"
 . I (NAME="VA-WH MAMMOGRAM ABNORMAL IN WH PKG"),(PNAME="") D
 .. S PNAME="WH Mammogram Abnormal in WH pkg"
 . S PNAME="VA-"_PNAME
 . S TEXT(4)="New print Name: "_PNAME
 . D MES^XPDUTL(.TEXT)
 . S $P(^PXRMD(811.4,IEN,0),U,4)=PNAME
 Q
 ;
 ;==========================================
SENDIM ;Send install message.
 N FROM,NODE,PARAM,SYSTEM,SUBJECT,TO,VALUE
 S NODE="PXRM*2.0*18"
 K ^TMP(NODE,$J)
 ;DBIA #1131 for ^XMB("NETNAME")
 S FROM="PXRM*2.0*18 Install@"_^XMB("NETNAME")
 ;DBIA #2541
 S SYSTEM=$$KSP^XUPARAM("WHERE")
 I $$PROD^XUPROD(1) S TO("G.CLINICAL REMINDERS SUPPORT@DOMAIN.EXT")=""
 E  D
 . N MGIEN,MGROUP
 . S MGIEN=$G(^PXRM(800,1,"MGFE"))
 . S MGROUP=$S(MGIEN'="":"G."_$$GET1^DIQ(3.8,MGIEN,.01),1:DUZ)
 . S TO(MGROUP)=""
 S SUBJECT="Install of PXRM*2.0*18"
 S ^TMP(NODE,$J,1,0)="PXRM*2.0*18 has been installed."
 S ^TMP(NODE,$J,2,0)="System is "_SYSTEM
 D SEND^PXRMMSG(NODE,SUBJECT,.TO,FROM)
 Q
 ;

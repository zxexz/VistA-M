MHV1P40 ;ALB/BAA - MHV*1*40 POST INIT: PHARMACY FIELDS UPDATE;
 ;;1.0;My HealtheVet;**40**;Aug 23, 2005;Build 26
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 Q
 ;
POST ; New pharmacy fields POST-INSTALL
 ;
 D LOG^MHVUL2("MHV1P40","POST-INIT BEGIN","S","TRACE")
 ;
 D RTYP ; Add new MHV REQUEST TYPE (#2275.3)
 ;
 D LOG^MHVUL2("MHV1P40","POST-INIT end","S","TRACE")
 Q
 ;
 ;
RTYP ; Add New MHV REQUEST TYPE (#2275.3)
 N FLDS,ERR,NEW
 ;
 D LOG^MHVUL2("MHV1P40","Add new MHV REQUEST TYPE start","S","TRACE")
 ;
 I $D(^MHV(2275.3,"B","MEDICATIONS")) D  Q
 .  D LOG^MHVUL2("MHV1P40","MHV REQUEST TYPE EXISTS - NOT ADDED","S","TRACE")
 ;
 S DUZ=.5
 S DT=$$DT^XLFDT
 S FLDS("REQUEST TYPE")="MEDICATIONS"
 S FLDS("NUMBER")=50
 S FLDS("BLOCK")=0
 S FLDS("REALTIME")=1
 S FLDS("EXECUTE")="EXTRACT~MHVXRXM"
 S FLDS("BUILDER")="MHV7B1R"
 S FLDS("DATATYPE")="Medications"
 S FLDS("DESCRIPTION",1)="QBP^Q13 query for Medications"
 S FLDS("DESCRIPTION",2)="Grabs Medications from multiple sources"
 S NEW=1  ;set to 1 for new entry or 0 to update an entry
 D UPDREQ^MHVU2(.FLDS,NEW,.ERR)
 I ERR'="" D LOG^MHVUL2("MHV1P40","MHV ERROR : "_ERR,"S","TRACE")
 ;
 D LOG^MHVUL2("MHV1P40","Add new MHV REQUEST TYPE end","S","TRACE")
 Q

SDECAPP ;ALB/SAT - VISTA SCHEDULING RPCS ;APR 08, 2016
 ;;5.3;Scheduling;**642**;Aug 13, 1993;Build 23
 ;
 Q
 ;
GETYPE(SDECY,SDIEN) ;GET Appointment Type for the given SDEC APPOINTMENT
 ;INPUT:
 ; SDIEN  - Appointment Id pointer to SDEC APPOINTMENT file 409.84
 ;RETURN:
 ; APPTTYPE_IEN ^ APPTTYPE_NAME
 N SDTI,SDTN
 S SDECY=$NA(^TMP("SDECAPP",$J,"GETYPE"))
 K @SDECY
 S @SDECY@(0)="T00020APPTTYPE_IEN^T00030APPTTYPE_NAME"_$C(30)
 S SDIEN=$G(SDIEN)
 I '$D(^SDEC(409.84,+SDIEN,0)) S @SDECY@(1)="-1^Invalid Appointment ID"_$C(30,31) Q
 S SDTI=$$GET1^DIQ(409.84,+SDIEN_",",.06,"I")
 S SDTN=$$GET1^DIQ(409.84,+SDIEN_",",.06)
 S @SDECY@(1)=SDTI_U_SDTN_$C(30,31)
 Q

PSOERXU2 ;ALB/BWF - eRx utilities ; 5/26/2017 9:57am
 ;;7.0;OUTPATIENT PHARMACY;**508**;DEC 1997;Build 295
 ;
 Q
 ; look for existing patient
 ; NAME - PATIENT FULL NAME
 ; IDOB - INCOMING PATIENT DOB
 ; IDGEN - INCOMING PATIENT GENDER
 ; SSN - INCOMING PATIENT SSN
 ; AL1 - INCOMING PATIENT ADDRESS LINE 1
FINDPAT(NAME,IDOB,IGEN,SSN,AL1) ;
 N MPAT,MTCHCNT,PIEN,MATCH,PDOB,PGEN,PSSN,PAL1
 ; for now, quit if name match does not occur.
 I '$D(^PS(52.46,"BN",NAME)) Q ""
 S MTCHCNT=0
 S PIEN=0 F  S PIEN=$O(^PS(52.46,"BN",NAME,PIEN)) Q:'PIEN  D
 .S PDOB=$$GET1^DIQ(52.46,PIEN,.08,"I"),PGEN=$$GET1^DIQ(52.46,PIEN,.07,"I")
 .S PSSN=$$GET1^DIQ(52.46,PIEN,1.4),PAL1=$$GET1^DIQ(52.46,PIEN,3.1,"E")
 .; if the ssn exists, and does not match, quit
 .I $L(SSN),SSN'=PSSN Q
 .I PDOB=IDOB,PGEN=IGEN,AL1=PAL1 S MTCHCNT=MTCHCNT+1,MATCH(PIEN)=""
 I MTCHCNT'=1 Q ""
 S MPAT=$O(MATCH(0))
 I MPAT Q MPAT
 Q ""
 ; look for existing provider/prescriber
FINDPRE(NAME,NPI,DEA) ;
 N NPCNT,NPIMTCH,NLIST,NLCNT,NLOOP,NLIST2,NAMEMTCH,NMLOOP,NMCNT,NMLIST,DCNT,DEAMTCH,DLCNT,DLIST,DLIST2
 N DLOOP,DMTCH,NPDEA
 ; if there is an NPI, and DEA#, check both. If only one match, then this is the same provider
 I $L(NPI) D  Q NPIMTCH
 .I '$D(^PS(52.48,"C",NPI)) S NPIMTCH="" Q
 .S NPCNT=0
 .S NPIMTCH=0 F  S NPIMTCH=$O(^PS(52.48,"C",NPI,NPIMTCH)) Q:'NPIMTCH  D
 ..S NPDEA=$$GET1^DIQ(52.48,NPIMTCH,1.6,"E") I $L(DEA),NPDEA'=DEA Q
 ..S NLIST(NPIMTCH)="",NPCNT=NPCNT+1
 .; if we have a single match for NPI and DEA# return the result
 .I NPCNT=0 S NPIMTCH="" Q
 .I NPCNT=1 S NPIMTCH=$O(NLIST(0)) Q
 .S NLCNT=0
 .S NLOOP=0 F  S NLOOP=$O(NLIST(NLOOP)) Q:'NLOOP  D
 ..I $L(NAME),NAME=$$GET1^DIQ(52.48,NLOOP,.01,"E") S NLIST2(NLOOP)="",NLCNT=NLCNT+1
 .I NLCNT=0!(NLCNT>1) S NPIMTCH="" Q
 .I NLCNT=1 S NPIMTCH=$O(NLIST2(0)) Q
 I $L(DEA) D  Q DEAMTCH
 .I '$D(^PS(52.48,"D",DEA)) S DEAMTCH="" Q
 .S (DCNT,DMTCH)=0 F  S DMTCH=$O(^PS(52.48,"D",DEA,DMTCH)) Q:'DMTCH  D
 ..S DLIST(DMTCH)="",DCNT=DCNT+1
 .I DCNT=0 S DEAMTCH="" Q
 .I DCNT=1 S DEAMTCH=$O(DLIST(0)) Q
 .S (DLOOP,DLCNT)=0 F  S DLOOP=$O(DLIST(DLOOP)) Q:'DLOOP  D
 ..I $L(NAME),NAME=$$GET1^DIQ(52.48,DLOOP,.01,"E") S DLIST2(DLOOP)="",DLCNT=DLCNT+1
 .I DLCNT=0!(DLCNT>1) S DEAMTCH="" Q
 .I DLCNT=1 S DEAMTCH=$O(DLIST2(0))
 I $L(NAME) D  Q NAMEMTCH
 .I '$D(^PS(52.48,"BN",NAME)) S NAMEMTCH="" Q
 .S (NMLOOP,NMCNT)=0 F  S NMLOOP=$O(^PS(52.48,"BN",NAME,NMLOOP)) Q:'NMLOOP  D
 ..S NMLIST(NMLOOP)="",NMCNT=NMCNT+1
 .I NMCNT=0!(NMCNT>1) S NAMEMTCH="" Q
 .S NAMEMTCH=$O(NMLIST(0))
 Q ""
ERR(ERXIEN,MTYPE) ;
 N GL,ECODE,DESCODE,ERRTEXT,DONE,I,REQIEN,REQTYP,ERXTYP
 S GL=$NA(^TMP($J,"PSOERXO1","Message",0,"Body",0,MTYPE,0))
 S ECODE=$G(@GL@("Code",0))
 S ERRTEXT=$G(@GL@("Description",0))
 S FDA(52.49,ERXIEN_",",60.1)=ECODE
 S FDA(52.49,ERXIEN_",",60)=ERRTEXT
 D FILE^DIE(,"FDA") K FDA
 S DONE=0
 F I=0:1 D  Q:DONE  D
 .I '$D(@GL@("DescriptionCode",I)) S DONE=1 Q
 .S DESCODE=$G(@GL@("DescriptionCode",I))
 .S DESCODE=$$PRESOLV^PSOERXA1(DESCODE,"ERR") Q:'DESCODE
 .Q:$D(^PS(52.49,ERXIEN,61,"B",DESCODE))
 .S FDA(52.4961,"+1,"_ERXIEN_",",.01)=DESCODE D UPDATE^DIE(,"FDA") K FDA
 S ERXTYP=$$GET1^DIQ(52.49,ERXIEN,.08,"I")
 S REQIEN=$$RESOLV(ERXIEN)
 I REQIEN D  Q
 .S REQTYP=$$GET1^DIQ(52.49,REQIEN,.08,"I")
 .I REQTYP="RR" D UPDSTAT^PSOERXU1(REQIEN,"RRE"),UPDSTAT^PSOERXU1(ERXIEN,"RRE")
 .I REQTYP="CN" D UPDSTAT^PSOERXU1(REQIEN,"CNE"),UPDSTAT^PSOERXU1(ERXIEN,"CNE")
 D UPDSTAT^PSOERXU1(ERXIEN,"E")
 Q
GETSTAT(MTYPE,RTHID,RTMID) ;
 N ESTAT,RTMTYPE,STFDA,RTMIEN,RESTAT
 ; if this is a cancel request, set the initial status to CAR - cancel request received
 I MTYPE="CA" Q $$PRESOLV^PSOERXA1("CAR","ERX")
 I 'RTHID,'RTMID S ESTAT=$S(MTYPE="RR":"RRN",MTYPE="RE":"RXR",MTYPE="N":"N",1:"N") Q $$PRESOLV^PSOERXA1(ESTAT,"ERX")
 ; old related to message resolving logic - leave in place for change request/response - may be needed
 ;S RTMIEN=$$FIND1^DIC(52.49,,,RTMID,"CHVID",,"ERR") I 'RTMIEN Q ""
 S RTMIEN=RTHID
 I MTYPE="IE",'$L(RTMIEN) S ESTAT="E" Q $$PRESOLV^PSOERXA1(ESTAT,"ERX")
 I MTYPE="IE",$L(RTMIEN) D
 .S RTMTYPE=$$GET1^DIQ(52.49,RTMIEN,.08,"I")
 .I RTMTYPE="RR" S RESTAT=$$PRESOLV^PSOERXA1("RRE","ERX"),STFDA(52.49,RTMIEN_",",1)=RESTAT D UPDATE^DIE(,"STFDA") K STFDA
 I MTYPE="RE",$L(RTMIEN) D
 .S RTMTYPE=$$GET1^DIQ(52.49,RTMIEN,.08,"I")
 .I RTMTYPE="RR" S RESTAT=$$PRESOLV^PSOERXA1("RRR","ERX"),STFDA(52.49,RTMIEN_",",1)=RESTAT D UPDATE^DIE(,"STFDA") K STFDA
 I $G(ESTAT) Q ESTAT
 S ESTAT=$S(MTYPE="RR":"RRN",MTYPE="RE":"RXN",MTYPE="N":"N",1:"N")
 I ESTAT="" Q ""
 I '$D(^PS(52.45,"C","ERX",ESTAT)) Q ""
 Q $$PRESOLV^PSOERXA1(ESTAT,"ERX")
ADDCOMM(ERXIEN) ;
 N DIR,Y,FDA,MTYPE
 D FULL^VALM1
 S VALMBCK="R"
 S MTYPE=$$GET1^DIQ(52.49,ERXIEN,.08,"I")
 I "RR,RE,CA,CN"'[MTYPE!(MTYPE="N") S DIR(0)="E" W !!,"This option can only be used to add comments to request and response message",!,"types." D ^DIR K DIR Q
 S DIR(0)="52.49,50",DIR("B")=$$GET1^DIQ(52.49,ERXIEN,50,"E") D ^DIR
 Q:Y="^"!(Y="")
 S FDA(52.49,ERXIEN_",",50)=Y
 S FDA(52.49,ERXIEN_",",50.1)=DUZ
 S FDA(52.49,ERXIEN_",",50.2)=$$NOW^XLFDT()
 D FILE^DIE(,"FDA")
 D INIT^PSOERX1
 Q
RESOLV(IEN) ;
 N RTHID,RTHIEN,RES
 S RTHID=$$GET1^DIQ(52.49,IEN,.14,"E")
 S RTHIEN=$$FIND1^DIC(52.49,,,RTHID,"FMID",,"RES")
 I 'RTHIEN,$D(RES) Q "0^Could not find related message."
 Q RTHIEN
GETREQ(IEN) ;
 N RTMID,RTHIEN
 S RTMID=$$GET1^DIQ(52.49,IEN,.02,"E")
 S RTHIEN=$$FIND1^DIC(52.49,,,RTMID,"CHVID",,"RES")
 I 'RTHIEN,$D(RES) Q "0^Could not find related message."
 Q RTHIEN
GETRESP(IEN) ;
 N MID,RTHIEN
 S MID=$$GET1^DIQ(52.49,IEN,.01,"E")
 S RTHIEN=$$FIND1^DIC(52.49,,,MID,"RTHID",,"RES")
 I 'RTHIEN,$D(RES) Q "0^Could not find related message."
 Q RTHIEN
MSGHIST(RES,IEN) ;
 N SIEN,RELIEN
 S SIEN=0
 F  S SIEN=$O(^PS(52.49,IEN,201,SIEN)) Q:'SIEN  D
 .S RELIEN=$$GET1^DIQ(52.49201,SIEN_","_IEN_",",.01,"I")
 .S RES(RELIEN)=""
 Q
 ; REFREQ - erx refill request IEN
 ; REFRES - erx refill response IEN
 ; Determine deltas between refill request and response.
RRDELTA(DELTAS,REFREQ,REFRES) ;
 N FLDS,DONE,I,REQARY,RESARY,FLDNM,SFLDS,REQSIEN,FOUND,REQIENS,RESIENS,REQTYP,RESTYP,SFLD,SFLDS,FLDNM,SFLDNM,SREQVAL,SRESVAL
 N REQDAT,RESDAT,FIELD,SFIELD,FLD,REQVAL,RESVAL,RESSIEN
 ; first check the top level items
 S FLDS=".04;2.1;2.3"
 S DONE=0
 F I=1:1 D  Q:DONE
 .S FLD=$P(FLDS,";",I) I FLD="" S DONE=1 Q
 .S REQVAL=$$GET1^DIQ(52.49,REFREQ,FLD,"E")
 .S RESVAL=$$GET1^DIQ(52.49,REFRES,FLD,"E")
 .I REQVAL=RESVAL Q
 .D FIELD^DID(52.49,FLD,,"LABEL","FIELD")
 .S FLDNM=$G(FIELD("LABEL")) Q:'$L(FLDNM)
 .S DELTAS(52.49,FLDNM)=REQVAL_U_RESVAL
 S SFLDS=".06;.07;2.1"
 S (REQSIEN,FOUND)=0 F  S REQSIEN=$O(^PS(52.49,REFREQ,49,REQSIEN)) Q:'REQSIEN!(FOUND)  D
 .S REQIENS=REQSIEN_","_REFREQ_","
 .S REQTYP=$$GET1^DIQ(52.4949,REQIENS,.02,"I") I REQTYP="D" D  S FOUND=1 Q
 ..D GETS^DIQ(52.4949,REQIENS,SFLDS,"E","REQDAT")
 S (RESSIEN,FOUND)=0 F  S RESSIEN=$O(^PS(52.49,REFRES,49,RESSIEN)) Q:'RESSIEN!(FOUND)  D
 .S RESIENS=RESSIEN_","_REFRES_","
 .S RESTYP=$$GET1^DIQ(52.4949,RESIENS,.02,"I") I RESTYP="D" D  S FOUND=1 Q
 ..D GETS^DIQ(52.4949,RESIENS,SFLDS,"E","RESDAT")
 S DONE=0
 F I=1:1 D  Q:DONE
 .S SFLD=$P(SFLDS,";",I) I SFLD="" S DONE=1 Q
 .S (SREQVAL,SRESVAL)=""
 .I $D(REQIENS) S SREQVAL=$G(REQDAT(52.4949,REQIENS,SFLD,"E"))
 .I $D(RESIENS) S SRESVAL=$G(RESDAT(52.4949,RESIENS,SFLD,"E"))
 .I SREQVAL=SRESVAL Q
 .I $D(SRESVAL),SFLD=.06 S SRESVAL=$G(SRESVAL)-1
 .D FIELD^DID(52.4949,SFLD,,"LABEL","SFIELD")
 .S SFLDNM=$G(SFIELD("LABEL")) Q:'$L(SFLDNM)
 .S DELTAS(52.4949,SFLDNM)=SREQVAL_U_SRESVAL
 Q

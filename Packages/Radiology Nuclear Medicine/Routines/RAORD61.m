RAORD61 ;HISC/GJC-Print A Request Cont. ;2/2/98  15:28
 ;;5.0;Radiology/Nuclear Medicine;**45,68,47,123,143**;Mar 16, 1998;Build 11
 ;Per VHA Directive 2004-038, this routine should not be modified.
 ;11/18/05 KAM Remedy Call 100930 Remove extra dash lines
 ; 5-P123 6/23/2015 MJT RA*5*123 NSR 20140507 print weight & date taken in Radiology requests
 ;
TC ;technologist information & comment (called from RAORD6)
 ;*143 add RAEXST & RADTP
 N RA18FL,RA18ARR,RA18EX,RA18CNI,RA18DTI,RA18PRC,RA18ND,RA18TC,RAEXST,RADTP S RA18EX=0,RA18CNI=0
 ;11/18/05 KAM Modified next line - was G:RA18DTI="" DASHLN^RAORD6
 ; RA*5*143 - FIX FOR EXAMS AND EXAM SETS ORDERED IN ARREARS
 ;S RA18DTI=$O(^RADPT("AO",RAOIFN,RADFN,0)) Q:RA18DTI=""
 F  S RA18CNI=$O(^TMP($J,"RAE2",RADFN,RA18CNI)) Q:+RA18CNI=0  D  Q:RAX["^"
 . S RA18PRC=""
 . F  S RA18PRC=$O(^TMP($J,"RAE2",RADFN,RA18CNI,RA18PRC)) Q:RA18PRC=""  D  Q:RAX["^"
 .. S RA18DTI=0 F  S RA18DTI=$O(^TMP($J,"RAE2",RADFN,RA18CNI,RA18PRC,"DTI",RA18DTI)) Q:'RA18DTI  D
 ... ;case info
 ... I $$USESSAN^RAHLRU1() W !,"Case No: "_$P($G(^RADPT(RADFN,"DT",RA18DTI,"P",RA18CNI,0)),"^",31),!
 ... I '$$USESSAN^RAHLRU1() W !,"Case No: "_$P($G(^RADPT(RADFN,"DT",RA18DTI,"P",RA18CNI,0)),"^")
 ... S RA18FL=0,RA18ARR("FT")=""
 ... S RA18TC=0 F  S RA18TC=$O(^RADPT(RADFN,"DT",RA18DTI,"P",RA18CNI,"F",RA18TC)) Q:RA18TC=""  S RA18ARR("F")=$G(^RADPT(RADFN,"DT",RA18DTI,"P",RA18CNI,"F",RA18TC,0),0) D  Q:$L(RA18ARR("FT"))>32
 .... I RA18ARR("F")'=0 S RA18ARR("FT")=RA18ARR("FT")_$P($G(RA18ARR("F")),"^",2)_"-"_$P($G(^RA(78.4,$P($G(RA18ARR("F")),"^",1),0)),"^",1)_";"
 ... S RA18TC=0 F  S RA18TC=$O(^RADPT(RADFN,"DT",RA18DTI,"P",RA18CNI,"TC",RA18TC)) Q:RA18TC=""  S RA18ARR("T",RA18TC,0)=$G(^RADPT(RADFN,"DT",RA18DTI,"P",RA18CNI,"TC",RA18TC,0),0) D
 .... I RA18ARR("T",RA18TC,0)'=0 W:RA18FL>0 ! W ?14,"Tech: " I RA18ARR("T",RA18TC,0)'="" S RA18ARR("N")=$$GET1^DIQ(200,RA18ARR("T",RA18TC,0),.01) W $E($P(RA18ARR("N"),"^",1),1,18)
 .... W:(RA18FL'>0) ?38," Film: "_$E(RA18ARR("FT"),1,32)
 .... S RA18FL=RA18FL+1
 ... I '$D(RA18ARR("T")) W ?14,"Tech: ",?38," Film: "_$E(RA18ARR("FT"),1,32)
 ... K RA18ARR("T"),RA18ARR("F"),RA18ARR("N")
 ... I $O(^TMP($J,"RAE2",RADFN,RA18CNI,RA18PRC,"TCOM",0))>0 D  Q
 .... ;tech comm
 .... W !
 .... S RA18EX=$$TXTOUT^RAUTL11(^TMP($J,"RAE2",RADFN,RA18CNI,RA18PRC,"TCOM",1),1,70,-1,"",4,1,1,1)
 .... D HD^RAORD6:($Y+10)>IOSL   ; 5-P123
 Q

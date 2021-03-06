QACGEN ;HISC/CEW,DAD - Issue Totals for All or by Gender ;5/30/95  15:32
 ;;2.0;Patient Representative;**3,9,17**;07/25/1995
DATE ;
 N QACDVFLG
 N X,Y
 S QAQPOP=0
 D DATE^QACUTL0 Q:QAQPOP
 K DIR S DIR(0)="SMO^A:All;M:Male;F:Female"
 S DIR("A")="     Selection"
 S DIR("?")="Select A, M, or F"
 S DIR("??")="Enter A for All Issues, M for all issues for Male patients, or F for all issues for Female patients."
 ;Set QACGEN= to A, M, or F, and QACGENX= All, Male, or Female
 D ^DIR K DIR G EXIT:$D(DIRUT)!($D(DIROUT)) S QACGEN=Y,QACGENX=Y(0)
 S QACDVFLG=1
 I $G(QACDVFLG)=1 D DIV^QACUTL0 Q:$G(QAQPOP)=1
 K %ZIS,IOP S %ZIS="MQ" W ! D ^%ZIS G:POP EXIT
 I $D(IO("Q")) D  G EXIT
 . S ZTDESC="Patient Rep Issue Totals"
 . S ZTSAVE("Y")=""
 . S (ZTSAVE("QACGEN"),ZTSAVE("QACGENX"),ZTSAVE("QACDVFLG"))=""
 . S ZTSAVE("QACDVFLG")=""
 . S ZTRTN="GENTSK^QACGEN"
 . D TASK^QACUTL0
 . Q
GENTSK ; Gets the data to build the TMP global
 K ^TMP("QACGEN",$J)
 S ^TMP("QACGEN",$J)=0
 U IO
 N QACDT,QACD0,QACCN,QACPIEN,QACCIEN,QACCNM,QACHDNM,QACHDIEN
 N QACHD,QACICODE,QACDIV,QACGENDR
 ; Get each record in the date range
 S QACDT=QAQNBEG-.0000001 F  S QACDT=$O(^QA(745.1,"D",QACDT)) Q:(QACDT'>0)!(QACDT>QAQNEND)!(QACDT\1'?7N)  D
 . S QACD0=0 F  S QACD0=$O(^QA(745.1,"D",QACDT,QACD0)) Q:QACD0'>0  D
 .. ; For each record if there is a patient get the IEN and the gender
 .. S QAC74510=^QA(745.1,QACD0,0)
 .. S QACPIEN=+$P($G(QAC74510),U,3)
 .. S QACDIV=$P($G(QAC74510),U,16)
 .. I $G(QACDIV)']"" S QACDIV=0
 .. S QACEE=0
 .. ;I QACDIV>0 I $O(^QA(740,1,"QAC2","B",QACDIV,QACEE))']"" S QACDIV=0
 .. I QACDIV>0,('$D(^DIC(4,QACDIV))) S QACDIV=0
 .. I QACDIV>0,($G(^DIC(4,QACDIV,0))']"") S QACDIV=0
 .. I $G(QAC1DIV)]"",QACDIV>0 I QAC1DIV'=QACDIV Q
 .. I QACDIV=0 S QACDIV="Unknown"
 .. S QACGENDR=$P($G(^DPT(QACPIEN,0)),U,2)
 .. I $S($G(QACGEN)=QACGENDR:1,$G(QACGEN)="A":1,1:0) D
 ... ; For each code in record, get IEN and set QACICODE=code,
 ... ; QACHD=header for code, and QACHDIEN=header IEN.
 ... S QACCN=0 F  S QACCN=$O(^QA(745.1,QACD0,3,QACCN)) Q:QACCN'>0  D
 .... S QACCIEN=$P($G(^QA(745.1,QACD0,3,QACCN,0)),U,1) Q:QACCIEN=""
 .... S QACINDT=$P($G(^QA(745.2,QACCIEN,0)),U,6)
 .... Q:(QACINDT)&(QACINDT<QAQNBEG)
 .... S QACICODE=$P($G(^QA(745.2,QACCIEN,0)),U,1) Q:QACICODE=""
 .... I $E(QACICODE,1,2)?2A S QACHD=$E(QACICODE,1,2)
 .... E  S QACHD=$E(QACICODE,1)
 .... S QACHDIEN=0 F  S QACHDIEN=$O(^QA(745.2,"B",QACHD,QACHDIEN)) Q:QACHDIEN'>0  D SET
 .... Q
 ... Q
 .. Q
 . Q
INIT ;initialize ^TMP("QACGEN",$J nodes to zero if no count, yet
 S QACCIEN=0
 F  S QACCIEN=$O(^QA(745.2,QACCIEN)) Q:QACCIEN'>0  D
 . S QACINDT=$P($G(^QA(745.2,QACCIEN,0)),U,6)
 . Q:(QACINDT)&(QACINDT<QAQNBEG)
 . S QACICODE=$P($G(^QA(745.2,QACCIEN,0)),U) Q:QACICODE=""
 . S QACHD=$S($E(QACICODE,1,2)?2A:$E(QACICODE,1,2),1:$E(QACICODE))
 . S QACHDIEN=0
 . F  S QACHDIEN=$O(^QA(745.2,"B",QACHD,QACHDIEN)) Q:QACHDIEN'>0  D
 .. I QACHD'=$P($G(^QA(745.2,QACHDIEN,0)),U) Q
 .. S X=QACHD_U_QACHDIEN,Y=QACICODE_U_QACCIEN
 .. S QACC="" F  S QACC=$O(^TMP("QACGEN",$J,QACC)) Q:QACC']""  D
 ... I $G(^TMP("QACGEN",$J,QACC,X))="" S ^TMP("QACGEN",$J,QACC,X)=0
 ... I $G(^TMP("QACGEN",$J,QACC,X,Y))="" S ^TMP("QACGEN",$J,QACC,X,Y)=0
 . Q
PRINT ;
 K QACUNDL S $P(QACUNDL,"-",81)="",QACQUIT=0,QACPG=1
 I $O(^TMP("QACGEN",$J,""))="" S QACGENX="" D HEAD W !!,"No data found for the date range selected!" Q
 K QACHDIEN,QACHD,QACCIEN,QACICODE
 D HEAD S QACTOT=$P($G(^TMP("QACGEN",$J)),U,1)
 W !!?15,"Total Issues for ",$G(QACGENX)," = ",QACTOT,! ;Write total issues
 I $G(QACDVFLG)=1 D BYDIV G EXIT
BYHEAD ;prints those records for each header.  If by division this is called
 ;from BYDIV.  In each reference to ^TMP a $S is used to determine if
 ;it's being sorted by division.
 S QACHD="" F  S QACHD=$S($G(QACDVFLG):$O(^TMP("QACGEN",$J,QACEE,QACHD)),1:$O(^TMP("QACGEN",$J,QACHD))) Q:(QACHD="")!($G(QACQUIT))  D
 . S QACHDIEN=$P(QACHD,"^",2)
 . S QACHDNM=$$EN6^QACUTIL(QACHDIEN)
 . S QACHDTOT=$S($G(QACDVFLG):$P($G(^TMP("QACGEN",$J,QACEE,QACHD)),U,1),1:$P($G(^TMP("QACGEN",$J,QACHD)),U,1)) Q:(QACHDTOT="")!($G(QACQUIT))
 . W !!?5,QACHDNM,?77,QACHDTOT ;Write total for header code
 . S QACICODE="" F  S QACICODE=$S($G(QACDVFLG):$O(^TMP("QACGEN",$J,QACEE,QACHD,QACICODE)),1:$O(^TMP("QACGEN",$J,QACHD,QACICODE))) Q:(QACICODE="")!($G(QACQUIT))  D
 .. I $L($P(QACICODE,U))=2 Q
 .. S QACCIEN=$P(QACICODE,"^",2) ;Get Issue IEN
 .. S QACCNM=$$EN5^QACUTIL(QACCIEN) ;Get Issue name
 .. S QACCTOT=$S($G(QACDVFLG):$P($G(^TMP("QACGEN",$J,QACEE,QACHD,QACICODE)),U,1),1:$P($G(^TMP("QACGEN",$J,QACHD,QACICODE)),U,1)) Q:(QACCTOT="")!($G(QACQUIT))
 .. W !,QACCNM
 .. W ?77,QACCTOT ;Write total for the issue
 .. I '$G(QACQUIT),$Y>(IOSL-5) D:$E(IOST)="C" PAUSE Q:$G(QACQUIT)  D HEAD
 .. Q
 . Q
 I $G(QACDVFLG)=1 Q
 W ! D PAUSE
EXIT ;
 W ! D ^%ZISC S:$D(ZTQUEUED) ZTREQ="@"
 K IOP,POP,%ZIS,ZTDESC,ZTQUEUED,ZTREQ,ZTSAVE,ZTRTN,ZTSK
 K QAC1DIV,QAC74510,QACC,QACCN,QACCNM,QACCIEN,QACCSS,QACCTOT
 K QACD,QACDIV,QACDT,QACDV,QACEE,QACGEN,QACGENDR,QACGENX
 K QACHD,QACHDIEN,QACHDNM,QACHDTOT,QACEE
 K QACICODE,QACINDT,QACQUIT,QACPG,QACPIEN,QACTOT,QACUNDL
 K DIR,DIRUT,DIROUT
 K QAQ2HED,QAQNBEG,QAQNEND,QAQPOP,QAQQUIT
 K ^TMP("QACGEN",$J),X,Y
 D K^QAQDATE
 Q
HEAD ;
 W:($E(IOST)="C")!(QACPG>1) @IOF
 W !,"Issue Report for ",$G(QACGENX) S Y=DT D DD^%DT W ?60,"Date: ",Y,!
 W QAQ2HED,?60,"Page: ",QACPG
 W !,QACUNDL,! S QACPG=QACPG+1
 Q
PAUSE ;
 I '$G(QACQUIT),$E(IOST)="C" K DIR S DIR(0)="E" D ^DIR S QACQUIT=$S(Y'>0:1,1:0)
 Q
SET ;Counts the records.
 S ^TMP("QACGEN",$J)=$G(^TMP("QACGEN",$J))+1
 D YESDIV
 Q
BYDIV ;for multi-div sites, need to loop through each div
 N QACCOUNT
 S QACCOUNT=1
 S QACEE="" F  S QACEE=$O(^TMP("QACGEN",$J,QACEE)) Q:(QACEE']"")!($G(QACQUIT))  D
 . I $G(QACCOUNT)>1 D HEAD
 . I $G(QACEE)>0 D INST^QACUTL0(QACEE,.QACDV)
 . I $G(QACEE)=0 S QACDV="Unknown"
 . W !!,"Total Issues by Division: ",QACDV
 . W !,?5,"Total Issues for ",$G(QACGENX),"  ",$G(^TMP("QACGEN",$J,QACEE))
 . D BYHEAD
 . S QACCOUNT=QACCOUNT+1
 Q
YESDIV ;set counts for sites that have integrated
 S ^TMP("QACGEN",$J,QACDIV,QACHD_"^"_QACHDIEN)=$G(^TMP("QACGEN",$J,QACDIV,QACHD_"^"_QACHDIEN))+1
 S ^TMP("QACGEN",$J,QACDIV,QACHD_"^"_QACHDIEN,QACICODE_"^"_QACCIEN)=$G(^TMP("QACGEN",$J,QACDIV,QACHD_"^"_QACHDIEN,QACICODE_"^"_QACCIEN))+1
 S ^TMP("QACGEN",$J,QACDIV)=$G(^TMP("QACGEN",$J,QACDIV))+1
 Q

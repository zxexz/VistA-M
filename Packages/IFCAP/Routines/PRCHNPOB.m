PRCHNPOB ;RGB-TRANSACTION UTILITY PROGRAM ; 4/2/01 10:18 AM
V ;;5.1;IFCAP;**184,194**;Oct 20, 2000;Build 3
 ;Per VA Directive 6402, this routine should not be modified.
 ;
 ;PRC*5.1*184 RGB 9/5/13 Check to insure Purchase card orders for   
 ;selected FCP have >5 requisition entries still available for use,
 ;otherwise PCard order will prevent user from continuing.
 ;
 ;PRC*5.1*194 Insure $$ call of routine returns a value when
 ;            new FY 410.1 entry not defined as yet.
 ;
EN(SITE,FCP) ;CHECK FOR NEW TRANSACTION (FILE 410) NUMBER AVAILABILITY FOR PCARD ORDERS
EN1 N PRCHFCPA,PRCHDA,PRCHSEQ,PRCHSEQN,PRCHTOT,PRCHIEN,PRCHEND,PRCHMSG,PRCHI,PRCHREQ
 S PRCHMSG="",PRCHEND=0,PRCHFCPA=SITE_"-"_PRC("FY")_"-"_$P(FCP," "),PRCHTOT=0
 I '$D(^PRCS(410.1,"B",PRCHFCPA)) Q 0     ;PRC*5.1*194
 S PRCHDA=$O(^PRCS(410.1,"B",PRCHFCPA,0)) S PRCHSEQ=$P(^PRCS(410.1,PRCHDA,0),"^",2)+1 S:PRCHSEQ>9999 PRCHSEQ=1
CHK F PRCHI=PRCHSEQ:1:9999 S PRCHSEQN="000"_PRCHI,PRCHSEQ=$E(PRCHSEQN,$L(PRCHSEQN)-3,$L(PRCHSEQN)),PRCHREQ=$P(PRCHFCPA,"-",1,2)_"-"_PRC("QTR")_"-"_$P(PRCHFCPA,"-",3)_"-"_PRCHSEQ D  Q:PRCHTOT>5
 . I '$D(^PRCS(410,"B",PRCHREQ)) S PRCHTOT=PRCHTOT+1 Q
 . S PRCHIEN=$O(^PRCS(410,"B",PRCHREQ,0))
 . I $P($G(^PRCS(410,PRCHIEN,0)),U,2)="CA" S PRCHTOT=PRCHTOT+1 W !,PRCHIEN,!,^PRCS(410,PRCHIEN,0)
 I PRCHEND=0,PRCHTOT'>5 S PRCHSEQ=1,PRCHEND=1,PRCHTOT=0 G CHK
CER I PRCHTOT'>5 S PRCHMSG=1 W !!,"ORDER ABORTED ==>>",!,"Insufficient sequence numbers remaining for "_$P(PRCHREQ,"-",1,4)_" during ORDER ENTRY",!
 Q PRCHMSG

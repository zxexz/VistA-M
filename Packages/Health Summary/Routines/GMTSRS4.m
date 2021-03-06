GMTSRS4 ; SLC/KER - Health Summary Resequence - Misc     ; 02/11/2003
 ;;2.7;Health Summary;**62**;Oct 20, 1995
 ;
 ; External References
 ;   None
 ;                              
 ; Variables passed
 ;   ROOT  Global file root, i.e., "^XXX(SUB1,SUB2,SUBX,"
 ;   PIE   Pieces to display, i.e, "1" or "1^2^4" (Default 1)
 ;   HDR   Display title (Default first piece of 0 node)
 ;   COL   Number of columns to display (Default 1)
 ;                              
 ; Output
 ;   Takes the data stored in array ROOT at node NODE and 
 ;   piece PIE and prints in columns (number of columns
 ;   specified by COL).
 ;                         
EN(ROOT,NODE,PIE,HDR,COL) ; Main Entry Point
 D HOME^%ZIS N GMTS2,GMTS3,GMTS4,GMTSCC,GMTSCCT,GMTSCLL,GMTSCLS
 N GMTSCOL,GMTSCTR,GMTSELE,GMTSFL,GMTSHDR,GMTSLNS,GMTSMAX,GMTSND
 N GMTSNR,GMTSNT,GMTSON,GMTSPI,GMTSR0,GMTSRM,GMTSRT,GMTSTX,GMTSUW
 N GMTSWTH S GMTSRT=$G(ROOT),GMTSND=$G(NODE),GMTSPI=$G(PIE),GMTSHDR=$G(HDR),GMTSCOL=$G(COL) S:+GMTSPI=1 GMTSPI=1
 Q:'$L($G(GMTSRT))  S GMTSRT=$G(GMTSRT)  S:GMTSRT'["(" GMTSRT=GMTSRT_"("
 S:GMTSRT[")" GMTSRT=$E(GMTSRT,$L(GMTSRT)-1) S GMTSR0=GMTSRT_"0)" Q:'$D(@GMTSR0)
 S GMTSON=GMTSRT,GMTSMAX=$G(@GMTSR0) Q:+GMTSMAX=0  S GMTSCOL=$G(GMTSCOL) Q:+GMTSCOL=0
 S GMTSLNS=$S(+GMTSCOL>0&(+GMTSMAX>0):(GMTSMAX/GMTSCOL),1:18)
 S GMTSRM=$P(GMTSLNS,".",2) S GMTSLNS=$P(GMTSLNS,".",1) S:+GMTSRM>0 GMTSLNS=GMTSLNS+1
 S GMTSCCT=1,(GMTSNR,GMTSFL,GMTSCTR)=0
 F  S GMTSNR=$O(@(GMTSON_GMTSNR_")")) Q:+GMTSNR=0  D
 . S GMTSCTR=GMTSCTR+1 S:GMTSCTR>GMTSLNS GMTSCTR=1,GMTSCCT=GMTSCCT+1
 . S GMTSCLL=GMTSCCT,GMTSCLS(GMTSCCT,GMTSCTR)=GMTSNR
 S GMTSNT=((GMTSCLL*6)+(4*(GMTSCLL-1))),GMTSUW=IOM-GMTSNT
 F GMTSCC=GMTSUW:-1 Q:((GMTSCC#4=0)&(GMTSCC#3=0))
 S GMTSWTH=(GMTSCC/GMTSCLL)+1,GMTS2=GMTSWTH+5,GMTS3=GMTS2+9+GMTSWTH,GMTS4=GMTS3+9+GMTSWTH
 F GMTSCTR=1:1:GMTSLNS D
 . F GMTSCCT=1:1:GMTSCLL D
 . . S GMTSNR=+($G(GMTSCLS(GMTSCCT,GMTSCTR))) Q:+GMTSNR=0
 . . S GMTSTX=$G(@(GMTSON_GMTSNR_")"))
 . . S:$L($G(GMTSND)) GMTSTX=$G(@(GMTSON_GMTSNR_","_GMTSND_")"))
 . . S:+($G(GMTSPI))>0 GMTSTX=$P(GMTSTX,"^",+GMTSPI)
 . . S GMTSELE=$E(GMTSTX,1,GMTSWTH)
 . . F  Q:$E(GMTSELE,1)'=" "  S GMTSELE=$E(GMTSELE,2,$L(GMTSELE))
 . . S:+GMTSNR=0 GMTSNR=""  S:'$L(GMTSELE) GMTSNR=""
 . . S GMTSELE=$S(GMTSCCT=1:$J(GMTSNR,4)_" "_GMTSELE,1:"    "_$J(GMTSNR,4)_" "_GMTSELE)
 . . W:$L($G(GMTSHDR))&(GMTSCTR=1)&(GMTSCCT=1)&(+($G(GMTSFL))=0) !,$G(GMTSHDR),! S GMTSFL=1
 . . W:GMTSCCT=1 !
 . . W:GMTSCCT=2 ?GMTS2 W:GMTSCCT=3 ?GMTS3 W:GMTSCCT=4 ?GMTS4 W GMTSELE
 Q

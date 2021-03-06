PRCHCRD ;WISC/DJM,ID/RSD,TKW/SF-LINK REPETITIVE ITEM DATA TO P.O.ITEM DATA ;6/7/94  3:28 PM
V ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
EN0 ;Edit unit of purchase from file 442 to file 441
 Q:'$D(^PRC(441,+PRCHCI,2,PRCHCV,0))  S $P(^(0),U,7)=X G Q
EN1 ;Edit unitcost from file 442 to file 441
 ;Q:'$D(^PRC(441,+PRCHCI,2,PRCHCV,0))  S $P(^(0),U,2)=X,$P(^(0),U,6)=$S($D(DT):DT,1:"") G Q ;;REPLACED WITH $G
 Q:'$D(^PRC(441,+PRCHCI,2,PRCHCV,0))  Q:$G(PRCHPHAM)  S $P(^(0),U,2)=X,$P(^(0),U,6)=$G(DT) G Q
EN2 ;Edit contract from file 442 to file 441.  Called from EN8^PRCHNPO5.
 Q:'$D(^PRC(440,PRCHCV,4,+Y,0))!('$D(^PRC(441,PRCHCI,2,PRCHCV,0)))  S $P(^(0),U,3)=+Y G Q
EN5 ;Edit national stock no. from file 442 to 441
 I $P(^PRC(441,+PRCHCI,0),U,5)]"" S Z=$P(^(0),U,5),Z(1)=$P(Z,"-",3,4),Z(2)=$E(Z,4)_$P(Z,"-",2)_$P(Z,"-",3)_$P(Z,"-",4) K ^PRC(441,"BB",Z,+PRCHCI) K:Z(1)]"" ^PRC(441,"BA",Z(1),+PRCHCI) K:Z(2)]"" ^PRC(441,"G",Z(2),+PRCHCI)
 S Z(1)=$P(X,"-",3,4),Z(2)=$E(X,4)_$P(X,"-",2)_$P(X,"-",3)_$P(X,"-",4),^PRC(441,"BB",X,+PRCHCI)="" S:Z(1)]"" ^PRC(441,"BA",Z(1),+PRCHCI)="" S:Z(2)]"" ^PRC(441,"G",Z(2),+PRCHCI)=""
 S $P(^PRC(441,+PRCHCI,0),U,5)=X G Q
EN6 ;Move Vendor Stock No. from file 442 to 441
 Q:'$D(^PRC(441,+PRCHCI,2,PRCHCV,0))  I $P(^(0),U,4)]"" K ^PRC(441,"D",$P(^(0),U,4),+PRCHCI,PRCHCV)
 S $P(^PRC(441,+PRCHCI,2,PRCHCV,0),U,4)=X,^PRC(441,"D",X,+PRCHCI,PRCHCV)="" G Q
EN3 ;Move Repetitive Item data to file 442, adds FCP to file 441.  From "AD" X-REF SET in file 442, field 40, subfield 1.5.
 ;PRCHCCP=FCP, PRCHCV=VENDOR, PRCHCPD=P.O.DATE, PRCHCI=REP.ITEM NO., PRCHCPO=P.O.RECORD NO.
 S PRCHCX=PRC("SITE")_PRCHCCP D CHK I '$D(^PRC(441,PRCHCI,4,PRCHCX,1,0)) S ^(0)="^441.04PA^0^0"
 S:'$D(^PRC(441,PRCHCI,4,PRCHCX,1,PRCHCPO,0)) ^(0)=PRCHCPO,^PRC(441,PRCHCI,4,PRCHCX,1,"AC",9999999-PRCHCPD,PRCHCPO)="",$P(^(0),U,3,4)=PRCHCPO_U_($P(^PRC(441,PRCHCI,4,PRCHCX,1,0),U,4)+1)
 G LST^PRCHCRD1
EN4 ;Delete UIR from file 442, kills FCP in file 441. From "AD" X-REF KILL in file 442, field 40, subfield 1.5.
 S PRCHCX=PRC("SITE")_PRCHCCP G:'$D(^PRC(441,PRCHCI,4,PRCHCX,1,0)) Q
 I $D(^PRC(441,PRCHCI,4,PRCHCX,1,PRCHCPO)) S $P(^(0),U,4)=$P(^(0),U,4)-1 K ^PRC(441,PRCHCI,4,PRCHCX,1,PRCHCPO),^PRC(441,PRCHCI,4,PRCHCX,1,"AC",9999999-PRCHCPD,PRCHCPO)
 G Q
CHK I '$D(^PRC(441,PRCHCI,4)) S ^PRC(441,PRCHCI,4,0)="^441.03A^0^0"
 I '$D(^PRC(441,PRCHCI,4,PRCHCX,0)) S ^(0)=PRCHCX,^PRC(441,PRCHCI,4,"B",PRCHCX,PRCHCX)="",$P(^(0),U,3,4)=PRCHCX_U_($P(^PRC(441,PRCHCI,4,0),U,4)+1)
 Q
LCK L +^PRC(441,X,0):5 E  W !?8,"Item is being edited by another user, try later ",$C(7) K X
 Q
Q K PRCHC,PRCHCCN,PRCHCCP,PRCHCDC,PRCHCI,PRCHCMX,PRCHCNS,PRCHCPD,PRCHCPK,PRCHC,PRCHCQ,PRCHCS,PRCHCSB,PRCHCSC,PRCHCUC,PRCHCUP,PRCHCV,PRCHCVS,PRCHCX,PRCHCY Q
 Q

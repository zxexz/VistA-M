PRCASVC1 ;SF-ISC/YJK-ACCEPT, AMMEND AND CANCEL AR BILL ;5/1/95  3:05 PM
 ;;4.5;Accounts Receivable;**1,68,48,84,157,295,315,357**;Mar 20, 1995;Build 6
 ;;Per VA Directive 6402, this routine should not be modified.
 Q
 ;
 ;
AMEND ;  amend the bill in AR
 D CANCEL
 Q
 ;
 ;
CANCEL ;  cancel the bill in AR
 N X
 S X=$$CANCEL^RCBEIB($G(PRCASV("ARREC")),$G(PRCASV("DATE")),$G(PRCASV("BY")),$G(PRCASV("AMT")),$G(PRCASV("COMMENT")))
 Q
 ;
 ;
STATUS ;Change the current status of a bill
 S DIE="^PRCA(430,",DA=PRCASV("ARREC"),DR="[PRCASV STATUS]" D ^DIE K DR,DIE
 ;Allow TRICARE categories to transmit to FMS automatically - PRCA*4.5*295
 ;Add INELIGIBLE HOSP. REIMB. - PRCA*4.5*315
 I $D(^PRCA(430,+DA,0)),("^27^30^31^32^47^80^"[("^"_$P(^(0),"^",2)_"^")) D EN^PRCACPV(+DA)  ;PRCA*4.5*357 - added TRICARE PHARMACY
 K DA
 Q

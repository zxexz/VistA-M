IBDEI0GF ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,7295,0)
 ;;=C1752^^51^484^1^^^^1
 ;;^UTILITY(U,$J,358.3,7295,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7295,1,2,0)
 ;;=2^C1752
 ;;^UTILITY(U,$J,358.3,7295,1,3,0)
 ;;=3^CATH,HEMODIALYSIS,SHORT-TERM
 ;;^UTILITY(U,$J,358.3,7296,0)
 ;;=15852^^51^484^2^^^^1
 ;;^UTILITY(U,$J,358.3,7296,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7296,1,2,0)
 ;;=2^15852
 ;;^UTILITY(U,$J,358.3,7296,1,3,0)
 ;;=3^DRESSING CHANGE,UNDER ANESTHESIA
 ;;^UTILITY(U,$J,358.3,7297,0)
 ;;=90940^^51^484^4^^^^1
 ;;^UTILITY(U,$J,358.3,7297,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7297,1,2,0)
 ;;=2^90940
 ;;^UTILITY(U,$J,358.3,7297,1,3,0)
 ;;=3^HEMODIALYSIS ACCESS STUDY
 ;;^UTILITY(U,$J,358.3,7298,0)
 ;;=4051F^^51^484^5^^^^1
 ;;^UTILITY(U,$J,358.3,7298,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7298,1,2,0)
 ;;=2^4051F
 ;;^UTILITY(U,$J,358.3,7298,1,3,0)
 ;;=3^REFERRED FOR AN AV FISTULA
 ;;^UTILITY(U,$J,358.3,7299,0)
 ;;=A4708^^51^485^1^^^^1
 ;;^UTILITY(U,$J,358.3,7299,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7299,1,2,0)
 ;;=2^A4708
 ;;^UTILITY(U,$J,358.3,7299,1,3,0)
 ;;=3^ACETATE CONC SOL PER GALLON
 ;;^UTILITY(U,$J,358.3,7300,0)
 ;;=A4750^^51^485^2^^^^1
 ;;^UTILITY(U,$J,358.3,7300,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7300,1,2,0)
 ;;=2^A4750
 ;;^UTILITY(U,$J,358.3,7300,1,3,0)
 ;;=3^ART OR VENOUS BLOOD TUBING
 ;;^UTILITY(U,$J,358.3,7301,0)
 ;;=A4707^^51^485^3^^^^1
 ;;^UTILITY(U,$J,358.3,7301,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7301,1,2,0)
 ;;=2^A4707
 ;;^UTILITY(U,$J,358.3,7301,1,3,0)
 ;;=3^BICARBONATE CONC POW PER PAC
 ;;^UTILITY(U,$J,358.3,7302,0)
 ;;=90999^^51^485^5^^^^1
 ;;^UTILITY(U,$J,358.3,7302,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7302,1,2,0)
 ;;=2^90999
 ;;^UTILITY(U,$J,358.3,7302,1,3,0)
 ;;=3^CAPD TUBE CHANGE
 ;;^UTILITY(U,$J,358.3,7303,0)
 ;;=C1750^^51^485^6^^^^1
 ;;^UTILITY(U,$J,358.3,7303,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7303,1,2,0)
 ;;=2^C1750
 ;;^UTILITY(U,$J,358.3,7303,1,3,0)
 ;;=3^CATH, HEMODIALYSIS,LONG-TERM
 ;;^UTILITY(U,$J,358.3,7304,0)
 ;;=C1752^^51^485^7^^^^1
 ;;^UTILITY(U,$J,358.3,7304,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7304,1,2,0)
 ;;=2^C1752
 ;;^UTILITY(U,$J,358.3,7304,1,3,0)
 ;;=3^CATH,HEMODIALYSIS,SHORT-TERM
 ;;^UTILITY(U,$J,358.3,7305,0)
 ;;=87210^^51^485^8^^^^1
 ;;^UTILITY(U,$J,358.3,7305,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7305,1,2,0)
 ;;=2^87210
 ;;^UTILITY(U,$J,358.3,7305,1,3,0)
 ;;=3^COLLECT SPECIMENS
 ;;^UTILITY(U,$J,358.3,7306,0)
 ;;=A4755^^51^485^9^^^^1
 ;;^UTILITY(U,$J,358.3,7306,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7306,1,2,0)
 ;;=2^A4755
 ;;^UTILITY(U,$J,358.3,7306,1,3,0)
 ;;=3^COMB ART/VENOUS BLOOD TUBING
 ;;^UTILITY(U,$J,358.3,7307,0)
 ;;=A4723^^51^485^10^^^^1
 ;;^UTILITY(U,$J,358.3,7307,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7307,1,2,0)
 ;;=2^A4723
 ;;^UTILITY(U,$J,358.3,7307,1,3,0)
 ;;=3^DIALYS SOL FLD VOL > 2999CC
 ;;^UTILITY(U,$J,358.3,7308,0)
 ;;=A4663^^51^485^11^^^^1
 ;;^UTILITY(U,$J,358.3,7308,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7308,1,2,0)
 ;;=2^A4663
 ;;^UTILITY(U,$J,358.3,7308,1,3,0)
 ;;=3^DIALYSIS BLOOD PRESSURE CUFF
 ;;^UTILITY(U,$J,358.3,7309,0)
 ;;=90989^^51^485^13^^^^1
 ;;^UTILITY(U,$J,358.3,7309,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7309,1,2,0)
 ;;=2^90989
 ;;^UTILITY(U,$J,358.3,7309,1,3,0)
 ;;=3^DIALYSIS TRAINING COMPLETE
 ;;^UTILITY(U,$J,358.3,7310,0)
 ;;=90947^^51^485^12^^^^1
 ;;^UTILITY(U,$J,358.3,7310,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7310,1,2,0)
 ;;=2^90947
 ;;^UTILITY(U,$J,358.3,7310,1,3,0)
 ;;=3^DIALYSIS REPEATED EVAL
 ;;^UTILITY(U,$J,358.3,7311,0)
 ;;=A4690^^51^485^14^^^^1
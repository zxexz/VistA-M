IBDEI1EM ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,23435,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23435,1,3,0)
 ;;=3^Hyperlipidemia, unspec
 ;;^UTILITY(U,$J,358.3,23435,1,4,0)
 ;;=4^E78.5
 ;;^UTILITY(U,$J,358.3,23435,2)
 ;;=^5002969
 ;;^UTILITY(U,$J,358.3,23436,0)
 ;;=E87.1^^113^1130^29
 ;;^UTILITY(U,$J,358.3,23436,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23436,1,3,0)
 ;;=3^Hypo-osmolality and hyponatremia
 ;;^UTILITY(U,$J,358.3,23436,1,4,0)
 ;;=4^E87.1
 ;;^UTILITY(U,$J,358.3,23436,2)
 ;;=^5003019
 ;;^UTILITY(U,$J,358.3,23437,0)
 ;;=E87.5^^113^1130^24
 ;;^UTILITY(U,$J,358.3,23437,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23437,1,3,0)
 ;;=3^Hyperkalemia
 ;;^UTILITY(U,$J,358.3,23437,1,4,0)
 ;;=4^E87.5
 ;;^UTILITY(U,$J,358.3,23437,2)
 ;;=^60041
 ;;^UTILITY(U,$J,358.3,23438,0)
 ;;=E87.6^^113^1130^31
 ;;^UTILITY(U,$J,358.3,23438,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23438,1,3,0)
 ;;=3^Hypokalemia
 ;;^UTILITY(U,$J,358.3,23438,1,4,0)
 ;;=4^E87.6
 ;;^UTILITY(U,$J,358.3,23438,2)
 ;;=^60610
 ;;^UTILITY(U,$J,358.3,23439,0)
 ;;=G81.91^^113^1130^11
 ;;^UTILITY(U,$J,358.3,23439,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23439,1,3,0)
 ;;=3^Hemiplegia affecting rt dominant side, unspec
 ;;^UTILITY(U,$J,358.3,23439,1,4,0)
 ;;=4^G81.91
 ;;^UTILITY(U,$J,358.3,23439,2)
 ;;=^5004121
 ;;^UTILITY(U,$J,358.3,23440,0)
 ;;=G81.92^^113^1130^9
 ;;^UTILITY(U,$J,358.3,23440,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23440,1,3,0)
 ;;=3^Hemiplegia affecting lft dominant side, unspec
 ;;^UTILITY(U,$J,358.3,23440,1,4,0)
 ;;=4^G81.92
 ;;^UTILITY(U,$J,358.3,23440,2)
 ;;=^5004122
 ;;^UTILITY(U,$J,358.3,23441,0)
 ;;=G81.93^^113^1130^12
 ;;^UTILITY(U,$J,358.3,23441,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23441,1,3,0)
 ;;=3^Hemiplegia affecting rt nondom side, unspec
 ;;^UTILITY(U,$J,358.3,23441,1,4,0)
 ;;=4^G81.93
 ;;^UTILITY(U,$J,358.3,23441,2)
 ;;=^5004123
 ;;^UTILITY(U,$J,358.3,23442,0)
 ;;=G81.94^^113^1130^10
 ;;^UTILITY(U,$J,358.3,23442,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23442,1,3,0)
 ;;=3^Hemiplegia affecting lft nondom side, unspec
 ;;^UTILITY(U,$J,358.3,23442,1,4,0)
 ;;=4^G81.94
 ;;^UTILITY(U,$J,358.3,23442,2)
 ;;=^5004124
 ;;^UTILITY(U,$J,358.3,23443,0)
 ;;=H91.90^^113^1130^7
 ;;^UTILITY(U,$J,358.3,23443,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23443,1,3,0)
 ;;=3^Hearing loss, unspec ear, unspec
 ;;^UTILITY(U,$J,358.3,23443,1,4,0)
 ;;=4^H91.90
 ;;^UTILITY(U,$J,358.3,23443,2)
 ;;=^5006943
 ;;^UTILITY(U,$J,358.3,23444,0)
 ;;=I10.^^113^1130^26
 ;;^UTILITY(U,$J,358.3,23444,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23444,1,3,0)
 ;;=3^Hypertension, essential (primary)
 ;;^UTILITY(U,$J,358.3,23444,1,4,0)
 ;;=4^I10.
 ;;^UTILITY(U,$J,358.3,23444,2)
 ;;=^5007062
 ;;^UTILITY(U,$J,358.3,23445,0)
 ;;=K64.8^^113^1130^15
 ;;^UTILITY(U,$J,358.3,23445,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23445,1,3,0)
 ;;=3^Hemorrhoids, oth
 ;;^UTILITY(U,$J,358.3,23445,1,4,0)
 ;;=4^K64.8
 ;;^UTILITY(U,$J,358.3,23445,2)
 ;;=^5008774
 ;;^UTILITY(U,$J,358.3,23446,0)
 ;;=K64.4^^113^1130^14
 ;;^UTILITY(U,$J,358.3,23446,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23446,1,3,0)
 ;;=3^Hemorrhoidal Skin Tags,Residual
 ;;^UTILITY(U,$J,358.3,23446,1,4,0)
 ;;=4^K64.4
 ;;^UTILITY(U,$J,358.3,23446,2)
 ;;=^269834
 ;;^UTILITY(U,$J,358.3,23447,0)
 ;;=I95.9^^113^1130^32
 ;;^UTILITY(U,$J,358.3,23447,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23447,1,3,0)
 ;;=3^Hypotension, unspec
 ;;^UTILITY(U,$J,358.3,23447,1,4,0)
 ;;=4^I95.9
 ;;^UTILITY(U,$J,358.3,23447,2)
 ;;=^5008080
 ;;^UTILITY(U,$J,358.3,23448,0)
 ;;=K40.90^^113^1130^36
 ;;^UTILITY(U,$J,358.3,23448,1,0)
 ;;=^358.31IA^4^2
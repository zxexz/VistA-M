IBDEI368 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,53243,1,4,0)
 ;;=4^E46.
 ;;^UTILITY(U,$J,358.3,53243,2)
 ;;=^5002790
 ;;^UTILITY(U,$J,358.3,53244,0)
 ;;=E53.8^^245^2675^31
 ;;^UTILITY(U,$J,358.3,53244,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53244,1,3,0)
 ;;=3^Vitamin B group deficiency
 ;;^UTILITY(U,$J,358.3,53244,1,4,0)
 ;;=4^E53.8
 ;;^UTILITY(U,$J,358.3,53244,2)
 ;;=^5002797
 ;;^UTILITY(U,$J,358.3,53245,0)
 ;;=E66.01^^245^2675^27
 ;;^UTILITY(U,$J,358.3,53245,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53245,1,3,0)
 ;;=3^Obesity, morbid
 ;;^UTILITY(U,$J,358.3,53245,1,4,0)
 ;;=4^E66.01
 ;;^UTILITY(U,$J,358.3,53245,2)
 ;;=^5002826
 ;;^UTILITY(U,$J,358.3,53246,0)
 ;;=E66.9^^245^2675^28
 ;;^UTILITY(U,$J,358.3,53246,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53246,1,3,0)
 ;;=3^Obesity, unspecified
 ;;^UTILITY(U,$J,358.3,53246,1,4,0)
 ;;=4^E66.9
 ;;^UTILITY(U,$J,358.3,53246,2)
 ;;=^5002832
 ;;^UTILITY(U,$J,358.3,53247,0)
 ;;=E74.39^^245^2675^25
 ;;^UTILITY(U,$J,358.3,53247,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53247,1,3,0)
 ;;=3^Intestinal carbohydrate absorption disorder, other
 ;;^UTILITY(U,$J,358.3,53247,1,4,0)
 ;;=4^E74.39
 ;;^UTILITY(U,$J,358.3,53247,2)
 ;;=^5002928
 ;;^UTILITY(U,$J,358.3,53248,0)
 ;;=E78.0^^245^2675^15
 ;;^UTILITY(U,$J,358.3,53248,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53248,1,3,0)
 ;;=3^Hypercholesterolemia, pure
 ;;^UTILITY(U,$J,358.3,53248,1,4,0)
 ;;=4^E78.0
 ;;^UTILITY(U,$J,358.3,53248,2)
 ;;=^5002966
 ;;^UTILITY(U,$J,358.3,53249,0)
 ;;=E78.1^^245^2675^17
 ;;^UTILITY(U,$J,358.3,53249,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53249,1,3,0)
 ;;=3^Hyperglyceridemia, pure
 ;;^UTILITY(U,$J,358.3,53249,1,4,0)
 ;;=4^E78.1
 ;;^UTILITY(U,$J,358.3,53249,2)
 ;;=^101303
 ;;^UTILITY(U,$J,358.3,53250,0)
 ;;=E78.4^^245^2675^19
 ;;^UTILITY(U,$J,358.3,53250,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53250,1,3,0)
 ;;=3^Hyperlipidemia, other
 ;;^UTILITY(U,$J,358.3,53250,1,4,0)
 ;;=4^E78.4
 ;;^UTILITY(U,$J,358.3,53250,2)
 ;;=^5002968
 ;;^UTILITY(U,$J,358.3,53251,0)
 ;;=E78.5^^245^2675^20
 ;;^UTILITY(U,$J,358.3,53251,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53251,1,3,0)
 ;;=3^Hyperlipidemia, unspecified
 ;;^UTILITY(U,$J,358.3,53251,1,4,0)
 ;;=4^E78.5
 ;;^UTILITY(U,$J,358.3,53251,2)
 ;;=^5002969
 ;;^UTILITY(U,$J,358.3,53252,0)
 ;;=E86.0^^245^2675^13
 ;;^UTILITY(U,$J,358.3,53252,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53252,1,3,0)
 ;;=3^Dehydration
 ;;^UTILITY(U,$J,358.3,53252,1,4,0)
 ;;=4^E86.0
 ;;^UTILITY(U,$J,358.3,53252,2)
 ;;=^332743
 ;;^UTILITY(U,$J,358.3,53253,0)
 ;;=E87.1^^245^2675^21
 ;;^UTILITY(U,$J,358.3,53253,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53253,1,3,0)
 ;;=3^Hypo-osmolality & hyponatremia
 ;;^UTILITY(U,$J,358.3,53253,1,4,0)
 ;;=4^E87.1
 ;;^UTILITY(U,$J,358.3,53253,2)
 ;;=^5003019
 ;;^UTILITY(U,$J,358.3,53254,0)
 ;;=E87.5^^245^2675^18
 ;;^UTILITY(U,$J,358.3,53254,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53254,1,3,0)
 ;;=3^Hyperkalemia
 ;;^UTILITY(U,$J,358.3,53254,1,4,0)
 ;;=4^E87.5
 ;;^UTILITY(U,$J,358.3,53254,2)
 ;;=^60041
 ;;^UTILITY(U,$J,358.3,53255,0)
 ;;=E87.6^^245^2675^23
 ;;^UTILITY(U,$J,358.3,53255,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53255,1,3,0)
 ;;=3^Hypokalemia
 ;;^UTILITY(U,$J,358.3,53255,1,4,0)
 ;;=4^E87.6
 ;;^UTILITY(U,$J,358.3,53255,2)
 ;;=^60610
 ;;^UTILITY(U,$J,358.3,53256,0)
 ;;=E87.70^^245^2675^14
 ;;^UTILITY(U,$J,358.3,53256,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53256,1,3,0)
 ;;=3^Fluid overload, unspecified
 ;;^UTILITY(U,$J,358.3,53256,1,4,0)
 ;;=4^E87.70
 ;;^UTILITY(U,$J,358.3,53256,2)
 ;;=^5003023
 ;;^UTILITY(U,$J,358.3,53257,0)
 ;;=F02.80^^245^2676^7

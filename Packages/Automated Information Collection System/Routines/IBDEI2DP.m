IBDEI2DP ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,39961,1,3,0)
 ;;=3^MOHS 1 Stage H/N/HF/G
 ;;^UTILITY(U,$J,358.3,39962,0)
 ;;=17312^^185^2062^2^^^^1
 ;;^UTILITY(U,$J,358.3,39962,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39962,1,2,0)
 ;;=2^17312
 ;;^UTILITY(U,$J,358.3,39962,1,3,0)
 ;;=3^MOHS H/N/HF/G,Ea Addl Stage
 ;;^UTILITY(U,$J,358.3,39963,0)
 ;;=17313^^185^2062^3^^^^1
 ;;^UTILITY(U,$J,358.3,39963,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39963,1,2,0)
 ;;=2^17313
 ;;^UTILITY(U,$J,358.3,39963,1,3,0)
 ;;=3^MOHS 1 Stage T/A/L
 ;;^UTILITY(U,$J,358.3,39964,0)
 ;;=17314^^185^2062^4^^^^1
 ;;^UTILITY(U,$J,358.3,39964,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39964,1,2,0)
 ;;=2^17314
 ;;^UTILITY(U,$J,358.3,39964,1,3,0)
 ;;=3^MOHS T/A/L,Ea Addl Stage
 ;;^UTILITY(U,$J,358.3,39965,0)
 ;;=17315^^185^2062^5^^^^1
 ;;^UTILITY(U,$J,358.3,39965,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39965,1,2,0)
 ;;=2^17315
 ;;^UTILITY(U,$J,358.3,39965,1,3,0)
 ;;=3^MOHS Surg Addl Block
 ;;^UTILITY(U,$J,358.3,39966,0)
 ;;=96372^^185^2063^8^^^^1
 ;;^UTILITY(U,$J,358.3,39966,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39966,1,2,0)
 ;;=2^96372
 ;;^UTILITY(U,$J,358.3,39966,1,3,0)
 ;;=3^Ther/Proph/Diag Inj SC/IM
 ;;^UTILITY(U,$J,358.3,39967,0)
 ;;=96406^^185^2063^2^^^^1
 ;;^UTILITY(U,$J,358.3,39967,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39967,1,2,0)
 ;;=2^96406
 ;;^UTILITY(U,$J,358.3,39967,1,3,0)
 ;;=3^Chemo Intralesional > 7
 ;;^UTILITY(U,$J,358.3,39968,0)
 ;;=96405^^185^2063^1^^^^1
 ;;^UTILITY(U,$J,358.3,39968,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39968,1,2,0)
 ;;=2^96405
 ;;^UTILITY(U,$J,358.3,39968,1,3,0)
 ;;=3^Chemo Intralesional Up to 7
 ;;^UTILITY(U,$J,358.3,39969,0)
 ;;=C9800^^185^2063^3^^^^1
 ;;^UTILITY(U,$J,358.3,39969,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39969,1,2,0)
 ;;=2^C9800
 ;;^UTILITY(U,$J,358.3,39969,1,3,0)
 ;;=3^Dermal Filler Inj Px/Supply
 ;;^UTILITY(U,$J,358.3,39970,0)
 ;;=11901^^185^2063^7^^^^1
 ;;^UTILITY(U,$J,358.3,39970,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39970,1,2,0)
 ;;=2^11901
 ;;^UTILITY(U,$J,358.3,39970,1,3,0)
 ;;=3^Skin Lesion Injection,Addl Lesions
 ;;^UTILITY(U,$J,358.3,39971,0)
 ;;=11900^^185^2063^6^^^^1
 ;;^UTILITY(U,$J,358.3,39971,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39971,1,2,0)
 ;;=2^11900
 ;;^UTILITY(U,$J,358.3,39971,1,3,0)
 ;;=3^Skin Lesion Injection,Up to 7 Lesions
 ;;^UTILITY(U,$J,358.3,39972,0)
 ;;=Q2026^^185^2063^4^^^^1
 ;;^UTILITY(U,$J,358.3,39972,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39972,1,2,0)
 ;;=2^Q2026
 ;;^UTILITY(U,$J,358.3,39972,1,3,0)
 ;;=3^Radiesse Inj 0.1 ml
 ;;^UTILITY(U,$J,358.3,39973,0)
 ;;=Q2028^^185^2063^5^^^^1
 ;;^UTILITY(U,$J,358.3,39973,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39973,1,2,0)
 ;;=2^Q2028
 ;;^UTILITY(U,$J,358.3,39973,1,3,0)
 ;;=3^Sculptra Inj 0.5mg
 ;;^UTILITY(U,$J,358.3,39974,0)
 ;;=15780^^185^2064^6^^^^1
 ;;^UTILITY(U,$J,358.3,39974,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39974,1,2,0)
 ;;=2^15780
 ;;^UTILITY(U,$J,358.3,39974,1,3,0)
 ;;=3^Dermabrasion,Total Face
 ;;^UTILITY(U,$J,358.3,39975,0)
 ;;=15781^^185^2064^2^^^^1
 ;;^UTILITY(U,$J,358.3,39975,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39975,1,2,0)
 ;;=2^15781
 ;;^UTILITY(U,$J,358.3,39975,1,3,0)
 ;;=3^Dermabrasion,Segmental,Face
 ;;^UTILITY(U,$J,358.3,39976,0)
 ;;=15782^^185^2064^1^^^^1
 ;;^UTILITY(U,$J,358.3,39976,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,39976,1,2,0)
 ;;=2^15782
 ;;^UTILITY(U,$J,358.3,39976,1,3,0)
 ;;=3^Dermabrasion,Regional,Not Face
 ;;^UTILITY(U,$J,358.3,39977,0)
 ;;=15783^^185^2064^5^^^^1
 ;;^UTILITY(U,$J,358.3,39977,1,0)
 ;;=^358.31IA^3^2

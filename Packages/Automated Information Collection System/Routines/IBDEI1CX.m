IBDEI1CX ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,22616,1,3,0)
 ;;=3^Anticoag Mgmt,Subseq Visit
 ;;^UTILITY(U,$J,358.3,22617,0)
 ;;=99201^^103^1050^1
 ;;^UTILITY(U,$J,358.3,22617,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22617,1,1,0)
 ;;=1^Problem Focus
 ;;^UTILITY(U,$J,358.3,22617,1,2,0)
 ;;=2^99201
 ;;^UTILITY(U,$J,358.3,22618,0)
 ;;=99202^^103^1050^2
 ;;^UTILITY(U,$J,358.3,22618,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22618,1,1,0)
 ;;=1^Expanded Problem Focus
 ;;^UTILITY(U,$J,358.3,22618,1,2,0)
 ;;=2^99202
 ;;^UTILITY(U,$J,358.3,22619,0)
 ;;=99203^^103^1050^3
 ;;^UTILITY(U,$J,358.3,22619,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22619,1,1,0)
 ;;=1^Detailed
 ;;^UTILITY(U,$J,358.3,22619,1,2,0)
 ;;=2^99203
 ;;^UTILITY(U,$J,358.3,22620,0)
 ;;=99204^^103^1050^4
 ;;^UTILITY(U,$J,358.3,22620,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22620,1,1,0)
 ;;=1^Comprehensive, Moderate
 ;;^UTILITY(U,$J,358.3,22620,1,2,0)
 ;;=2^99204
 ;;^UTILITY(U,$J,358.3,22621,0)
 ;;=99205^^103^1050^5
 ;;^UTILITY(U,$J,358.3,22621,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22621,1,1,0)
 ;;=1^Comprehensive, High
 ;;^UTILITY(U,$J,358.3,22621,1,2,0)
 ;;=2^99205
 ;;^UTILITY(U,$J,358.3,22622,0)
 ;;=99211^^103^1051^1
 ;;^UTILITY(U,$J,358.3,22622,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22622,1,1,0)
 ;;=1^Nursing Visit (no MD seen)
 ;;^UTILITY(U,$J,358.3,22622,1,2,0)
 ;;=2^99211
 ;;^UTILITY(U,$J,358.3,22623,0)
 ;;=99212^^103^1051^2
 ;;^UTILITY(U,$J,358.3,22623,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22623,1,1,0)
 ;;=1^Problem Focused
 ;;^UTILITY(U,$J,358.3,22623,1,2,0)
 ;;=2^99212
 ;;^UTILITY(U,$J,358.3,22624,0)
 ;;=99213^^103^1051^3
 ;;^UTILITY(U,$J,358.3,22624,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22624,1,1,0)
 ;;=1^Expanded Problem Focus
 ;;^UTILITY(U,$J,358.3,22624,1,2,0)
 ;;=2^99213
 ;;^UTILITY(U,$J,358.3,22625,0)
 ;;=99214^^103^1051^4
 ;;^UTILITY(U,$J,358.3,22625,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22625,1,1,0)
 ;;=1^Detailed
 ;;^UTILITY(U,$J,358.3,22625,1,2,0)
 ;;=2^99214
 ;;^UTILITY(U,$J,358.3,22626,0)
 ;;=99215^^103^1051^5
 ;;^UTILITY(U,$J,358.3,22626,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22626,1,1,0)
 ;;=1^Comprehensive
 ;;^UTILITY(U,$J,358.3,22626,1,2,0)
 ;;=2^99215
 ;;^UTILITY(U,$J,358.3,22627,0)
 ;;=99241^^103^1052^1
 ;;^UTILITY(U,$J,358.3,22627,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22627,1,1,0)
 ;;=1^Problem Focused
 ;;^UTILITY(U,$J,358.3,22627,1,2,0)
 ;;=2^99241
 ;;^UTILITY(U,$J,358.3,22628,0)
 ;;=99242^^103^1052^2
 ;;^UTILITY(U,$J,358.3,22628,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22628,1,1,0)
 ;;=1^Expanded Problem Focus
 ;;^UTILITY(U,$J,358.3,22628,1,2,0)
 ;;=2^99242
 ;;^UTILITY(U,$J,358.3,22629,0)
 ;;=99243^^103^1052^3
 ;;^UTILITY(U,$J,358.3,22629,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22629,1,1,0)
 ;;=1^Detailed
 ;;^UTILITY(U,$J,358.3,22629,1,2,0)
 ;;=2^99243
 ;;^UTILITY(U,$J,358.3,22630,0)
 ;;=99244^^103^1052^4
 ;;^UTILITY(U,$J,358.3,22630,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22630,1,1,0)
 ;;=1^Comprehensive, Moderate
 ;;^UTILITY(U,$J,358.3,22630,1,2,0)
 ;;=2^99244
 ;;^UTILITY(U,$J,358.3,22631,0)
 ;;=99245^^103^1052^5
 ;;^UTILITY(U,$J,358.3,22631,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22631,1,1,0)
 ;;=1^Comprehensive, High
 ;;^UTILITY(U,$J,358.3,22631,1,2,0)
 ;;=2^99245
 ;;^UTILITY(U,$J,358.3,22632,0)
 ;;=99024^^103^1053^1
 ;;^UTILITY(U,$J,358.3,22632,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,22632,1,1,0)
 ;;=1^Post-Op Follow-up Visit
 ;;^UTILITY(U,$J,358.3,22632,1,2,0)
 ;;=2^99024
 ;;^UTILITY(U,$J,358.3,22633,0)
 ;;=D61.1^^104^1054^7
 ;;^UTILITY(U,$J,358.3,22633,1,0)
 ;;=^358.31IA^4^2
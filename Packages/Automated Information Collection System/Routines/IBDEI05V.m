IBDEI05V ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,2145,0)
 ;;=99242^^18^189^2
 ;;^UTILITY(U,$J,358.3,2145,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,2145,1,1,0)
 ;;=1^Expanded Problem Focus
 ;;^UTILITY(U,$J,358.3,2145,1,2,0)
 ;;=2^99242
 ;;^UTILITY(U,$J,358.3,2146,0)
 ;;=99243^^18^189^3
 ;;^UTILITY(U,$J,358.3,2146,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,2146,1,1,0)
 ;;=1^Detailed
 ;;^UTILITY(U,$J,358.3,2146,1,2,0)
 ;;=2^99243
 ;;^UTILITY(U,$J,358.3,2147,0)
 ;;=99244^^18^189^4
 ;;^UTILITY(U,$J,358.3,2147,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,2147,1,1,0)
 ;;=1^Comprehensive, Moderate
 ;;^UTILITY(U,$J,358.3,2147,1,2,0)
 ;;=2^99244
 ;;^UTILITY(U,$J,358.3,2148,0)
 ;;=99245^^18^189^5
 ;;^UTILITY(U,$J,358.3,2148,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,2148,1,1,0)
 ;;=1^Comprehensive, High
 ;;^UTILITY(U,$J,358.3,2148,1,2,0)
 ;;=2^99245
 ;;^UTILITY(U,$J,358.3,2149,0)
 ;;=I44.2^^19^190^3
 ;;^UTILITY(U,$J,358.3,2149,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2149,1,3,0)
 ;;=3^AV Block,Complete
 ;;^UTILITY(U,$J,358.3,2149,1,4,0)
 ;;=4^I44.2
 ;;^UTILITY(U,$J,358.3,2149,2)
 ;;=^259621
 ;;^UTILITY(U,$J,358.3,2150,0)
 ;;=I44.30^^19^190^4
 ;;^UTILITY(U,$J,358.3,2150,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2150,1,3,0)
 ;;=3^AV Block,Unspec
 ;;^UTILITY(U,$J,358.3,2150,1,4,0)
 ;;=4^I44.30
 ;;^UTILITY(U,$J,358.3,2150,2)
 ;;=^5007204
 ;;^UTILITY(U,$J,358.3,2151,0)
 ;;=I44.0^^19^190^1
 ;;^UTILITY(U,$J,358.3,2151,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2151,1,3,0)
 ;;=3^AV Block,1st Degree
 ;;^UTILITY(U,$J,358.3,2151,1,4,0)
 ;;=4^I44.0
 ;;^UTILITY(U,$J,358.3,2151,2)
 ;;=^5007202
 ;;^UTILITY(U,$J,358.3,2152,0)
 ;;=I44.1^^19^190^2
 ;;^UTILITY(U,$J,358.3,2152,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2152,1,3,0)
 ;;=3^AV Block,2nd Degree
 ;;^UTILITY(U,$J,358.3,2152,1,4,0)
 ;;=4^I44.1
 ;;^UTILITY(U,$J,358.3,2152,2)
 ;;=^5007203
 ;;^UTILITY(U,$J,358.3,2153,0)
 ;;=I44.5^^19^190^24
 ;;^UTILITY(U,$J,358.3,2153,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2153,1,3,0)
 ;;=3^Left Posterior Fascicular Block
 ;;^UTILITY(U,$J,358.3,2153,1,4,0)
 ;;=4^I44.5
 ;;^UTILITY(U,$J,358.3,2153,2)
 ;;=^5007207
 ;;^UTILITY(U,$J,358.3,2154,0)
 ;;=I44.60^^19^190^20
 ;;^UTILITY(U,$J,358.3,2154,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2154,1,3,0)
 ;;=3^Fascicular Block,Unspec
 ;;^UTILITY(U,$J,358.3,2154,1,4,0)
 ;;=4^I44.60
 ;;^UTILITY(U,$J,358.3,2154,2)
 ;;=^5007208
 ;;^UTILITY(U,$J,358.3,2155,0)
 ;;=I44.69^^19^190^19
 ;;^UTILITY(U,$J,358.3,2155,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2155,1,3,0)
 ;;=3^Fascicular Block NEC
 ;;^UTILITY(U,$J,358.3,2155,1,4,0)
 ;;=4^I44.69
 ;;^UTILITY(U,$J,358.3,2155,2)
 ;;=^5007209
 ;;^UTILITY(U,$J,358.3,2156,0)
 ;;=I44.4^^19^190^22
 ;;^UTILITY(U,$J,358.3,2156,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2156,1,3,0)
 ;;=3^Left Anterior Fascicular Block
 ;;^UTILITY(U,$J,358.3,2156,1,4,0)
 ;;=4^I44.4
 ;;^UTILITY(U,$J,358.3,2156,2)
 ;;=^5007206
 ;;^UTILITY(U,$J,358.3,2157,0)
 ;;=I44.7^^19^190^23
 ;;^UTILITY(U,$J,358.3,2157,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2157,1,3,0)
 ;;=3^Left Bundle-Branch Block,Unspec
 ;;^UTILITY(U,$J,358.3,2157,1,4,0)
 ;;=4^I44.7
 ;;^UTILITY(U,$J,358.3,2157,2)
 ;;=^5007210
 ;;^UTILITY(U,$J,358.3,2158,0)
 ;;=I45.0^^19^190^39
 ;;^UTILITY(U,$J,358.3,2158,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2158,1,3,0)
 ;;=3^Right Fascicular Block
 ;;^UTILITY(U,$J,358.3,2158,1,4,0)
 ;;=4^I45.0
 ;;^UTILITY(U,$J,358.3,2158,2)
 ;;=^5007211
 ;;^UTILITY(U,$J,358.3,2159,0)
 ;;=I45.19^^19^190^37
 ;;^UTILITY(U,$J,358.3,2159,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2159,1,3,0)
 ;;=3^Right Bundle-Branch Block NEC

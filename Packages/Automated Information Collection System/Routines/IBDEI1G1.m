IBDEI1G1 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,24109,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24109,1,3,0)
 ;;=3^Irritability & anger
 ;;^UTILITY(U,$J,358.3,24109,1,4,0)
 ;;=4^R45.4
 ;;^UTILITY(U,$J,358.3,24109,2)
 ;;=^5019465
 ;;^UTILITY(U,$J,358.3,24110,0)
 ;;=R53.83^^116^1183^7
 ;;^UTILITY(U,$J,358.3,24110,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24110,1,3,0)
 ;;=3^Fatigue
 ;;^UTILITY(U,$J,358.3,24110,1,4,0)
 ;;=4^R53.83
 ;;^UTILITY(U,$J,358.3,24110,2)
 ;;=^5019520
 ;;^UTILITY(U,$J,358.3,24111,0)
 ;;=R45.851^^116^1183^13
 ;;^UTILITY(U,$J,358.3,24111,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24111,1,3,0)
 ;;=3^Suicidal ideations
 ;;^UTILITY(U,$J,358.3,24111,1,4,0)
 ;;=4^R45.851
 ;;^UTILITY(U,$J,358.3,24111,2)
 ;;=^5019474
 ;;^UTILITY(U,$J,358.3,24112,0)
 ;;=R63.5^^116^1183^1
 ;;^UTILITY(U,$J,358.3,24112,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24112,1,3,0)
 ;;=3^Abnormal weight gain
 ;;^UTILITY(U,$J,358.3,24112,1,4,0)
 ;;=4^R63.5
 ;;^UTILITY(U,$J,358.3,24112,2)
 ;;=^5019543
 ;;^UTILITY(U,$J,358.3,24113,0)
 ;;=R41.82^^116^1183^3
 ;;^UTILITY(U,$J,358.3,24113,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24113,1,3,0)
 ;;=3^Altered Mental Status
 ;;^UTILITY(U,$J,358.3,24113,1,4,0)
 ;;=4^R41.82
 ;;^UTILITY(U,$J,358.3,24113,2)
 ;;=^5019441
 ;;^UTILITY(U,$J,358.3,24114,0)
 ;;=R45.850^^116^1183^9
 ;;^UTILITY(U,$J,358.3,24114,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24114,1,3,0)
 ;;=3^Homicidal Ideations
 ;;^UTILITY(U,$J,358.3,24114,1,4,0)
 ;;=4^R45.850
 ;;^UTILITY(U,$J,358.3,24114,2)
 ;;=^5019473
 ;;^UTILITY(U,$J,358.3,24115,0)
 ;;=I80.201^^116^1184^5
 ;;^UTILITY(U,$J,358.3,24115,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24115,1,3,0)
 ;;=3^Thombophlb & Phlbts Deep Vessels Right Lower Extrem
 ;;^UTILITY(U,$J,358.3,24115,1,4,0)
 ;;=4^I80.201
 ;;^UTILITY(U,$J,358.3,24115,2)
 ;;=^5007828
 ;;^UTILITY(U,$J,358.3,24116,0)
 ;;=I80.202^^116^1184^4
 ;;^UTILITY(U,$J,358.3,24116,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24116,1,3,0)
 ;;=3^Thombophlb & Phlbts Deep Vessels Left Lower Extrem
 ;;^UTILITY(U,$J,358.3,24116,1,4,0)
 ;;=4^I80.202
 ;;^UTILITY(U,$J,358.3,24116,2)
 ;;=^5007829
 ;;^UTILITY(U,$J,358.3,24117,0)
 ;;=I80.203^^116^1184^3
 ;;^UTILITY(U,$J,358.3,24117,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24117,1,3,0)
 ;;=3^Thombophlb & Phlbts Deep Vessels Bilateral Lower Extrem
 ;;^UTILITY(U,$J,358.3,24117,1,4,0)
 ;;=4^I80.203
 ;;^UTILITY(U,$J,358.3,24117,2)
 ;;=^5007830
 ;;^UTILITY(U,$J,358.3,24118,0)
 ;;=J06.9^^116^1184^14
 ;;^UTILITY(U,$J,358.3,24118,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24118,1,3,0)
 ;;=3^Upper resp infect, acute, unspec
 ;;^UTILITY(U,$J,358.3,24118,1,4,0)
 ;;=4^J06.9
 ;;^UTILITY(U,$J,358.3,24118,2)
 ;;=^5008143
 ;;^UTILITY(U,$J,358.3,24119,0)
 ;;=B35.3^^116^1184^7
 ;;^UTILITY(U,$J,358.3,24119,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24119,1,3,0)
 ;;=3^Tinea pedis
 ;;^UTILITY(U,$J,358.3,24119,1,4,0)
 ;;=4^B35.3
 ;;^UTILITY(U,$J,358.3,24119,2)
 ;;=^119732
 ;;^UTILITY(U,$J,358.3,24120,0)
 ;;=H93.11^^116^1184^10
 ;;^UTILITY(U,$J,358.3,24120,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24120,1,3,0)
 ;;=3^Tinnitus, right ear
 ;;^UTILITY(U,$J,358.3,24120,1,4,0)
 ;;=4^H93.11
 ;;^UTILITY(U,$J,358.3,24120,2)
 ;;=^5006964
 ;;^UTILITY(U,$J,358.3,24121,0)
 ;;=H93.12^^116^1184^9
 ;;^UTILITY(U,$J,358.3,24121,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24121,1,3,0)
 ;;=3^Tinnitus, left ear
 ;;^UTILITY(U,$J,358.3,24121,1,4,0)
 ;;=4^H93.12
 ;;^UTILITY(U,$J,358.3,24121,2)
 ;;=^5006965
 ;;^UTILITY(U,$J,358.3,24122,0)
 ;;=H93.13^^116^1184^8
 ;;^UTILITY(U,$J,358.3,24122,1,0)
 ;;=^358.31IA^4^2
IBDEI0D0 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,5648,0)
 ;;=C44.90^^40^372^18
 ;;^UTILITY(U,$J,358.3,5648,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5648,1,3,0)
 ;;=3^Malig Neop of Skin,Unspec
 ;;^UTILITY(U,$J,358.3,5648,1,4,0)
 ;;=4^C44.90
 ;;^UTILITY(U,$J,358.3,5648,2)
 ;;=^5001091
 ;;^UTILITY(U,$J,358.3,5649,0)
 ;;=C43.9^^40^373^16
 ;;^UTILITY(U,$J,358.3,5649,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5649,1,3,0)
 ;;=3^Malig Melanoma of Skin,Unspec
 ;;^UTILITY(U,$J,358.3,5649,1,4,0)
 ;;=4^C43.9
 ;;^UTILITY(U,$J,358.3,5649,2)
 ;;=^5001015
 ;;^UTILITY(U,$J,358.3,5650,0)
 ;;=C43.0^^40^373^7
 ;;^UTILITY(U,$J,358.3,5650,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5650,1,3,0)
 ;;=3^Malig Melanoma of Lip
 ;;^UTILITY(U,$J,358.3,5650,1,4,0)
 ;;=4^C43.0
 ;;^UTILITY(U,$J,358.3,5650,2)
 ;;=^5000994
 ;;^UTILITY(U,$J,358.3,5651,0)
 ;;=C43.11^^40^373^11
 ;;^UTILITY(U,$J,358.3,5651,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5651,1,3,0)
 ;;=3^Malig Melanoma of Right Eyelid
 ;;^UTILITY(U,$J,358.3,5651,1,4,0)
 ;;=4^C43.11
 ;;^UTILITY(U,$J,358.3,5651,2)
 ;;=^5000996
 ;;^UTILITY(U,$J,358.3,5652,0)
 ;;=C43.12^^40^373^4
 ;;^UTILITY(U,$J,358.3,5652,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5652,1,3,0)
 ;;=3^Malig Melanoma of Left Eyelid
 ;;^UTILITY(U,$J,358.3,5652,1,4,0)
 ;;=4^C43.12
 ;;^UTILITY(U,$J,358.3,5652,2)
 ;;=^5000997
 ;;^UTILITY(U,$J,358.3,5653,0)
 ;;=C43.21^^40^373^10
 ;;^UTILITY(U,$J,358.3,5653,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5653,1,3,0)
 ;;=3^Malig Melanoma of Right Ear/External Auricular Canal
 ;;^UTILITY(U,$J,358.3,5653,1,4,0)
 ;;=4^C43.21
 ;;^UTILITY(U,$J,358.3,5653,2)
 ;;=^5000999
 ;;^UTILITY(U,$J,358.3,5654,0)
 ;;=C43.22^^40^373^3
 ;;^UTILITY(U,$J,358.3,5654,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5654,1,3,0)
 ;;=3^Malig Melanoma of Left Ear/External Auricular Canal
 ;;^UTILITY(U,$J,358.3,5654,1,4,0)
 ;;=4^C43.22
 ;;^UTILITY(U,$J,358.3,5654,2)
 ;;=^5001000
 ;;^UTILITY(U,$J,358.3,5655,0)
 ;;=C43.31^^40^373^8
 ;;^UTILITY(U,$J,358.3,5655,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5655,1,3,0)
 ;;=3^Malig Melanoma of Nose
 ;;^UTILITY(U,$J,358.3,5655,1,4,0)
 ;;=4^C43.31
 ;;^UTILITY(U,$J,358.3,5655,2)
 ;;=^5001002
 ;;^UTILITY(U,$J,358.3,5656,0)
 ;;=C43.39^^40^373^2
 ;;^UTILITY(U,$J,358.3,5656,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5656,1,3,0)
 ;;=3^Malig Melanoma of Face NEC
 ;;^UTILITY(U,$J,358.3,5656,1,4,0)
 ;;=4^C43.39
 ;;^UTILITY(U,$J,358.3,5656,2)
 ;;=^5001003
 ;;^UTILITY(U,$J,358.3,5657,0)
 ;;=C43.4^^40^373^14
 ;;^UTILITY(U,$J,358.3,5657,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5657,1,3,0)
 ;;=3^Malig Melanoma of Scalp/Neck
 ;;^UTILITY(U,$J,358.3,5657,1,4,0)
 ;;=4^C43.4
 ;;^UTILITY(U,$J,358.3,5657,2)
 ;;=^5001004
 ;;^UTILITY(U,$J,358.3,5658,0)
 ;;=C43.51^^40^373^1
 ;;^UTILITY(U,$J,358.3,5658,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5658,1,3,0)
 ;;=3^Malig Melanoma of Anal Skin
 ;;^UTILITY(U,$J,358.3,5658,1,4,0)
 ;;=4^C43.51
 ;;^UTILITY(U,$J,358.3,5658,2)
 ;;=^5001005
 ;;^UTILITY(U,$J,358.3,5659,0)
 ;;=C43.52^^40^373^15
 ;;^UTILITY(U,$J,358.3,5659,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5659,1,3,0)
 ;;=3^Malig Melanoma of Skin of Breast
 ;;^UTILITY(U,$J,358.3,5659,1,4,0)
 ;;=4^C43.52
 ;;^UTILITY(U,$J,358.3,5659,2)
 ;;=^5001006
 ;;^UTILITY(U,$J,358.3,5660,0)
 ;;=C43.59^^40^373^17
 ;;^UTILITY(U,$J,358.3,5660,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5660,1,3,0)
 ;;=3^Malig Melanoma of Trunk NEC
 ;;^UTILITY(U,$J,358.3,5660,1,4,0)
 ;;=4^C43.59
 ;;^UTILITY(U,$J,358.3,5660,2)
 ;;=^5001007
 ;;^UTILITY(U,$J,358.3,5661,0)
 ;;=C43.61^^40^373^13
 ;;^UTILITY(U,$J,358.3,5661,1,0)
 ;;=^358.31IA^4^2
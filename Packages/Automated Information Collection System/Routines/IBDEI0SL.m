IBDEI0SL ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,13153,1,4,0)
 ;;=4^H40.241
 ;;^UTILITY(U,$J,358.3,13153,2)
 ;;=^5005843
 ;;^UTILITY(U,$J,358.3,13154,0)
 ;;=H40.242^^80^754^114
 ;;^UTILITY(U,$J,358.3,13154,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13154,1,3,0)
 ;;=3^Residual Stage Angle-Closure Glaucoma,Left Eye
 ;;^UTILITY(U,$J,358.3,13154,1,4,0)
 ;;=4^H40.242
 ;;^UTILITY(U,$J,358.3,13154,2)
 ;;=^5005844
 ;;^UTILITY(U,$J,358.3,13155,0)
 ;;=H40.61X0^^80^754^43
 ;;^UTILITY(U,$J,358.3,13155,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13155,1,3,0)
 ;;=3^Drug-Induced Glaucoma,Right Eye,Unspec Stage
 ;;^UTILITY(U,$J,358.3,13155,1,4,0)
 ;;=4^H40.61X0
 ;;^UTILITY(U,$J,358.3,13155,2)
 ;;=^5005906
 ;;^UTILITY(U,$J,358.3,13156,0)
 ;;=H40.61X2^^80^754^41
 ;;^UTILITY(U,$J,358.3,13156,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13156,1,3,0)
 ;;=3^Drug-Induced Glaucoma,Right Eye,Moderate Stage
 ;;^UTILITY(U,$J,358.3,13156,1,4,0)
 ;;=4^H40.61X2
 ;;^UTILITY(U,$J,358.3,13156,2)
 ;;=^5005908
 ;;^UTILITY(U,$J,358.3,13157,0)
 ;;=H40.61X3^^80^754^42
 ;;^UTILITY(U,$J,358.3,13157,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13157,1,3,0)
 ;;=3^Drug-Induced Glaucoma,Right Eye,Severe Stage
 ;;^UTILITY(U,$J,358.3,13157,1,4,0)
 ;;=4^H40.61X3
 ;;^UTILITY(U,$J,358.3,13157,2)
 ;;=^5133509
 ;;^UTILITY(U,$J,358.3,13158,0)
 ;;=H40.61X4^^80^754^39
 ;;^UTILITY(U,$J,358.3,13158,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13158,1,3,0)
 ;;=3^Drug-Induced Glaucoma,Right Eye,Indeterminate Stage
 ;;^UTILITY(U,$J,358.3,13158,1,4,0)
 ;;=4^H40.61X4
 ;;^UTILITY(U,$J,358.3,13158,2)
 ;;=^5005909
 ;;^UTILITY(U,$J,358.3,13159,0)
 ;;=H40.62X1^^80^754^35
 ;;^UTILITY(U,$J,358.3,13159,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13159,1,3,0)
 ;;=3^Drug-Induced Glaucoma,Left Eye,Mild Stage
 ;;^UTILITY(U,$J,358.3,13159,1,4,0)
 ;;=4^H40.62X1
 ;;^UTILITY(U,$J,358.3,13159,2)
 ;;=^5005911
 ;;^UTILITY(U,$J,358.3,13160,0)
 ;;=H40.62X0^^80^754^38
 ;;^UTILITY(U,$J,358.3,13160,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13160,1,3,0)
 ;;=3^Drug-Induced Glaucoma,Left Eye,Unspec Stage
 ;;^UTILITY(U,$J,358.3,13160,1,4,0)
 ;;=4^H40.62X0
 ;;^UTILITY(U,$J,358.3,13160,2)
 ;;=^5005910
 ;;^UTILITY(U,$J,358.3,13161,0)
 ;;=H40.62X2^^80^754^36
 ;;^UTILITY(U,$J,358.3,13161,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13161,1,3,0)
 ;;=3^Drug-Induced Glaucoma,Left Eye,Moderate Stage
 ;;^UTILITY(U,$J,358.3,13161,1,4,0)
 ;;=4^H40.62X2
 ;;^UTILITY(U,$J,358.3,13161,2)
 ;;=^5005912
 ;;^UTILITY(U,$J,358.3,13162,0)
 ;;=H40.62X3^^80^754^37
 ;;^UTILITY(U,$J,358.3,13162,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13162,1,3,0)
 ;;=3^Drug-Induced Glaucoma,Left Eye,Severe Stage
 ;;^UTILITY(U,$J,358.3,13162,1,4,0)
 ;;=4^H40.62X3
 ;;^UTILITY(U,$J,358.3,13162,2)
 ;;=^5133510
 ;;^UTILITY(U,$J,358.3,13163,0)
 ;;=H40.62X4^^80^754^34
 ;;^UTILITY(U,$J,358.3,13163,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13163,1,3,0)
 ;;=3^Drug-Induced Glaucoma,Left Eye,Indeterminate Stage
 ;;^UTILITY(U,$J,358.3,13163,1,4,0)
 ;;=4^H40.62X4
 ;;^UTILITY(U,$J,358.3,13163,2)
 ;;=^5005913
 ;;^UTILITY(U,$J,358.3,13164,0)
 ;;=H40.63X0^^80^754^33
 ;;^UTILITY(U,$J,358.3,13164,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13164,1,3,0)
 ;;=3^Drug-Induced Glaucoma,Bilateral,Unspec Stage
 ;;^UTILITY(U,$J,358.3,13164,1,4,0)
 ;;=4^H40.63X0
 ;;^UTILITY(U,$J,358.3,13164,2)
 ;;=^5005914
 ;;^UTILITY(U,$J,358.3,13165,0)
 ;;=H40.63X1^^80^754^30
 ;;^UTILITY(U,$J,358.3,13165,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13165,1,3,0)
 ;;=3^Drug-Induced Glaucoma,Bilateral,Mild Stage
 ;;^UTILITY(U,$J,358.3,13165,1,4,0)
 ;;=4^H40.63X1
 ;;^UTILITY(U,$J,358.3,13165,2)
 ;;=^5005915

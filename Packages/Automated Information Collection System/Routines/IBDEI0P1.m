IBDEI0P1 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,11459,1,4,0)
 ;;=4^J47.1
 ;;^UTILITY(U,$J,358.3,11459,2)
 ;;=^5008259
 ;;^UTILITY(U,$J,358.3,11460,0)
 ;;=J47.0^^68^685^8
 ;;^UTILITY(U,$J,358.3,11460,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11460,1,3,0)
 ;;=3^Bronchiectasis w/ Acute Lower Respiratory Infection
 ;;^UTILITY(U,$J,358.3,11460,1,4,0)
 ;;=4^J47.0
 ;;^UTILITY(U,$J,358.3,11460,2)
 ;;=^5008258
 ;;^UTILITY(U,$J,358.3,11461,0)
 ;;=R09.1^^68^685^37
 ;;^UTILITY(U,$J,358.3,11461,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11461,1,3,0)
 ;;=3^Pleurisy
 ;;^UTILITY(U,$J,358.3,11461,1,4,0)
 ;;=4^R09.1
 ;;^UTILITY(U,$J,358.3,11461,2)
 ;;=^95428
 ;;^UTILITY(U,$J,358.3,11462,0)
 ;;=J94.9^^68^685^33
 ;;^UTILITY(U,$J,358.3,11462,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11462,1,3,0)
 ;;=3^Pleural Condition,Unspec
 ;;^UTILITY(U,$J,358.3,11462,1,4,0)
 ;;=4^J94.9
 ;;^UTILITY(U,$J,358.3,11462,2)
 ;;=^5008320
 ;;^UTILITY(U,$J,358.3,11463,0)
 ;;=J92.9^^68^685^36
 ;;^UTILITY(U,$J,358.3,11463,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11463,1,3,0)
 ;;=3^Pleural Plaque w/o Asbestos
 ;;^UTILITY(U,$J,358.3,11463,1,4,0)
 ;;=4^J92.9
 ;;^UTILITY(U,$J,358.3,11463,2)
 ;;=^5008313
 ;;^UTILITY(U,$J,358.3,11464,0)
 ;;=J94.8^^68^685^34
 ;;^UTILITY(U,$J,358.3,11464,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11464,1,3,0)
 ;;=3^Pleural Conditions,Other Spec
 ;;^UTILITY(U,$J,358.3,11464,1,4,0)
 ;;=4^J94.8
 ;;^UTILITY(U,$J,358.3,11464,2)
 ;;=^5008319
 ;;^UTILITY(U,$J,358.3,11465,0)
 ;;=J86.9^^68^685^38
 ;;^UTILITY(U,$J,358.3,11465,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11465,1,3,0)
 ;;=3^Pyothorax w/o Fistula
 ;;^UTILITY(U,$J,358.3,11465,1,4,0)
 ;;=4^J86.9
 ;;^UTILITY(U,$J,358.3,11465,2)
 ;;=^5008309
 ;;^UTILITY(U,$J,358.3,11466,0)
 ;;=J91.8^^68^685^35
 ;;^UTILITY(U,$J,358.3,11466,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11466,1,3,0)
 ;;=3^Pleural Effusion in Other Conditions
 ;;^UTILITY(U,$J,358.3,11466,1,4,0)
 ;;=4^J91.8
 ;;^UTILITY(U,$J,358.3,11466,2)
 ;;=^5008311
 ;;^UTILITY(U,$J,358.3,11467,0)
 ;;=J84.9^^68^685^29
 ;;^UTILITY(U,$J,358.3,11467,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11467,1,3,0)
 ;;=3^Interstitial Pulmonary Disease/Pneumonia,Unspec
 ;;^UTILITY(U,$J,358.3,11467,1,4,0)
 ;;=4^J84.9
 ;;^UTILITY(U,$J,358.3,11467,2)
 ;;=^5008304
 ;;^UTILITY(U,$J,358.3,11468,0)
 ;;=J98.01^^68^685^11
 ;;^UTILITY(U,$J,358.3,11468,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11468,1,3,0)
 ;;=3^Bronchospasm,Acute
 ;;^UTILITY(U,$J,358.3,11468,1,4,0)
 ;;=4^J98.01
 ;;^UTILITY(U,$J,358.3,11468,2)
 ;;=^334092
 ;;^UTILITY(U,$J,358.3,11469,0)
 ;;=G47.30^^68^685^53
 ;;^UTILITY(U,$J,358.3,11469,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11469,1,3,0)
 ;;=3^Sleep Apnea,Unspec
 ;;^UTILITY(U,$J,358.3,11469,1,4,0)
 ;;=4^G47.30
 ;;^UTILITY(U,$J,358.3,11469,2)
 ;;=^5003977
 ;;^UTILITY(U,$J,358.3,11470,0)
 ;;=R06.02^^68^685^52
 ;;^UTILITY(U,$J,358.3,11470,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11470,1,3,0)
 ;;=3^Shortness of Breath
 ;;^UTILITY(U,$J,358.3,11470,1,4,0)
 ;;=4^R06.02
 ;;^UTILITY(U,$J,358.3,11470,2)
 ;;=^5019181
 ;;^UTILITY(U,$J,358.3,11471,0)
 ;;=R06.09^^68^685^17
 ;;^UTILITY(U,$J,358.3,11471,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11471,1,3,0)
 ;;=3^Dyspnea,Other Forms
 ;;^UTILITY(U,$J,358.3,11471,1,4,0)
 ;;=4^R06.09
 ;;^UTILITY(U,$J,358.3,11471,2)
 ;;=^5019182
 ;;^UTILITY(U,$J,358.3,11472,0)
 ;;=R06.00^^68^685^18
 ;;^UTILITY(U,$J,358.3,11472,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11472,1,3,0)
 ;;=3^Dyspnea,Unspec
 ;;^UTILITY(U,$J,358.3,11472,1,4,0)
 ;;=4^R06.00
 ;;^UTILITY(U,$J,358.3,11472,2)
 ;;=^5019180
 ;;^UTILITY(U,$J,358.3,11473,0)
 ;;=R06.89^^68^685^6

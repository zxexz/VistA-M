IBDEI1LV ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,26867,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26867,1,3,0)
 ;;=3^Nicotine Dependence,Cigarettes
 ;;^UTILITY(U,$J,358.3,26867,1,4,0)
 ;;=4^F17.219
 ;;^UTILITY(U,$J,358.3,26867,2)
 ;;=^5003369
 ;;^UTILITY(U,$J,358.3,26868,0)
 ;;=F17.299^^132^1304^40
 ;;^UTILITY(U,$J,358.3,26868,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26868,1,3,0)
 ;;=3^Nicotine Dependence,E-Cigarettes
 ;;^UTILITY(U,$J,358.3,26868,1,4,0)
 ;;=4^F17.299
 ;;^UTILITY(U,$J,358.3,26868,2)
 ;;=^5003379
 ;;^UTILITY(U,$J,358.3,26869,0)
 ;;=Z51.81^^132^1305^17
 ;;^UTILITY(U,$J,358.3,26869,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26869,1,3,0)
 ;;=3^Therapeutic Drug Level Monitoring
 ;;^UTILITY(U,$J,358.3,26869,1,4,0)
 ;;=4^Z51.81
 ;;^UTILITY(U,$J,358.3,26869,2)
 ;;=^5063064
 ;;^UTILITY(U,$J,358.3,26870,0)
 ;;=Z02.79^^132^1305^11
 ;;^UTILITY(U,$J,358.3,26870,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26870,1,3,0)
 ;;=3^Issue of Medical Certificate NEC
 ;;^UTILITY(U,$J,358.3,26870,1,4,0)
 ;;=4^Z02.79
 ;;^UTILITY(U,$J,358.3,26870,2)
 ;;=^5062641
 ;;^UTILITY(U,$J,358.3,26871,0)
 ;;=Z76.0^^132^1305^12
 ;;^UTILITY(U,$J,358.3,26871,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26871,1,3,0)
 ;;=3^Issue of Repeat Prescription
 ;;^UTILITY(U,$J,358.3,26871,1,4,0)
 ;;=4^Z76.0
 ;;^UTILITY(U,$J,358.3,26871,2)
 ;;=^5063297
 ;;^UTILITY(U,$J,358.3,26872,0)
 ;;=Z04.9^^132^1305^3
 ;;^UTILITY(U,$J,358.3,26872,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26872,1,3,0)
 ;;=3^Exam & Observation for Unsp Reason
 ;;^UTILITY(U,$J,358.3,26872,1,4,0)
 ;;=4^Z04.9
 ;;^UTILITY(U,$J,358.3,26872,2)
 ;;=^5062666
 ;;^UTILITY(U,$J,358.3,26873,0)
 ;;=Z02.2^^132^1305^4
 ;;^UTILITY(U,$J,358.3,26873,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26873,1,3,0)
 ;;=3^Exam for Admission to Residential Institution
 ;;^UTILITY(U,$J,358.3,26873,1,4,0)
 ;;=4^Z02.2
 ;;^UTILITY(U,$J,358.3,26873,2)
 ;;=^5062635
 ;;^UTILITY(U,$J,358.3,26874,0)
 ;;=Z02.4^^132^1305^5
 ;;^UTILITY(U,$J,358.3,26874,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26874,1,3,0)
 ;;=3^Exam for Driving License
 ;;^UTILITY(U,$J,358.3,26874,1,4,0)
 ;;=4^Z02.4
 ;;^UTILITY(U,$J,358.3,26874,2)
 ;;=^5062637
 ;;^UTILITY(U,$J,358.3,26875,0)
 ;;=Z00.5^^132^1305^7
 ;;^UTILITY(U,$J,358.3,26875,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26875,1,3,0)
 ;;=3^Exam of Potential Donor of Organ/Tissue
 ;;^UTILITY(U,$J,358.3,26875,1,4,0)
 ;;=4^Z00.5
 ;;^UTILITY(U,$J,358.3,26875,2)
 ;;=^5062607
 ;;^UTILITY(U,$J,358.3,26876,0)
 ;;=Z02.3^^132^1305^6
 ;;^UTILITY(U,$J,358.3,26876,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26876,1,3,0)
 ;;=3^Exam for Recruitment to Armed Forces
 ;;^UTILITY(U,$J,358.3,26876,1,4,0)
 ;;=4^Z02.3
 ;;^UTILITY(U,$J,358.3,26876,2)
 ;;=^5062636
 ;;^UTILITY(U,$J,358.3,26877,0)
 ;;=Z02.89^^132^1305^1
 ;;^UTILITY(U,$J,358.3,26877,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26877,1,3,0)
 ;;=3^Admin Exam NEC
 ;;^UTILITY(U,$J,358.3,26877,1,4,0)
 ;;=4^Z02.89
 ;;^UTILITY(U,$J,358.3,26877,2)
 ;;=^5062645
 ;;^UTILITY(U,$J,358.3,26878,0)
 ;;=Z00.8^^132^1305^8
 ;;^UTILITY(U,$J,358.3,26878,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26878,1,3,0)
 ;;=3^General Exam NEC
 ;;^UTILITY(U,$J,358.3,26878,1,4,0)
 ;;=4^Z00.8
 ;;^UTILITY(U,$J,358.3,26878,2)
 ;;=^5062611
 ;;^UTILITY(U,$J,358.3,26879,0)
 ;;=Z02.1^^132^1305^14
 ;;^UTILITY(U,$J,358.3,26879,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,26879,1,3,0)
 ;;=3^Pre-Employment Exam
 ;;^UTILITY(U,$J,358.3,26879,1,4,0)
 ;;=4^Z02.1
 ;;^UTILITY(U,$J,358.3,26879,2)
 ;;=^5062634
 ;;^UTILITY(U,$J,358.3,26880,0)
 ;;=Z01.810^^132^1305^2
 ;;^UTILITY(U,$J,358.3,26880,1,0)
 ;;=^358.31IA^4^2
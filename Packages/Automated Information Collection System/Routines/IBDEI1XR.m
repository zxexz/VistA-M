IBDEI1XR ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,32406,2)
 ;;=^5063106
 ;;^UTILITY(U,$J,358.3,32407,0)
 ;;=Z56.81^^143^1525^9
 ;;^UTILITY(U,$J,358.3,32407,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32407,1,3,0)
 ;;=3^Sexual Harassment on the Job
 ;;^UTILITY(U,$J,358.3,32407,1,4,0)
 ;;=4^Z56.81
 ;;^UTILITY(U,$J,358.3,32407,2)
 ;;=^5063114
 ;;^UTILITY(U,$J,358.3,32408,0)
 ;;=Z56.9^^143^1525^8
 ;;^UTILITY(U,$J,358.3,32408,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32408,1,3,0)
 ;;=3^Problems Related to Employment NEC
 ;;^UTILITY(U,$J,358.3,32408,1,4,0)
 ;;=4^Z56.9
 ;;^UTILITY(U,$J,358.3,32408,2)
 ;;=^5063117
 ;;^UTILITY(U,$J,358.3,32409,0)
 ;;=Z56.82^^143^1525^6
 ;;^UTILITY(U,$J,358.3,32409,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32409,1,3,0)
 ;;=3^Problems Related to Current Military Deployment Status
 ;;^UTILITY(U,$J,358.3,32409,1,4,0)
 ;;=4^Z56.82
 ;;^UTILITY(U,$J,358.3,32409,2)
 ;;=^5063115
 ;;^UTILITY(U,$J,358.3,32410,0)
 ;;=Z56.0^^143^1525^13
 ;;^UTILITY(U,$J,358.3,32410,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32410,1,3,0)
 ;;=3^Unemployeement,Unspec
 ;;^UTILITY(U,$J,358.3,32410,1,4,0)
 ;;=4^Z56.0
 ;;^UTILITY(U,$J,358.3,32410,2)
 ;;=^5063107
 ;;^UTILITY(U,$J,358.3,32411,0)
 ;;=Z56.1^^143^1525^2
 ;;^UTILITY(U,$J,358.3,32411,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32411,1,3,0)
 ;;=3^Change of Job
 ;;^UTILITY(U,$J,358.3,32411,1,4,0)
 ;;=4^Z56.1
 ;;^UTILITY(U,$J,358.3,32411,2)
 ;;=^5063108
 ;;^UTILITY(U,$J,358.3,32412,0)
 ;;=Z56.2^^143^1525^11
 ;;^UTILITY(U,$J,358.3,32412,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32412,1,3,0)
 ;;=3^Threat of Job Loss
 ;;^UTILITY(U,$J,358.3,32412,1,4,0)
 ;;=4^Z56.2
 ;;^UTILITY(U,$J,358.3,32412,2)
 ;;=^5063109
 ;;^UTILITY(U,$J,358.3,32413,0)
 ;;=Z56.3^^143^1525^10
 ;;^UTILITY(U,$J,358.3,32413,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32413,1,3,0)
 ;;=3^Stressful Work Schedule
 ;;^UTILITY(U,$J,358.3,32413,1,4,0)
 ;;=4^Z56.3
 ;;^UTILITY(U,$J,358.3,32413,2)
 ;;=^5063110
 ;;^UTILITY(U,$J,358.3,32414,0)
 ;;=Z56.4^^143^1525^3
 ;;^UTILITY(U,$J,358.3,32414,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32414,1,3,0)
 ;;=3^Discord w/ Boss & Workmates
 ;;^UTILITY(U,$J,358.3,32414,1,4,0)
 ;;=4^Z56.4
 ;;^UTILITY(U,$J,358.3,32414,2)
 ;;=^5063111
 ;;^UTILITY(U,$J,358.3,32415,0)
 ;;=Z56.5^^143^1525^12
 ;;^UTILITY(U,$J,358.3,32415,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32415,1,3,0)
 ;;=3^Uncongenial Work Environment
 ;;^UTILITY(U,$J,358.3,32415,1,4,0)
 ;;=4^Z56.5
 ;;^UTILITY(U,$J,358.3,32415,2)
 ;;=^5063112
 ;;^UTILITY(U,$J,358.3,32416,0)
 ;;=Z56.6^^143^1525^5
 ;;^UTILITY(U,$J,358.3,32416,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32416,1,3,0)
 ;;=3^Physical & Mental Strain Related to Work NEC
 ;;^UTILITY(U,$J,358.3,32416,1,4,0)
 ;;=4^Z56.6
 ;;^UTILITY(U,$J,358.3,32416,2)
 ;;=^5063113
 ;;^UTILITY(U,$J,358.3,32417,0)
 ;;=Z56.82^^143^1525^4
 ;;^UTILITY(U,$J,358.3,32417,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32417,1,3,0)
 ;;=3^Military Deployment Status
 ;;^UTILITY(U,$J,358.3,32417,1,4,0)
 ;;=4^Z56.82
 ;;^UTILITY(U,$J,358.3,32417,2)
 ;;=^5063115
 ;;^UTILITY(U,$J,358.3,32418,0)
 ;;=Z56.89^^143^1525^7
 ;;^UTILITY(U,$J,358.3,32418,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32418,1,3,0)
 ;;=3^Problems Related to Employment,Other
 ;;^UTILITY(U,$J,358.3,32418,1,4,0)
 ;;=4^Z56.89
 ;;^UTILITY(U,$J,358.3,32418,2)
 ;;=^5063116
 ;;^UTILITY(U,$J,358.3,32419,0)
 ;;=F64.1^^143^1526^2
 ;;^UTILITY(U,$J,358.3,32419,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32419,1,3,0)
 ;;=3^Gender Dysphoria in Adolescents & Adults
 ;;^UTILITY(U,$J,358.3,32419,1,4,0)
 ;;=4^F64.1
 ;;^UTILITY(U,$J,358.3,32419,2)
 ;;=^5003647

IBDEI1GP ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,24431,1,3,0)
 ;;=3^Bronchitis, Acute
 ;;^UTILITY(U,$J,358.3,24431,1,4,0)
 ;;=4^J20.9
 ;;^UTILITY(U,$J,358.3,24431,2)
 ;;=^5008195
 ;;^UTILITY(U,$J,358.3,24432,0)
 ;;=B37.42^^121^1221^30
 ;;^UTILITY(U,$J,358.3,24432,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24432,1,3,0)
 ;;=3^Candidal Balanitis
 ;;^UTILITY(U,$J,358.3,24432,1,4,0)
 ;;=4^B37.42
 ;;^UTILITY(U,$J,358.3,24432,2)
 ;;=^5000617
 ;;^UTILITY(U,$J,358.3,24433,0)
 ;;=B37.3^^121^1221^37
 ;;^UTILITY(U,$J,358.3,24433,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24433,1,3,0)
 ;;=3^Candidiasis,Vulvovaginal
 ;;^UTILITY(U,$J,358.3,24433,1,4,0)
 ;;=4^B37.3
 ;;^UTILITY(U,$J,358.3,24433,2)
 ;;=^5000615
 ;;^UTILITY(U,$J,358.3,24434,0)
 ;;=B37.2^^121^1221^34
 ;;^UTILITY(U,$J,358.3,24434,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24434,1,3,0)
 ;;=3^Candidiasis,Intertriginal
 ;;^UTILITY(U,$J,358.3,24434,1,4,0)
 ;;=4^B37.2
 ;;^UTILITY(U,$J,358.3,24434,2)
 ;;=^5000614
 ;;^UTILITY(U,$J,358.3,24435,0)
 ;;=B37.81^^121^1221^33
 ;;^UTILITY(U,$J,358.3,24435,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24435,1,3,0)
 ;;=3^Candidiasis,Esophageal
 ;;^UTILITY(U,$J,358.3,24435,1,4,0)
 ;;=4^B37.81
 ;;^UTILITY(U,$J,358.3,24435,2)
 ;;=b377^5000620
 ;;^UTILITY(U,$J,358.3,24436,0)
 ;;=B37.7^^121^1221^31
 ;;^UTILITY(U,$J,358.3,24436,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24436,1,3,0)
 ;;=3^Candidal Sepsis
 ;;^UTILITY(U,$J,358.3,24436,1,4,0)
 ;;=4^B37.7
 ;;^UTILITY(U,$J,358.3,24436,2)
 ;;=^5000619
 ;;^UTILITY(U,$J,358.3,24437,0)
 ;;=B37.0^^121^1221^35
 ;;^UTILITY(U,$J,358.3,24437,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24437,1,3,0)
 ;;=3^Candidiasis,Oral
 ;;^UTILITY(U,$J,358.3,24437,1,4,0)
 ;;=4^B37.0
 ;;^UTILITY(U,$J,358.3,24437,2)
 ;;=^5000612
 ;;^UTILITY(U,$J,358.3,24438,0)
 ;;=B37.89^^121^1221^32
 ;;^UTILITY(U,$J,358.3,24438,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24438,1,3,0)
 ;;=3^Candidiasis NEC
 ;;^UTILITY(U,$J,358.3,24438,1,4,0)
 ;;=4^B37.89
 ;;^UTILITY(U,$J,358.3,24438,2)
 ;;=^5000623
 ;;^UTILITY(U,$J,358.3,24439,0)
 ;;=L03.90^^121^1221^38
 ;;^UTILITY(U,$J,358.3,24439,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24439,1,3,0)
 ;;=3^Cellulitis, unspecified
 ;;^UTILITY(U,$J,358.3,24439,1,4,0)
 ;;=4^L03.90
 ;;^UTILITY(U,$J,358.3,24439,2)
 ;;=^5009067
 ;;^UTILITY(U,$J,358.3,24440,0)
 ;;=N72.^^121^1221^39
 ;;^UTILITY(U,$J,358.3,24440,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24440,1,3,0)
 ;;=3^Cervicitis
 ;;^UTILITY(U,$J,358.3,24440,1,4,0)
 ;;=4^N72.
 ;;^UTILITY(U,$J,358.3,24440,2)
 ;;=^5015812
 ;;^UTILITY(U,$J,358.3,24441,0)
 ;;=N81.9^^121^1221^1
 ;;^UTILITY(U,$J,358.3,24441,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24441,1,3,0)
 ;;=3
 ;;^UTILITY(U,$J,358.3,24441,1,4,0)
 ;;=4^N81.9
 ;;^UTILITY(U,$J,358.3,24441,2)
 ;;=^5015845
 ;;^UTILITY(U,$J,358.3,24442,0)
 ;;=K81.0^^121^1221^14
 ;;^UTILITY(U,$J,358.3,24442,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24442,1,3,0)
 ;;=3^Acute cholecystitis
 ;;^UTILITY(U,$J,358.3,24442,1,4,0)
 ;;=4^K81.0
 ;;^UTILITY(U,$J,358.3,24442,2)
 ;;=^259097
 ;;^UTILITY(U,$J,358.3,24443,0)
 ;;=A04.7^^121^1221^41
 ;;^UTILITY(U,$J,358.3,24443,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24443,1,3,0)
 ;;=3^Clostridium difficile colitis
 ;;^UTILITY(U,$J,358.3,24443,1,4,0)
 ;;=4^A04.7
 ;;^UTILITY(U,$J,358.3,24443,2)
 ;;=^5000029
 ;;^UTILITY(U,$J,358.3,24444,0)
 ;;=B38.2^^121^1221^44
 ;;^UTILITY(U,$J,358.3,24444,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24444,1,3,0)
 ;;=3^Coccidioides,Pulmonary
 ;;^UTILITY(U,$J,358.3,24444,1,4,0)
 ;;=4^B38.2
 ;;^UTILITY(U,$J,358.3,24444,2)
 ;;=^295703
 ;;^UTILITY(U,$J,358.3,24445,0)
 ;;=B38.4^^121^1221^43
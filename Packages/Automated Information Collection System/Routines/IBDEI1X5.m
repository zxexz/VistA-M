IBDEI1X5 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,32132,0)
 ;;=F52.22^^141^1498^4
 ;;^UTILITY(U,$J,358.3,32132,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32132,1,3,0)
 ;;=3^Female Sexual Interest/Arousal Disorder
 ;;^UTILITY(U,$J,358.3,32132,1,4,0)
 ;;=4^F52.22
 ;;^UTILITY(U,$J,358.3,32132,2)
 ;;=^5003621
 ;;^UTILITY(U,$J,358.3,32133,0)
 ;;=F52.6^^141^1498^5
 ;;^UTILITY(U,$J,358.3,32133,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32133,1,3,0)
 ;;=3^Genito-Pelvic Pain/Penetration Disorder
 ;;^UTILITY(U,$J,358.3,32133,1,4,0)
 ;;=4^F52.6
 ;;^UTILITY(U,$J,358.3,32133,2)
 ;;=^5003623
 ;;^UTILITY(U,$J,358.3,32134,0)
 ;;=F52.0^^141^1498^6
 ;;^UTILITY(U,$J,358.3,32134,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32134,1,3,0)
 ;;=3^Male Hypoactive Sexual Desire Disorder
 ;;^UTILITY(U,$J,358.3,32134,1,4,0)
 ;;=4^F52.0
 ;;^UTILITY(U,$J,358.3,32134,2)
 ;;=^5003618
 ;;^UTILITY(U,$J,358.3,32135,0)
 ;;=F52.4^^141^1498^7
 ;;^UTILITY(U,$J,358.3,32135,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32135,1,3,0)
 ;;=3^Premature (Early) Ejaculation
 ;;^UTILITY(U,$J,358.3,32135,1,4,0)
 ;;=4^F52.4
 ;;^UTILITY(U,$J,358.3,32135,2)
 ;;=^331928
 ;;^UTILITY(U,$J,358.3,32136,0)
 ;;=F52.8^^141^1498^9
 ;;^UTILITY(U,$J,358.3,32136,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32136,1,3,0)
 ;;=3^Sexual Dysfuntion NEC
 ;;^UTILITY(U,$J,358.3,32136,1,4,0)
 ;;=4^F52.8
 ;;^UTILITY(U,$J,358.3,32136,2)
 ;;=^5003624
 ;;^UTILITY(U,$J,358.3,32137,0)
 ;;=F52.9^^141^1498^8
 ;;^UTILITY(U,$J,358.3,32137,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32137,1,3,0)
 ;;=3^Sexual Dysfunction,Unspec
 ;;^UTILITY(U,$J,358.3,32137,1,4,0)
 ;;=4^F52.9
 ;;^UTILITY(U,$J,358.3,32137,2)
 ;;=^5003625
 ;;^UTILITY(U,$J,358.3,32138,0)
 ;;=G47.09^^141^1499^11
 ;;^UTILITY(U,$J,358.3,32138,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32138,1,3,0)
 ;;=3^Insomnia Disorder NEC
 ;;^UTILITY(U,$J,358.3,32138,1,4,0)
 ;;=4^G47.09
 ;;^UTILITY(U,$J,358.3,32138,2)
 ;;=^5003970
 ;;^UTILITY(U,$J,358.3,32139,0)
 ;;=G47.00^^141^1499^10
 ;;^UTILITY(U,$J,358.3,32139,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32139,1,3,0)
 ;;=3^Insomnia Disorder
 ;;^UTILITY(U,$J,358.3,32139,1,4,0)
 ;;=4^G47.00
 ;;^UTILITY(U,$J,358.3,32139,2)
 ;;=^332924
 ;;^UTILITY(U,$J,358.3,32140,0)
 ;;=G47.10^^141^1499^9
 ;;^UTILITY(U,$J,358.3,32140,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32140,1,3,0)
 ;;=3^Hypersomnolence Disorder/Unspec Hypersomnolence Disorder
 ;;^UTILITY(U,$J,358.3,32140,1,4,0)
 ;;=4^G47.10
 ;;^UTILITY(U,$J,358.3,32140,2)
 ;;=^332926
 ;;^UTILITY(U,$J,358.3,32141,0)
 ;;=G47.419^^141^1499^12
 ;;^UTILITY(U,$J,358.3,32141,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32141,1,3,0)
 ;;=3^Narcolepsy
 ;;^UTILITY(U,$J,358.3,32141,1,4,0)
 ;;=4^G47.419
 ;;^UTILITY(U,$J,358.3,32141,2)
 ;;=^5003982
 ;;^UTILITY(U,$J,358.3,32142,0)
 ;;=G47.33^^141^1499^16
 ;;^UTILITY(U,$J,358.3,32142,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32142,1,3,0)
 ;;=3^Obstructive Sleep Apnea Hypopnea
 ;;^UTILITY(U,$J,358.3,32142,1,4,0)
 ;;=4^G47.33
 ;;^UTILITY(U,$J,358.3,32142,2)
 ;;=^332763
 ;;^UTILITY(U,$J,358.3,32143,0)
 ;;=G47.31^^141^1499^1
 ;;^UTILITY(U,$J,358.3,32143,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32143,1,3,0)
 ;;=3^Central Sleep Apnea
 ;;^UTILITY(U,$J,358.3,32143,1,4,0)
 ;;=4^G47.31
 ;;^UTILITY(U,$J,358.3,32143,2)
 ;;=^332761
 ;;^UTILITY(U,$J,358.3,32144,0)
 ;;=G47.21^^141^1499^3
 ;;^UTILITY(U,$J,358.3,32144,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32144,1,3,0)
 ;;=3^Circadian Rhythm Sleep-Wake Disorder;Delayed Sleep Phase Type
 ;;^UTILITY(U,$J,358.3,32144,1,4,0)
 ;;=4^G47.21
 ;;^UTILITY(U,$J,358.3,32144,2)
 ;;=^332769

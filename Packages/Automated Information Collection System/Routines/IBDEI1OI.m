IBDEI1OI ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,28091,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28091,1,3,0)
 ;;=3^Fasciculation/Twitching
 ;;^UTILITY(U,$J,358.3,28091,1,4,0)
 ;;=4^R25.3
 ;;^UTILITY(U,$J,358.3,28091,2)
 ;;=^44985
 ;;^UTILITY(U,$J,358.3,28092,0)
 ;;=R25.8^^132^1325^2
 ;;^UTILITY(U,$J,358.3,28092,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28092,1,3,0)
 ;;=3^Abnormal Involuntary Movements,Other
 ;;^UTILITY(U,$J,358.3,28092,1,4,0)
 ;;=4^R25.8
 ;;^UTILITY(U,$J,358.3,28092,2)
 ;;=^5019302
 ;;^UTILITY(U,$J,358.3,28093,0)
 ;;=M02.30^^132^1326^124
 ;;^UTILITY(U,$J,358.3,28093,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28093,1,3,0)
 ;;=3^Reiter's Disease,Unspec Site
 ;;^UTILITY(U,$J,358.3,28093,1,4,0)
 ;;=4^M02.30
 ;;^UTILITY(U,$J,358.3,28093,2)
 ;;=^5009790
 ;;^UTILITY(U,$J,358.3,28094,0)
 ;;=M10.9^^132^1326^40
 ;;^UTILITY(U,$J,358.3,28094,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28094,1,3,0)
 ;;=3^Gout,Unspec
 ;;^UTILITY(U,$J,358.3,28094,1,4,0)
 ;;=4^M10.9
 ;;^UTILITY(U,$J,358.3,28094,2)
 ;;=^5010404
 ;;^UTILITY(U,$J,358.3,28095,0)
 ;;=G90.59^^132^1326^34
 ;;^UTILITY(U,$J,358.3,28095,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28095,1,3,0)
 ;;=3^Complex Regional Pain Syndrome I,Unspec
 ;;^UTILITY(U,$J,358.3,28095,1,4,0)
 ;;=4^G90.59
 ;;^UTILITY(U,$J,358.3,28095,2)
 ;;=^5004171
 ;;^UTILITY(U,$J,358.3,28096,0)
 ;;=G56.01^^132^1326^12
 ;;^UTILITY(U,$J,358.3,28096,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28096,1,3,0)
 ;;=3^Carpal Tunnel Syndrome,Right Upper Limb
 ;;^UTILITY(U,$J,358.3,28096,1,4,0)
 ;;=4^G56.01
 ;;^UTILITY(U,$J,358.3,28096,2)
 ;;=^5004018
 ;;^UTILITY(U,$J,358.3,28097,0)
 ;;=G56.02^^132^1326^11
 ;;^UTILITY(U,$J,358.3,28097,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28097,1,3,0)
 ;;=3^Carpal Tunnel Syndrome,Left Upper Limb
 ;;^UTILITY(U,$J,358.3,28097,1,4,0)
 ;;=4^G56.02
 ;;^UTILITY(U,$J,358.3,28097,2)
 ;;=^5004019
 ;;^UTILITY(U,$J,358.3,28098,0)
 ;;=G56.21^^132^1326^56
 ;;^UTILITY(U,$J,358.3,28098,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28098,1,3,0)
 ;;=3^Lesion of Ulnar Nerve,Right Upper Limb
 ;;^UTILITY(U,$J,358.3,28098,1,4,0)
 ;;=4^G56.21
 ;;^UTILITY(U,$J,358.3,28098,2)
 ;;=^5004024
 ;;^UTILITY(U,$J,358.3,28099,0)
 ;;=G56.22^^132^1326^55
 ;;^UTILITY(U,$J,358.3,28099,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28099,1,3,0)
 ;;=3^Lesion of Ulnar Nerve,Left Upper Limb
 ;;^UTILITY(U,$J,358.3,28099,1,4,0)
 ;;=4^G56.22
 ;;^UTILITY(U,$J,358.3,28099,2)
 ;;=^5004025
 ;;^UTILITY(U,$J,358.3,28100,0)
 ;;=M26.60^^132^1326^163
 ;;^UTILITY(U,$J,358.3,28100,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28100,1,3,0)
 ;;=3^Temporomandibular Joint Disorder,Unspec
 ;;^UTILITY(U,$J,358.3,28100,1,4,0)
 ;;=4^M26.60
 ;;^UTILITY(U,$J,358.3,28100,2)
 ;;=^5011714
 ;;^UTILITY(U,$J,358.3,28101,0)
 ;;=L40.52^^132^1326^120
 ;;^UTILITY(U,$J,358.3,28101,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28101,1,3,0)
 ;;=3^Psoriatic Arthritis Mutilans
 ;;^UTILITY(U,$J,358.3,28101,1,4,0)
 ;;=4^L40.52
 ;;^UTILITY(U,$J,358.3,28101,2)
 ;;=^5009167
 ;;^UTILITY(U,$J,358.3,28102,0)
 ;;=L40.53^^132^1326^121
 ;;^UTILITY(U,$J,358.3,28102,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28102,1,3,0)
 ;;=3^Psoriatic Spondylitis
 ;;^UTILITY(U,$J,358.3,28102,1,4,0)
 ;;=4^L40.53
 ;;^UTILITY(U,$J,358.3,28102,2)
 ;;=^5009168
 ;;^UTILITY(U,$J,358.3,28103,0)
 ;;=M32.9^^132^1326^162
 ;;^UTILITY(U,$J,358.3,28103,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,28103,1,3,0)
 ;;=3^Systemic Lupus Erythematosus,Unspec
 ;;^UTILITY(U,$J,358.3,28103,1,4,0)
 ;;=4^M32.9
 ;;^UTILITY(U,$J,358.3,28103,2)
 ;;=^5011761
 ;;^UTILITY(U,$J,358.3,28104,0)
 ;;=M32.0^^132^1326^158
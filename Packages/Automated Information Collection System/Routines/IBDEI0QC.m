IBDEI0QC ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,12061,0)
 ;;=Z79.891^^68^696^8
 ;;^UTILITY(U,$J,358.3,12061,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,12061,1,3,0)
 ;;=3^Opiate Analgesic
 ;;^UTILITY(U,$J,358.3,12061,1,4,0)
 ;;=4^Z79.891
 ;;^UTILITY(U,$J,358.3,12061,2)
 ;;=^5063342
 ;;^UTILITY(U,$J,358.3,12062,0)
 ;;=Z79.51^^68^696^9
 ;;^UTILITY(U,$J,358.3,12062,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,12062,1,3,0)
 ;;=3^Steroids-Inhaled
 ;;^UTILITY(U,$J,358.3,12062,1,4,0)
 ;;=4^Z79.51
 ;;^UTILITY(U,$J,358.3,12062,2)
 ;;=^5063335
 ;;^UTILITY(U,$J,358.3,12063,0)
 ;;=Z79.52^^68^696^10
 ;;^UTILITY(U,$J,358.3,12063,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,12063,1,3,0)
 ;;=3^Steroids-Systemic
 ;;^UTILITY(U,$J,358.3,12063,1,4,0)
 ;;=4^Z79.52
 ;;^UTILITY(U,$J,358.3,12063,2)
 ;;=^5063336
 ;;^UTILITY(U,$J,358.3,12064,0)
 ;;=Z79.899^^68^696^6
 ;;^UTILITY(U,$J,358.3,12064,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,12064,1,3,0)
 ;;=3^Long Term Current Drug Therapy NEC
 ;;^UTILITY(U,$J,358.3,12064,1,4,0)
 ;;=4^Z79.899
 ;;^UTILITY(U,$J,358.3,12064,2)
 ;;=^5063343
 ;;^UTILITY(U,$J,358.3,12065,0)
 ;;=99211^^69^697^1
 ;;^UTILITY(U,$J,358.3,12065,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,12065,1,1,0)
 ;;=1^Nursing Visit Only (no MD seen)
 ;;^UTILITY(U,$J,358.3,12065,1,2,0)
 ;;=2^99211
 ;;^UTILITY(U,$J,358.3,12066,0)
 ;;=99212^^69^697^2
 ;;^UTILITY(U,$J,358.3,12066,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,12066,1,1,0)
 ;;=1^Problem Focused
 ;;^UTILITY(U,$J,358.3,12066,1,2,0)
 ;;=2^99212
 ;;^UTILITY(U,$J,358.3,12067,0)
 ;;=99213^^69^697^3
 ;;^UTILITY(U,$J,358.3,12067,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,12067,1,1,0)
 ;;=1^Expanded Problem Focus
 ;;^UTILITY(U,$J,358.3,12067,1,2,0)
 ;;=2^99213
 ;;^UTILITY(U,$J,358.3,12068,0)
 ;;=99214^^69^697^4
 ;;^UTILITY(U,$J,358.3,12068,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,12068,1,1,0)
 ;;=1^Detailed
 ;;^UTILITY(U,$J,358.3,12068,1,2,0)
 ;;=2^99214
 ;;^UTILITY(U,$J,358.3,12069,0)
 ;;=99455^^69^698^1
 ;;^UTILITY(U,$J,358.3,12069,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,12069,1,1,0)
 ;;=1^Work/Disability Exam-Previously Treated
 ;;^UTILITY(U,$J,358.3,12069,1,2,0)
 ;;=2^99455
 ;;^UTILITY(U,$J,358.3,12070,0)
 ;;=99456^^69^698^2
 ;;^UTILITY(U,$J,358.3,12070,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,12070,1,1,0)
 ;;=1^Work/Disability Exam-Not Prev Treated
 ;;^UTILITY(U,$J,358.3,12070,1,2,0)
 ;;=2^99456
 ;;^UTILITY(U,$J,358.3,12071,0)
 ;;=99201^^69^699^1
 ;;^UTILITY(U,$J,358.3,12071,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,12071,1,1,0)
 ;;=1^Problem Focused
 ;;^UTILITY(U,$J,358.3,12071,1,2,0)
 ;;=2^99201
 ;;^UTILITY(U,$J,358.3,12072,0)
 ;;=99202^^69^699^2
 ;;^UTILITY(U,$J,358.3,12072,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,12072,1,1,0)
 ;;=1^Exp Problem Focused
 ;;^UTILITY(U,$J,358.3,12072,1,2,0)
 ;;=2^99202
 ;;^UTILITY(U,$J,358.3,12073,0)
 ;;=99203^^69^699^3
 ;;^UTILITY(U,$J,358.3,12073,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,12073,1,1,0)
 ;;=1^Detailed
 ;;^UTILITY(U,$J,358.3,12073,1,2,0)
 ;;=2^99203
 ;;^UTILITY(U,$J,358.3,12074,0)
 ;;=99204^^69^699^4
 ;;^UTILITY(U,$J,358.3,12074,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,12074,1,1,0)
 ;;=1^Comp/Mod MDM
 ;;^UTILITY(U,$J,358.3,12074,1,2,0)
 ;;=2^99204
 ;;^UTILITY(U,$J,358.3,12075,0)
 ;;=99205^^69^699^5
 ;;^UTILITY(U,$J,358.3,12075,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,12075,1,1,0)
 ;;=1^Comp/High MDM
 ;;^UTILITY(U,$J,358.3,12075,1,2,0)
 ;;=2^99205
 ;;^UTILITY(U,$J,358.3,12076,0)
 ;;=90471^^70^700^1^^^^1
 ;;^UTILITY(U,$J,358.3,12076,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12076,1,2,0)
 ;;=2^90471
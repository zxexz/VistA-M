IBDEI1GW ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,24525,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24525,1,3,0)
 ;;=3^Osteomyelitis, acute - NOS
 ;;^UTILITY(U,$J,358.3,24525,1,4,0)
 ;;=4^M86.10
 ;;^UTILITY(U,$J,358.3,24525,2)
 ;;=^5014521
 ;;^UTILITY(U,$J,358.3,24526,0)
 ;;=M86.60^^121^1221^162
 ;;^UTILITY(U,$J,358.3,24526,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24526,1,3,0)
 ;;=3^Osteomyelitis, chronic - NOS
 ;;^UTILITY(U,$J,358.3,24526,1,4,0)
 ;;=4^M86.60
 ;;^UTILITY(U,$J,358.3,24526,2)
 ;;=^5014630
 ;;^UTILITY(U,$J,358.3,24527,0)
 ;;=H60.501^^121^1221^165
 ;;^UTILITY(U,$J,358.3,24527,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24527,1,3,0)
 ;;=3^Otitis, externa, right ear
 ;;^UTILITY(U,$J,358.3,24527,1,4,0)
 ;;=4^H60.501
 ;;^UTILITY(U,$J,358.3,24527,2)
 ;;=^5006467
 ;;^UTILITY(U,$J,358.3,24528,0)
 ;;=H60.502^^121^1221^164
 ;;^UTILITY(U,$J,358.3,24528,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24528,1,3,0)
 ;;=3^Otitis, externa, left ear
 ;;^UTILITY(U,$J,358.3,24528,1,4,0)
 ;;=4^H60.502
 ;;^UTILITY(U,$J,358.3,24528,2)
 ;;=^5006468
 ;;^UTILITY(U,$J,358.3,24529,0)
 ;;=H60.503^^121^1221^163
 ;;^UTILITY(U,$J,358.3,24529,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24529,1,3,0)
 ;;=3^Otitis, externa, bilateral
 ;;^UTILITY(U,$J,358.3,24529,1,4,0)
 ;;=4^H60.503
 ;;^UTILITY(U,$J,358.3,24529,2)
 ;;=^5006469
 ;;^UTILITY(U,$J,358.3,24530,0)
 ;;=H66.91^^121^1221^168
 ;;^UTILITY(U,$J,358.3,24530,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24530,1,3,0)
 ;;=3^Otitis, media, right ear
 ;;^UTILITY(U,$J,358.3,24530,1,4,0)
 ;;=4^H66.91
 ;;^UTILITY(U,$J,358.3,24530,2)
 ;;=^5006640
 ;;^UTILITY(U,$J,358.3,24531,0)
 ;;=H66.92^^121^1221^167
 ;;^UTILITY(U,$J,358.3,24531,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24531,1,3,0)
 ;;=3^Otitis, media, left ear
 ;;^UTILITY(U,$J,358.3,24531,1,4,0)
 ;;=4^H66.92
 ;;^UTILITY(U,$J,358.3,24531,2)
 ;;=^5006641
 ;;^UTILITY(U,$J,358.3,24532,0)
 ;;=H66.93^^121^1221^166
 ;;^UTILITY(U,$J,358.3,24532,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24532,1,3,0)
 ;;=3^Otitis, media, bilateral
 ;;^UTILITY(U,$J,358.3,24532,1,4,0)
 ;;=4^H66.93
 ;;^UTILITY(U,$J,358.3,24532,2)
 ;;=^5006642
 ;;^UTILITY(U,$J,358.3,24533,0)
 ;;=B89.^^121^1221^170
 ;;^UTILITY(U,$J,358.3,24533,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24533,1,3,0)
 ;;=3^Parasitosis
 ;;^UTILITY(U,$J,358.3,24533,1,4,0)
 ;;=4^B89.
 ;;^UTILITY(U,$J,358.3,24533,2)
 ;;=^5000822
 ;;^UTILITY(U,$J,358.3,24534,0)
 ;;=N73.9^^121^1221^171
 ;;^UTILITY(U,$J,358.3,24534,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24534,1,3,0)
 ;;=3^Pelvic Inflammatory Disease
 ;;^UTILITY(U,$J,358.3,24534,1,4,0)
 ;;=4^N73.9
 ;;^UTILITY(U,$J,358.3,24534,2)
 ;;=^5015820
 ;;^UTILITY(U,$J,358.3,24535,0)
 ;;=K65.2^^121^1221^173
 ;;^UTILITY(U,$J,358.3,24535,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24535,1,3,0)
 ;;=3^Peritonitis, bacterial
 ;;^UTILITY(U,$J,358.3,24535,1,4,0)
 ;;=4^K65.2
 ;;^UTILITY(U,$J,358.3,24535,2)
 ;;=^332801
 ;;^UTILITY(U,$J,358.3,24536,0)
 ;;=J02.9^^121^1221^176
 ;;^UTILITY(U,$J,358.3,24536,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24536,1,3,0)
 ;;=3^Pharyngitis
 ;;^UTILITY(U,$J,358.3,24536,1,4,0)
 ;;=4^J02.9
 ;;^UTILITY(U,$J,358.3,24536,2)
 ;;=^5008130
 ;;^UTILITY(U,$J,358.3,24537,0)
 ;;=J18.9^^121^1221^180
 ;;^UTILITY(U,$J,358.3,24537,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24537,1,3,0)
 ;;=3^Pneumonia, NOS
 ;;^UTILITY(U,$J,358.3,24537,1,4,0)
 ;;=4^J18.9
 ;;^UTILITY(U,$J,358.3,24537,2)
 ;;=^95632
 ;;^UTILITY(U,$J,358.3,24538,0)
 ;;=J13.^^121^1221^181
 ;;^UTILITY(U,$J,358.3,24538,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24538,1,3,0)
 ;;=3^Pneumonia, Streptococcus pneumoniae
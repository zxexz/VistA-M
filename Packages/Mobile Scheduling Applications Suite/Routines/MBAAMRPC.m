MBAAMRPC ;OIT-PD/VSL - APPOINTMENT RPC ;02/10/2016
 ;;1.0;Scheduling Calendar View;**1**;Aug 27, 2014;Build 85
 ;
 Q
MERGE(RV,RESULT) ; MBAA RPC: MBAA EWL NEW, MBAA PATIENT PENDING APPT, MBAA LIST CANCELLATION REASONS
 N NODE,COUNTER S NODE="RESULT",COUNTER=1
 F  S NODE=$Q(@NODE) Q:NODE=""  D
 . S RV(COUNTER)=NODE_"="_@NODE
 . S COUNTER=$G(COUNTER)+1
 Q

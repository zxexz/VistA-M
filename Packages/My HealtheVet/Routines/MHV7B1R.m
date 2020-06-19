MHV7B1R ;WAS/GPM - HL7 message builder RTB^K13 Medications Profile ; 10/13/05 7:52pm [12/24/07 5:39pm]
 ;;1.0;My HealtheVet;**40**;Aug 23, 2005;Build 26
 ;;Per VA Directive 6402, this routine should not be modified
 ;
 Q
 ;
RDF(MSGROOT,CNT,LEN,HL) ;  Build RDF segment for Rx Profile data
 ;
 ;  Input:
 ;   MSGROOT - Root of array holding the message
 ;       CNT - Current message line counter
 ;       LEN - Current message length
 ;        HL - HL7 package array variable
 ;
 ;  Output:
 ;           - Populated message array
 ;           - Updated LEN and CNT
 ;
 N RDF
 S RDF(0)="RDF"
 S RDF(1)=52
 S RDF(2,1,1)="Prescription Number",RDF(2,1,2)="ST",RDF(2,1,3)=30
 S RDF(2,2,1)="IEN",RDF(2,2,2)="NM",RDF(2,2,3)=30
 S RDF(2,3,1)="Drug Name",RDF(2,3,2)="ST",RDF(2,3,3)=50
 S RDF(2,4,1)="Issue Date/Time",RDF(2,4,2)="TS",RDF(2,4,3)=26
 S RDF(2,5,1)="Last Fill Date",RDF(2,5,2)="TS",RDF(2,5,3)=26
 S RDF(2,6,1)="Release Date/Time",RDF(2,6,2)="TS",RDF(2,6,3)=26
 S RDF(2,7,1)="Expiration",RDF(2,7,2)="TS",RDF(2,7,3)=26
 S RDF(2,8,1)="Status",RDF(2,8,2)="ST",RDF(2,8,3)=25
 S RDF(2,9,1)="Quantity",RDF(2,9,2)="NM",RDF(2,9,3)=11
 S RDF(2,10,1)="Days Supply",RDF(2,10,2)="NM",RDF(2,10,3)=5
 S RDF(2,11,1)="Refills Remaining",RDF(2,11,2)="NM",RDF(2,11,3)=5
 S RDF(2,12,1)="Provider",RDF(2,12,2)="XCN",RDF(2,12,3)=150
 S RDF(2,13,1)="Placer Order Number",RDF(2,13,2)="ST",RDF(2,13,3)=30
 S RDF(2,14,1)="Mail/Window",RDF(2,14,2)="ST",RDF(2,14,3)=10
 S RDF(2,15,1)="Division",RDF(2,15,2)="NM",RDF(2,15,3)=50
 S RDF(2,16,1)="Division Name",RDF(2,16,2)="ST",RDF(2,16,3)=50
 S RDF(2,17,1)="MHV Request Status",RDF(2,17,2)="NM",RDF(2,17,3)=5
 S RDF(2,18,1)="MHV Request Status Date",RDF(2,18,2)="TS",RDF(2,18,3)=26
 S RDF(2,19,1)="Remarks",RDF(2,19,2)="ST",RDF(2,19,3)=1024
 S RDF(2,20,1)="Source",RDF(2,20,2)="ST",RDF(2,20,3)=2
 S RDF(2,21,1)="NDC",RDF(2,21,2)="ST",RDF(2,21,3)=15
 S RDF(2,22,1)="Dispensed Date",RDF(2,22,2)="TS",RDF(2,22,3)=26
 S RDF(2,23,1)="Trade Name",RDF(2,23,2)="ST",RDF(2,23,3)=30
 S RDF(2,24,1)="Reason",RDF(2,24,2)="ST",RDF(2,24,3)=100
 S RDF(2,25,1)="Reason Comment",RDF(2,25,2)="st",RDF(2,25,3)=1024
 S RDF(2,26,1)="Cancel Date",RDF(2,26,2)="TS",RDF(2,26,3)=26
 S RDF(2,27,1)="Facility Site Number",RDF(2,27,2)="ST",RDF(2,27,3)=50
 S RDF(2,28,1)="Facility Name",RDF(2,28,2)="ST",RDF(2,28,3)=50
 S RDF(2,29,1)="Facility Address Line 1",RDF(2,29,2)="ST",RDF(2,29,3)=100
 S RDF(2,30,1)="Facility City",RDF(2,30,2)="ST",RDF(2,30,3)=60
 S RDF(2,31,1)="Facility State",RDF(2,31,2)="ST",RDF(2,31,3)=10
 S RDF(2,32,1)="Facility Zip",RDF(2,32,2)="ST",RDF(2,32,3)=10
 S RDF(2,33,1)="Facility Phone Number",RDF(2,33,2)="NM",RDF(2,33,3)=10
 S RDF(2,34,1)="Next Possible Fill Date",RDF(2,34,2)="TS",RDF(2,34,3)=26
 S RDF(2,35,1)="Drug Schedule",RDF(2,35,2)="ST",RDF(2,35,3)=50
 S RDF(2,36,1)="VAMC Tracking Number",RDF(2,36,2)="ST",RDF(2,36,3)=25
 S RDF(2,37,1)="CMOP Tracking Number",RDF(2,37,2)="ST",RDF(2,37,3)=25
 S RDF(2,38,1)="CMOP Date Shipped",RDF(2,38,2)="TS",RDF(2,38,3)=26
 S RDF(2,39,1)="CMOP Carrier",RDF(2,39,2)="ST",RDF(2,39,3)=50
 S RDF(2,40,1)="Carrier Tracking Number",RDF(2,40,2)="ST",RDF(2,40,3)=25
 S RDF(2,41,1)="Number of RX in Package",RDF(2,41,2)="NM",RDF(2,41,3)=5
 S RDF(2,42,1)="CMOP System",RDF(2,42,2)="ST",RDF(2,42,3)=50
 S RDF(2,43,1)="CMOP Status",RDF(2,43,2)="ST",RDF(2,43,3)=50
 S RDF(2,44,1)="CMOP RX Indicator",RDF(2,44,2)="ST",RDF(2,44,3)=5
 S RDF(2,45,1)="CMOP NDC Received",RDF(2,45,2)="ST",RDF(2,45,3)=15
 S RDF(2,46,1)="CMOP NDC Sent",RDF(2,46,2)="ST",RDF(2,46,3)=15
 S RDF(2,47,1)="Orderable Item",RDF(2,47,2)="ST",RDF(2,47,3)=30
 S RDF(2,48,1)="Administered At Clinic",RDF(2,48,2)="NM",RDF(2,48,3)=10
 S RDF(2,49,1)="Clinic/Hospital Location",RDF(2,49,2)="TX",RDF(2,49,3)=100
 S RDF(2,50,1)="SIG",RDF(2,50,2)="TX",RDF(2,50,3)=1024
 S RDF(2,51,1)="UNIQUE INDEX",RDF(2,51,2)="TX",RDF(2,51,3)=10
 S RDF(2,52,1)="DISCLAIMER",RDF(2,52,2)="TX",RDF(2,52,3)=1024
 ;
 S CNT=CNT+1
 S @MSGROOT@(CNT)=$$BLDSEG^MHV7U(.RDF,.HL)
 S LEN=LEN+$L(@MSGROOT@(CNT))
 Q
 ;
RDT(MSGROOT,DATAROOT,CNT,LEN,HL) ;  Build RDT segments for Rx Profile data
 ;
 ; Walks data in DATAROOT to populate MSGROOT with RDT segments
 ; sequentially numbered starting at CNT
 ;
 ;  Integration Agreements:
 ;        10103 : FMTHL7^XLFDT
 ;         3065 : HLNAME^XLFNAME
 ;
 ;  Input:
 ;   MSGROOT - Root of array holding the message
 ;  DATAROOT - Root of array to hold extract data
 ;       CNT - Current message line counter
 ;       LEN - Current message length
 ;        HL - HL7 package array variable
 ;
 ;  Output:
 ;           - Populated message array
 ;           - Updated LEN and CNT
 ;
 N I,CMP,DIV,RX,CMOP,RXP,RXN,RXN1,RXN2,RXN3,RXN4,RXD,RDT,SIG,SEG,PIEN,NAME,WPLEN,PHRM,RTXT,STXT,TXT,DTXT,REM,DISC
 D LOG^MHVUL2("MHV7B1R","BEGIN RDT","S","TRACE")
 F I=1:1 Q:'$D(@DATAROOT@(I))  D
 . K RDT
 . S (RTXT,STXT,TXT)=""
 . S CMOP=$G(@DATAROOT@(I,"CMOP"))
 . S RX=$G(@DATAROOT@(I))
 . S RXN=$G(@DATAROOT@(I,"RXN"))
 . S RXN1=$G(@DATAROOT@(I,"RXN1"))
 . S RXN2=$G(@DATAROOT@(I,"RXN2"))
 . S RXN3=$G(@DATAROOT@(I,"RXN3"))
 . S RXN4=$G(@DATAROOT@(I,"RXN4"))
 . S PHRM=$G(@DATAROOT@(I,"PHRM"))
 . S RXP=$G(@DATAROOT@(I,"P"))
 . S PIEN=+RXP
 . S RXD=$G(@DATAROOT@(I,"DIV"))
 . ;K SIG I $D(@DATAROOT@(I,"SIG")) M SIG=@DATAROOT@(I,"SIG")
 . S RDT(0)="RDT"
 . S RDT(1)=$P(RX,"^")                         ;Rx Number
 . S RDT(2)=$P(RXN,"^")                        ;Rx IEN
 . S RDT(3)=$$ESCAPE^MHV7U($P(RXN,"^",2),.HL)  ;Drug Name
 . S RDT(4)=$$FMTHL7^XLFDT($P(RXN,"^",3))      ;Issue Date/Time
 . S RDT(5)=$$FMTHL7^XLFDT($P(RXN,"^",4))      ;Last Fill Date
 . S RDT(6)=$$FMTHL7^XLFDT($P(RXN,"^",5))      ;Release Date/Time
 . S RDT(7)=$$FMTHL7^XLFDT($P(RXN,"^",6))      ;Expiration
 . S RDT(8)=$$ESCAPE^MHV7U($P(RXN1,"^",1),.HL)  ;Status
 . S RDT(9)=$P(RXN1,"^",2)                      ;Quantity
 . S RDT(10)=$P(RXN1,"^",3)                     ;Days Supply
 . S RDT(11)=$P(RXN1,"^",4)                     ;Number of Refills
 . I PIEN D
 .. D FMTNAME2^MHV7BU(PIEN,200,.NAME,.HL,"XCN") ;Provider IEN
 .. M RDT(12,1)=NAME
 .. S RDT(12,1,1)=PIEN
 . S RDT(13)=$$ESCAPE^MHV7U($P(RXN1,"^",5),.HL)   ;Placer Order Number
 . S RDT(14)=$P(RXN1,"^",6)                       ;Mail/Window
 . S RDT(15)=$P(RXD,"^")                          ;Division
 . S RDT(16)=$$ESCAPE^MHV7U($P(RXD,"^",2),.HL)    ;Division Name
 . S RDT(17)=$P(RX,"^",3)                         ;MHV status
 . S RDT(18)=$$FMTHL7^XLFDT($P(RX,"^",4))         ;MHV status date
 . S RTXT=$$RMK("RMK")
 . S TXT=$$ESCAPE($E(RTXT,1,1024),.HL)            ;Remarks
 . S RDT(19)=$$SPACES(TXT)
 . S RDT(20)=$P(RXN2,"^",1)                       ;Source
 . S RDT(21)=$P(RXN2,"^",2)                       ;NDC
 . S RDT(22)=$$FMTHL7^XLFDT($P(RXN2,"^",3))       ;Dispense Date
 . S RDT(23)=$P(RXN,"^",8)                        ;Trade Name
 . S RDT(24)=$P(RXN2,"^",4)                       ;Reason for Auto DC'ed: Rx Discontinued by EHRM Data Migration. -  Activity log.
 . S RDT(25)=$P(RXN2,"^",5)                       ;Auto DC'ed: Rx Discontinued by EHRM Data Migration.
 . S RDT(26)=$$FMTHL7^XLFDT($P(RXN2,"^",6))       ;Cancel Date
 . S RDT(27)=$P(PHRM,"^",8)    ;Site Number
 . S RDT(28)=$P(PHRM,"^",2)    ;Facility Name
 . S RDT(29)=$P(PHRM,"^",3)    ;Facility Address Line1
 . S RDT(30)=$P(PHRM,"^",5)    ;Facility City
 . S RDT(31)=$P(PHRM,"^",7)    ;Facility State
 . S RDT(32)=$P(PHRM,"^",6)    ;Facility Zip
 . S RDT(33)=$P(PHRM,"^",4)    ;Facility Phone
 . S RDT(34)=$$FMTHL7^XLFDT($P(RXN3,"^",2))    ;Refilliable Date
 . S RDT(35)=$P(RXN3,"^",3)    ;Drug Schedule 
 . S RDT(36)=$P(RXN3,"^",4)    ;Other Tracking Number pulled from activity log
 . S RDT(37)=$P(CMOP,"^",11)   ;CMOP Tracking Number
 . S RDT(38)=$$FMTHL7^XLFDT($P(CMOP,"^",9))    ;CMOP Date Shipped
 . S RDT(39)=$P(CMOP,"^",10)   ;CMOP Carrier
 . S RDT(40)=""   ;Carrier Tracking Number <FUTURE USE>
 . S RDT(41)=""   ;Number of RX in Package <FUTURE USE>
 . S RDT(42)=""   ;CMOP System <FUTURE USE>
 . S RDT(43)=$P(CMOP,"^",3)    ;CMOP Status
 . S RDT(44)=$P(CMOP,"^",2)    ;CMOP Rx Indicator
 . S RDT(45)=$P(CMOP,"^",4)    ;CMOP NDC Received
 . S RDT(46)=$P(CMOP,"^",12)   ;CMOP NDC Sent
 . S RDT(47)=$P(RXN3,"^",5)    ;Orderable Item
 . S RDT(48)=$P(RXN3,"^",6)    ;Administered at Clinic
 . s RDT(49)=$P(RXN3,"^",1)    ;Clinic
 . S STXT=$$RMK("SIG")
 . S TXT=$$ESCAPE($E(RTXT,1,1024),.HL)
 . S RDT(50)=$$SPACES(STXT)    ;Sig
 . S RDT(51)=$P(RXN1,"^",7)    ;UNIQUE INDEX FOR RF AND PF
 . S RDT(52)=""
 . I RDT(20)="NV" D
 . .S DISC=$$RMK("DSC")        ;DISCLAIMER FOR NONVA
 . .S REM=$$RMK("RMK")
 . .S DTXT=$P(DISC,REM,1)
 . .S TXT=$$ESCAPE($E(DTXT,1,1024),.HL)
 . .S RDT(52)=$$SPACES(TXT)
 . S CNT=CNT+1
 . S @MSGROOT@(CNT)=$$BLDSEG^MHV7U(.RDT,.HL)
 . S LEN=LEN+$L(@MSGROOT@(CNT))
 . Q
 D LOG^MHVUL2("MHV7B1R","END RDT","S","TRACE")
 Q
 ;
RMK(TYP) ; build Remark field
 N X,Y
 S X="",Y=0
 F  S Y=$O(@DATAROOT@(I,TYP,Y)) Q:'Y  D
 .Q:$G(@DATAROOT@(I,TYP,Y,0))=""
 .S:X]"" X=X_" "
 .S X=X_@DATAROOT@(I,TYP,Y,0)
 Q X
 ;
SPACES(WPN) ; Remove extra spaces from line of text
 N OUT,IX,SP
 S OUT=WPN
 S SP=" "
 F IX=$L(OUT):-1:1 I ($E(OUT,IX,IX+1)=(SP_SP)) S $E(OUT,IX)=""
 Q OUT
 ;
ESCAPE(VAL,HL) ;Escape any special characters
 ;
 ;  Input:
 ;    VAL - value to escape
 ;     HL - HL7 environment array
 ;
 ;  Output:
 ;    VAL - passed by reference
 ;
 N FS      ;field separator
 N CS      ;component separator
 N RS      ;repetition separator
 N ES      ;escape character
 N SS      ;sub-component separator
 N L,STR,I
 ;
 S FS=HL("FS")
 S CS=$E(HL("ECH"))
 S RS=$E(HL("ECH"),2)
 S ES=$E(HL("ECH"),3)
 S SS=$E(HL("ECH"),4)
 ;
 I VAL[ES D
 . S L=$L(VAL,ES),STR=""
 . F I=1:1:L S $P(STR," ",I)=$P(VAL,ES,I)
 . S VAL=STR
 I VAL[FS D
 . S L=$L(VAL,FS),STR=""
 . F I=1:1:L S $P(STR," ",I)=$P(VAL,FS,I)
 . S VAL=STR
 I VAL[RS D
 . S L=$L(VAL,RS),STR=""
 . F I=1:1:L S $P(STR," ",I)=$P(VAL,RS,I)
 . S VAL=STR
 I VAL[CS D
 . S L=$L(VAL,CS),STR=""
 . F I=1:1:L S $P(STR," ",I)=$P(VAL,CS,I)
 . S VAL=STR
 I VAL[SS D
 . S L=$L(VAL,SS),STR=""
 . F I=1:1:L S $P(STR," ",I)=$P(VAL,SS,I)
 . S VAL=STR
 Q VAL

XU8P328B ;SFISC/SO- ADD NPCD FIPS CODES;7:17 AM  12 Feb 2004
 ;;8.0;KERNEL;**328**;Jul 10, 1995
BEG ;
 N TAG,DATA
 D MES^XPDUTL("Begin Additions to COUNTY CODE(#5.13) file...")
 F TAG=1:1:99 Q:TAG=99  I $T(@TAG)]"" D
 . S DATA=$P($T(@TAG),";;",2)
 . D
 .. N FDA,DIERR,Z,ZERR
 .. D FIND^DIC(5.13,"","","P",$P(DATA,","),"","","","","Z","ZERR")
 .. I +$G(Z("DILIST",0))<2 Q
 .. F I=1:1:+Z("DILIST",0) D
 ... I I=1 Q
 ... S FDA(5.13,+Z("DILIST",I,0)_",",.01)="@"
 ... D FILE^DIE("","FDA","ZERR")
 . D
 .. N FDA,DIERR,ZERR
 .. S FDA(5.13,"?+1,",.01)=$P(DATA,",")
 .. S FDA(5.13,"?+1,",1)=$P(DATA,",",3)
 .. S FDA(5.13,"?+1,",2)=$$FIND1^DIC(5,"","X",$P(DATA,",",5),"C","","ZERR")
 .. D UPDATE^DIE("","FDA","","ZERR")
 .. Q
 K ^XIP(5.13,"AC") ;CLEAN TRANSMISSION FLAG
 D MES^XPDUTL("Finished Additions to COUNTY CODE(#5.13) file.")
 Q
 ;
1 ;;12025,025,DADE,12,FL,FLORIDA,ACTIVE,
2 ;;15005,005,KALAWAO,15,HI,HAWAII,ACTIVE,
3 ;;30113,113,YELLOWSTONE NATIONAL PARK,30,MT,MONTANA,ACTIVE,
4 ;;51515,515,BEDFORD (CITY),51,VA,VIRGINIA,ACTIVE,
5 ;;51595,595,EMPORIA (CITY),51,VA,VIRGINIA,ACTIVE,
6 ;;60010,010,EASTERN (DISTRICT),60,AS,AMERICA SAMOA,ACTIVE,
7 ;;60020,020,MANU'A (DISTRICT),60,AS,AMERICA SAMOA,ACTIVE,
8 ;;60030,030,ROSE ISLAND,60,AS,AMERICA SAMOA,ACTIVE,
9 ;;60040,040,SWAINS ISLAND,60,AS,AMERICA SAMOA,ACTIVE,
10 ;;64002,002,CHUUK,64,FM,FEDERATED STATES OF MICRONESIA (FM),ACTIVE,
11 ;;64005,005,KOSRAE,64,FM,FEDERATED STATES OF MICRONESIA (FM),ACTIVE,
12 ;;64040,040,POHNPEI,64,FM,FEDERATED STATES OF MICRONESIA (FM),ACTIVE,
13 ;;64060,060,YAP,64,FM,FEDERATED STATES OF MICRONESIA (FM),ACTIVE,
14 ;;68007,007,AILINGINAE,68,MH,MARSHALL ISLANDS,ACTIVE,
15 ;;68010,010,AILINGLAPLAP,68,MH,MARSHALL ISLANDS,ACTIVE,
16 ;;68030,030,AILUK,68,MH,MARSHALL ISLANDS,ACTIVE,
17 ;;68040,040,ARNO,68,MH,MARSHALL ISLANDS,ACTIVE,
18 ;;68050,050,AUR,68,MH,MARSHALL ISLANDS,ACTIVE,
19 ;;68060,060,BIKAR,68,MH,MARSHALL ISLANDS,ACTIVE,
20 ;;68070,070,BIKINI,68,MH,MARSHALL ISLANDS,ACTIVE,
21 ;;68073,073,BOKAK,68,MH,MARSHALL ISLANDS,ACTIVE,
22 ;;68080,080,EBON,68,MH,MARSHALL ISLANDS,ACTIVE,
23 ;;68090,090,ENEWETAK,68,MH,MARSHALL ISLANDS,ACTIVE,
24 ;;68100,100,ERIKUB,68,MH,MARSHALL ISLANDS,ACTIVE,
25 ;;68110,110,JABAT,68,MH,MARSHALL ISLANDS,ACTIVE,
26 ;;68120,120,JALUIT,68,MH,MARSHALL ISLANDS,ACTIVE,
27 ;;68130,130,JEMO,68,MH,MARSHALL ISLANDS,ACTIVE,
28 ;;68140,140,KILI,68,MH,MARSHALL ISLANDS,ACTIVE,
29 ;;68150,150,KWAJALEIN,68,MH,MARSHALL ISLANDS,ACTIVE,
30 ;;68160,160,LAE,68,MH,MARSHALL ISLANDS,ACTIVE,
31 ;;68170,170,LIB,68,MH,MARSHALL ISLANDS,ACTIVE,
32 ;;68180,180,LIKIEP,68,MH,MARSHALL ISLANDS,ACTIVE,
33 ;;68190,190,MAJURO,68,MH,MARSHALL ISLANDS,ACTIVE,
34 ;;68300,300,MALOELAP,68,MH,MARSHALL ISLANDS,ACTIVE,
35 ;;68310,310,MEJIT,68,MH,MARSHALL ISLANDS,ACTIVE,
36 ;;68320,320,MILI,68,MH,MARSHALL ISLANDS,ACTIVE,
37 ;;68330,330,NAMORIK,68,MH,MARSHALL ISLANDS,ACTIVE,
38 ;;68340,340,NAMU,68,MH,MARSHALL ISLANDS,ACTIVE,
39 ;;68350,350,RONGELAP,68,MH,MARSHALL ISLANDS,ACTIVE,
40 ;;68360,360,RONGRIK,68,MH,MARSHALL ISLANDS,ACTIVE,
41 ;;68385,385,TOKE,68,MH,MARSHALL ISLANDS,ACTIVE,
42 ;;68390,390,UJAE,68,MH,MARSHALL ISLANDS,ACTIVE,
43 ;;68400,400,UJELANG,68,MH,MARSHALL ISLANDS,ACTIVE,
44 ;;68410,410,UTRIK,68,MH,MARSHALL ISLANDS,ACTIVE,
45 ;;68420,420,WOTHO,68,MH,MARSHALL ISLANDS,ACTIVE,
46 ;;68430,430,WOTJE,68,MH,MARSHALL ISLANDS,ACTIVE,
47 ;;69085,085,NORTHERN ISLANDS,69,MP,NORTHERN MARIANA ISLANDS,ACTIVE,
48 ;;69100,100,ROTA,69,MP,NORTHERN MARIANA ISLANDS,ACTIVE,
49 ;;69110,110,SAIPAN,69,MP,NORTHERN MARIANA ISLANDS,ACTIVE,
50 ;;69120,120,TINIAN,69,MP,NORTHERN MARIANA ISLANDS,ACTIVE,
51 ;;70002,002,AIMELIIK,70,PW,PALAU,ACTIVE,
52 ;;70004,004,AIRAI,70,PW,PALAU,ACTIVE,
53 ;;70010,010,ANGAUR,70,PW,PALAU,ACTIVE,
54 ;;70050,050,HATOBOHEI,70,PW,PALAU,ACTIVE,
55 ;;70100,100,KAYANGEL,70,PW,PALAU,ACTIVE,
56 ;;70150,150,KOROR,70,PW,PALAU,ACTIVE,
57 ;;70212,212,MELEKEOK,70,PW,PALAU,ACTIVE,
58 ;;70214,214,NGARAARD,70,PW,PALAU,ACTIVE,
59 ;;70218,218,NGARCHELONG,70,PW,PALAU,ACTIVE,
60 ;;70222,222,NGARDMAU,70,PW,PALAU,ACTIVE,
61 ;;70224,224,NGATPANG,70,PW,PALAU,ACTIVE,
62 ;;70226,226,NGCHESAR,70,PW,PALAU,ACTIVE,
63 ;;70227,227,NGEREMLENGUI,70,PW,PALAU,ACTIVE,
64 ;;70228,228,NGIWAL,70,PW,PALAU,ACTIVE,
65 ;;70350,350,PELELIU,70,PW,PALAU,ACTIVE,
66 ;;70370,370,SONSOROL,70,PW,PALAU,ACTIVE,
67 ;;74050,050,BAKER ISLAND,74,UM,U.S. MINOR OUTLYING ISLANDS,ACTIVE,
68 ;;74100,100,HOWLAND ISLAND,74,UM,U.S. MINOR OUTLYING ISLANDS,ACTIVE,
69 ;;74150,150,JARVIS ISLAND,74,UM,U.S. MINOR OUTLYING ISLANDS,ACTIVE,
70 ;;74200,200,JOHNSTON ISLAND,74,UM,U.S. MINOR OUTLYING ISLANDS,ACTIVE,
71 ;;74250,250,KINGMAN REEF,74,UM,U.S. MINOR OUTLYING ISLANDS,ACTIVE,
72 ;;74300,300,MIDWAY ISLANDS,74,UM,U.S. MINOR OUTLYING ISLANDS,ACTIVE,
73 ;;74350,350,NAVASSA ISLAND,74,UM,U.S. MINOR OUTLYING ISLANDS,ACTIVE,
74 ;;74400,400,PALMYRA ATOLL,74,UM,U.S. MINOR OUTLYING ISLANDS,ACTIVE,
75 ;;74450,450,WAKE ISLAND,74,UM,U.S. MINOR OUTLYING ISLANDS,ACTIVE,
99 ;;END

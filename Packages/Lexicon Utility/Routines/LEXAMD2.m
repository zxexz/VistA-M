LEXAMD2 ;ISL/KER - Look-up Check Modifiers ;04/21/2014
 ;;2.0;LEXICON UTILITY;**6,80**;Sep 23, 1996;Build 1
 Q
CHKMOD ; Check Modifiers
 S LEXE=+($G(LEXE)) Q:'$D(^LEX(757.01,LEXE,0))
 N LEXC,LEXMDOK,LEXM,LEXI S (LEXI,LEXC)=0
 F  S LEXC=$O(^LEX(757.01,"APAR",LEXE,LEXC)) Q:+LEXC=0  D
 . S LEXMDOK=1 D CHKTKNS(LEXC) Q:'LEXMDOK
 . S LEXI=LEXI+1,LEXM(0)=LEXI,LEXM(LEXI)=LEXC
 I +($G(LEXM(0)))=1 D
 . Q:+($G(LEXM(1)))=0  Q:'$L($G(^LEX(757.01,+($G(LEXM(1))),0)))
 . S LEXE=+($G(LEXM(1))),LEXOK=1
 Q
CHKTKNS(LEXE) ; Check tolkens
 N LEXM S LEXM=+($G(^LEX(757.01,LEXE,1))) Q:LEXM=0
 N LEXI,LEXOE,LEXC,LEXD S LEXOE=LEXE,LEXI=1
 F  S LEXI=$O(LEXTKN(LEXI)) Q:+LEXI=0!('LEXMDOK)  D  Q:'LEXMDOK
 . N LEXT,LEXE S LEXT=LEXTKN(LEXI),LEXE=0,LEXMDOK=0
 . S LEXC=$$UP(^LEX(757.01,LEXOE,0))
 . S LEXD=$$UP(^LEX(757.01,LEXOE,2))
 . I LEXD[LEXT S LEXMDOK=1 Q
 . I LEXC[LEXT S LEXMDOK=1 Q
 . I $L(LEXT),$D(^LEX(757.01,LEXOE,5,"B",LEXT)) S LEXMDOK=1 Q
 . I $L(LEXT),$E($O(^LEX(757.01,LEXOE,5,"B",($E(LEXT,1,($L(LEXT)-1))_$C($A($E(LEXT,$L(LEXT)))-1)_"~"))),1,$L(LEXT))=LEXT S LEXMDOK=1 Q
 Q
UP(X) Q $TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
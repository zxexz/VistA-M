DGNOTE ;ALB/MRL - GENERATE RELEASE NOTES ;26 JUL 88@1318
 ;;5.3;Registration;;Aug 13, 1993
 ;Called by [DGNOTE] output template
NR S DGN="NR" D W Q
DR S DGN="DR" D W Q
M S DGN="M" D W Q
NO S DGN="NO" D W1 Q
CO S DGN="CO" D W1 Q
MG S DGN="MG" D W1 Q
NK S DGN="NK" D W1 Q
 ;
W W ?5 F DGI=0:0 S DGI=$O(^DG(48,DGVREL,DGN,DGI)) Q:'DGI  S DGD=$P(^DG(48,DGVREL,DGN,DGI,0),"^",1)_", " W:($X+($L(DGD)))>78 !?5 W DGD
 K DGI,DGD,DGN Q
 ;
W1 W !?4 F DGI=1:1:$L($P(^DG(48,D0,DGN,D1,0),"^",1)) W "-"
 K DGI,DGN Q
 ;
PRINT S DGVREL=$$REL^DGVPP() I 'DGVREL W !!,*7,"UNABLE TO GENERATE RELEASE NOTES!!" Q
 W !!,"GENERATING FOR VERSION ",DGVREL
 S DIC="^DG(48,",DHD="MAS VERSION "_$S(DGVREL[".":DGVREL,1:DGVREL_".0")_" RELEASE NOTES",FLDS="[DGNOTE]",BY=".01,",(TO,FR)=DGVREL_",",L=0 D EN1^DIP
 K BY,TO,FR,FLDS,DGVREL Q
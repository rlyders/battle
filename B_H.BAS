DIM L(320),P1(38),P2(38),B1(4),B2(4),V(2),C(2),PL(2),PR(2),A(2),P(2),X(2)
DIM Y(2),SCORE(11),SHOTX(2,10),LOAN(2,5,4),CLOAN(2),SQ(2),TECHNIQUE(4,5)
DIM CTECHNIQUE(2),W(2),RESOURCE(4),SCOST(2)
COMMON A(),B1(),B2(),C(),CLOAN(),CPLAYER,CTECHNIQUE(),HOVER,INSTALLMENT%
COMMON INTEREST%,L(),LOAN%,LOAN(),LPLAYER,LX,LY,P(),P1(),P2(),PC,PERIODS%
COMMON PL(),PR(),RESOURCE(),S,SCORE(),SCOST(),SHOTX(),SQ(),T,TECHNIQUE()
COMMON V(),W(),X,X(),X1,XINC,Y,Y(),Y1,YINC
CONST SBY=190, BLACK=0, GREEN=1, RED=2, BROWN=3, MXLOAN=5, PT=2, PB=PT+5
CONST LC=BROWN, MC=RED, SBO=BROWN, SBB=BLACK, AC=BROWN
CONST PBB=RED, PBL=BLACK, PBC=BROWN, SO=BROWN, PI=3.141592654

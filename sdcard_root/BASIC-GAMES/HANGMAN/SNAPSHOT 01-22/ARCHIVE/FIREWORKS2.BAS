SCREEN $80
GOSUB FIREWORKS
END

FIREWORKS:
RECT 0,0,319,239,$10
STARTLOOP:
REM Palette 4, 63
  FOR WF = 0 TO 6
    GETRANDS:
    X = INT(RND(.)*300 + 15)
    Y = INT(RND(.)*90 + 30)
    L1 = X-2
    L2 = Y-2
    L3 = 318 - X
    L4 = 178 - Y

    SIZE = INT(RND(.) * 25)
    IF SIZE > L1 OR SIZE > L2 OR SIZE > L3 OR SIZE > L4 THEN GOTO GETRANDS

    DELAY=8
    FOR UP = 178 TO Y STEP -1
        RECT X, UP,X+1,UP+1, 7
        FOR I=0 TO DELAY:NEXT I
        RECT X, UP,X+1,UP+1, $10
    NEXT UP

    PSET X,Y, 7

    REM Sound 60, 1

    FOR O = 0 TO 28 STEP 4
        FOR EX = 0 To 6 STEP 2
            GET X$
            IF X$ <> "" THEN END
            B1 = INT(RND(.) * SIZE) + O: B2 = INT(RND(.) * SIZE) + O
            X1=X - INT(RND(.) * B1):Y1 = Y - RND(.) * B2
            GOSUB ADJUST
            RECT X1,Y1,X1+1,Y1+1,CC
            X1=X+RND(.) * B1:Y1=Y+RND(.) * B2
            GOSUB ADJUST
            PSET X1%,Y1%,CC
            X1=X+ RND(.)*B1:Y1 =Y-RND(.)*B2
            GOSUB ADJUST
            RECT X1,Y1,X1+1,Y1+1,CC
            X1= X-RND(.) * B1:Y1=Y+RND(.)*B2
            GOSUB ADJUST
            RECT X1,Y1,X1+1,Y1+1,CC
        NEXT EX
    NEXT O
    RECT 0,0,319,239,$10
  NEXT WF
RETURN

ADJUST:
   IF X1>318 THEN X1=318
   IF X1<0 THEN X1=0
   IF Y1<0 THEN Y1=0
   IF Y1>238 THEN Y1=238
   REM C = INT(RND(.)*4) + 1
   REM IF C=1 THEN CC=INT(RND(.)*12)+$30
   REM IF C=2 THEN CC=INT(RND(.)*8)+$50
   REM IF C=3 THEN CC=INT(RND(.)*5)+$FB
   CC=INT(RND(.)*253)+1
  RETURN




'--- Maximus 3.01
' * Origin: BitByters BBS, Jim Brown (Sysop) Rockland, ON, Can. (1:163/215)



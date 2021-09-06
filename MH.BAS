DIM vars$(512)
INPUT "Enter FileName for which to make a header file:";file$
OPEN file$+".BAS" FOR input AS #1
var=1
CALL search
CALL alph(vars$(),var)
CLOSE #1
CALL make
END

SUB search STATIC
 LOCATE 5:PRINT "Searching..."
 check$="SHARED"
 check=1
 WHILE NOT EOF(1)
  ch$=INPUT$(1,#1)
  call cap(ch$)
  c=ASC(ch$)
  IF ch$="'" THEN
   comt=1
  ELSEIF c=13 THEN
   comt=0
  END IF
  IF ch$=MID$(check$,check,1) AND NOT comt THEN
   IF check=len(check$) THEN
    CALL found
    LOCATE 5:PRINT "Searching..."
    check=0
   END IF
   check=check+1
  ELSE
   check=1
  END IF
 WEND
END SUB

SUB found STATIC
 SHARED vars$(),var
 LOCATE 5:PRINT "Found...    "
 ch$=INPUT$(1,#1)
 call cap(ch$)
 c=ASC(ch$)
 inc=1
 WHILE NOT EOF(1) AND NOT c=13 AND NOT c=10
  ch=1
  if inc=0 then
   ch$=INPUT$(1,#1)
   call cap(ch$)
   c=ASC(ch$)
  else
   inc=0
  end if
  var$=""
  WHILE NOT c=44 AND NOT c=13 AND NOT c=10
   IF NOT c=32 AND NOT c=13 AND NOT c=10 THEN
    var$=var$+ch$
    ch=ch+1
   END IF
   ch$=INPUT$(1,#1)
   call cap(ch$)
   c=ASC(ch$)
  WEND
  IF CH>1 THEN
   CALL CHECK.DUP(VARS$(),VAR,VAR$,IN)
   IF IN=0 THEN
    VARS$(VAR)=VAR$
    LOCATE 10:PRINT "VARIABLES:"VAR
    var=var+1
   END IF
  END IF
 WEND
END SUB

SUB CAP(K$) STATIC
 FOR A=1 TO LEN(K$)
  A$=MID$(K$,A,1)
  IF ASC(A$)=>97 AND ASC(A$)<=122 THEN
   MID$(K$,A,1)=CHR$(ASC(A$)-32)
  END IF
 NEXT A
END SUB

SUB make STATIC
 SHARED vars$(),var
 INPUT "Enter Name for header file:";file$
 OPEN file$+".BAS" FOR output AS #1
newline:
 PRINT #1,"COMMON ";
 l=7
 FOR a=2 TO var-1
  l=l+len(vars$(a))+1
  IF l>70 THEN
   PRINT #1,vars$(a)+CHR$(13)+CHR$(10)+"COMMON ";
   l=7
  ELSE
   PRINT #1,vars$(a)+",";
  END IF
 NEXT a
 PRINT #1,vars$(var+1);
END SUB

SUB ALPH(DIR$(1),TFILES) STATIC
 D=TFILES
 WHILE(D>1)
  D=INT(D/5)+1
  FOR I=1 TO TFILES-D
   FOR J=I TO 1 STEP -D
    IF DIR$(J)>DIR$(J+D) THEN
	SWAP DIR$(J),DIR$(J+D)
    ELSE
     EXIT FOR
    END IF
   NEXT J
  NEXT I
 WEND
END SUB

SUB CHECK.DUP(DIR$(1),TFILES,K$,IN) STATIC
 IN=0
 FOR A=1 TO TFILES
  IF K$=DIR$(A) THEN
   IN=1
   EXIT SUB
  END IF
 NEXT A
END SUB

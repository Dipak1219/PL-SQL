-- 1] SUM OF DIGIT
-- FUNCTION BODY
CREATE OR REPLACE FUNCTION SOD(T IN INT) RETURN INT IS
S INT := 0;
R INT;
N INT := T;
BEGIN
    WHILE N > 0 LOOP
        R := MOD(N,10);
        S := S + R;
        N := N/10;
    END LOOP;
    RETURN S;
    END;
    /

-- FUNCTION CALL
DECLARE 
N INT := &N;
Z INT;
BEGIN
    Z := SOD(N);
    DBMS_OUTPUT.PUT_LINE(Z);
END;
/

-- 2] PALINDROME NUMBER
CREATE OR REPLACE FUNCTION PAL(T IN INT) RETURN INT IS
R INT;
S INT :=0;
N INT := T;
BEGIN
    WHILE N > 0 LOOP
        R := MOD(N,10);
        S := S * 10 + R;
        N := N / 10;
    END LOOP;
RETURN S;
END;
/

DECLARE 
N INT := &N;
Z INT;
BEGIN
Z := PAL(N);
IF Z = N THEN 
    DBMS_OUTPUT.PUT_LINE('PALINDROME NUMBER');
ELSE
    DBMS_OUTPUT.PUT_LINE('NOT A PALINDROME NUMBER');
END IF;
END;
/


-- 3] ARMSTRONG NUMBER
CREATE OR REPLACE FUNCTION ARM(T IN INT) RETURN INT IS
R INT;
S INT :=0;
N INT := T;
BEGIN
    WHILE N > 0 LOOP
        R := MOD(N,10);
        S := S + (R*R*R);
        N := TRUNC(N / 10);
    END LOOP;
RETURN S;
END;
/

DECLARE 
N INT := &N;
Z INT;
BEGIN
Z := ARM(N);
DBMS_OUTPUT.PUT_LINE(Z);
IF Z = N THEN 
    DBMS_OUTPUT.PUT_LINE('ARMSTRONG NUMBER');
ELSE
    DBMS_OUTPUT.PUT_LINE('NOT A ARMSTRONG NUMBER');
END IF;
END;
/


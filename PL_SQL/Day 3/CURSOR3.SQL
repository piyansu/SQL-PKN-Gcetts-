DECLARE

    CURSOR DCR IS SELECT DID , DNAME FROM DEPARTMENT_23 ; 

    CURSOR SCR (V1 DEPARTMENT_23.DID%TYPE) IS SELECT * FROM STUDENT_23 WHERE DID = V1 ;
    
BEGIN 

    FOR MVDEPT IN DCR 
    LOOP 
        FOR MVSTD IN SCR (MVDEPT.DID)
        LOOP            
        DBMS_OUTPUT.PUT_LINE(MVSTD.SID || MVSTD.SNAME);
        END LOOP ; 
    END LOOP ; 

END;
/
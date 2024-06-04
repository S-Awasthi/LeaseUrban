CREATE OR REPLACE PROCEDURE GetRentHistory(
    Input_P_ID IN PROPERTY.P_ID%TYPE
) AS
Older_Tenant_no number := 1;
BEGIN
    EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';
    FOR CURSOR IN (SELECT * FROM Rented_To WHERE Rented_To.P_ID = Input_P_ID)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Tenant no:  ' || Older_Tenant_no);
        DBMS_OUTPUT.PUT_LINE('------------------');
        DBMS_OUTPUT.PUT_LINE('Tenant Aadhaar ID:        ' || CURSOR.T_Aadhaar_ID);
        DBMS_OUTPUT.PUT_LINE('Rent per month:          ' || CURSOR.Rent_Per_Month);
        DBMS_OUTPUT.PUT_LINE('Start Date:         ' || CURSOR.Start_Date);
        DBMS_OUTPUT.PUT_LINE('End Date:    ' || CURSOR.End_Date);
        DBMS_OUTPUT.PUT_LINE('Annual Hike:       ' || CURSOR.Annual_Hike);
        DBMS_OUTPUT.PUT_LINE('Agency Commission: ' || CURSOR.Agency_Commission);

        Older_Tenant_no := Older_Tenant_no + 1;
        DBMS_OUTPUT.PUT_LINE('------------------');
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error getting details for given property id: '
            || SQLERRM);
END;
/
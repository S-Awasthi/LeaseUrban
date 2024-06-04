CREATE OR REPLACE PROCEDURE GetTenantDetails(
    Input_P_ID IN PROPERTY.P_ID%TYPE
) AS 

Tenant_no number := 1;
BEGIN
    
    FOR CURSOR IN (SELECT * FROM USER
    WHERE Aadhaar_ID IN 
    (SELECT T_Aadhaar_ID FROM Rented_To WHERE Rented_To.P_ID=Input_P_ID))
    LOOP
        DBMS_OUTPUT.PUT_LINE('Tenant no. - ' || Tenant_no);
        DBMS_OUTPUT.PUT_LINE('---------------------');
        DBMS_OUTPUT.PUT_LINE('Aadhar ID:         ' || CURSOR.Aadhaar_ID);
        DBMS_OUTPUT.PUT_LINE('Name:           ' || CURSOR.Name);
        DBMS_OUTPUT.PUT_LINE('Age:            ' || CURSOR.Age);
        DBMS_OUTPUT.PUT_LINE('Door no. :      ' || CURSOR.Door_No#);
        DBMS_OUTPUT.PUT_LINE('Street:        ' || CURSOR.Street);
        DBMS_OUTPUT.PUT_LINE('City:         ' || CURSOR.City);
        DBMS_OUTPUT.PUT_LINE('State:           ' || CURSOR.State);
        DBMS_OUTPUT.PUT_LINE('Pincode:          ' || CURSOR.Pincode);

        Tenant_no := Tenant_no + 1;

        DBMS_OUTPUT.PUT_LINE('---------------------');
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error getting tenant details for given property id: '
            || SQLERRM);
END GetTenantDetails;
/
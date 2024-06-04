REM   Script: Create User
REM   Create User

CREATE OR REPLACE PROCEDURE CreateNewUser(
    Input_Aadhaar_ID IN User_Details.Aadhaar_ID%TYPE,
    Input_Name IN User_Details.Name%TYPE,
    Input_Age IN User_Details.Age%TYPE,
    Input_Door_No# IN User_Details.Door_No#%TYPE,
    Input_Street IN User_Details.Street%TYPE,
    Input_City IN User_Details.City%TYPE,
    Input_State IN User_Details.State%TYPE,
    Input_Pincode IN User_Details.Pincode%TYPE,
    Input_Role IN varchar2;
) 
AS
BEGIN
    EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';

    INSERT INTO User_Details(
        Aadhaar_ID,
        Name,
        Age,
        Door_No#,
        Street,
        City,
        State,
        Pincode
    ) VALUES(
        Input_Aadhaar_ID,
        Input_Name,
        Input_Age,
        Input_Door_No#,
        Input_Street,
        Input_City,
        Input_State,
        Input_Pincode,
    );

    if Input_Role := 'Manager' THEN
    INSERT INTO Manager(
        M_Aadhaar_ID
    ) VALUES(
        Input_Aadhaar_ID
    )

    else if Input_Role := 'Tenant' THEN
    INSERT INTO Tenant(
        T_Aadhaar_ID
    ) VALUES(
        Input_Aadhaar_ID
    )

    else if Input_Role := 'Owner' THEN
    INSERT INTO Owner(
        O_Aadhaar_ID
    ) VALUES(
        Input_Aadhaar_ID
    )

    else if Input_Role := 'DBA' THEN
    INSERT INTO DBA(
        DBA_Aadhaar_ID
    ) VALUES(
        Input_Aadhaar_ID
    )

    else
    DBMS_OUTPUT.PUT_LINE('Role of the User Not Defined');
    end if;
    
END;
/

CREATE OR REPLACE PROCEDURE ADDPHONENUMBER(
    Input_Aadhaar_ID IN Phone_No#.Aadhaar_ID%TYPE,
    Input_Phone_No IN Phone_No#.Phone_No%TYPE
) AS
BEGIN
    INSERT INTO Phone_No# (
        Aadhaar_ID,
        Phone_No
    ) VALUES (
        Input_Aadhaar_ID,
        Input_Phone_No
    );
END;
/


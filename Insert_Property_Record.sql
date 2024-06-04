--- PROCEDURE: ADD NEW PROPERTY
--- NOTE: YOU CAN GET COLUMN TYPE USING TABLE.COLUMNE%TYPE
REM   Script: Insert Property
REM   Insert Property

CREATE OR REPLACE PROCEDURE InsertPropertyRecord (
    Input_O_Aadhaar_ID IN PROPERTY.O_Aadhaar_ID%TYPE,
    Input_P_ID IN PROPERTY.P_ID%TYPE,
    Input_Address IN PROPERTY.Address%TYPE,
    Input_Locality IN PROPERTY.Locality%TYPE,
    Input_Owner IN PROPERTY.Owner%TYPE,
    Input_Floors IN PROPERTY.Floors%TYPE,
    Input_Available_From IN PROPERTY.Available_From%TYPE,
    Input_Available_Till IN PROPERTY.Available_Till%TYPE,
    Input_Year_Of_Construction IN PROPERTY.Year_Of_Construction%TYPE,
    Input_Rent_Per_Month IN PROPERTY.Rent_Per_Month%TYPE,
    Input_Annual_Hike IN PROPERTY.Annual_Hike%TYPE,
    Input_Plinth_Area IN PROPERTY.Plinth_Area%TYPE,
    Input_Total_Area IN PROPERTY.Total_Area%TYPE,
    Input_Type IN PROPERTY.Type%TYPE;
    Input_No_Of_Bedrooms IN PROPERTY.No_Of_Bedrooms%Type;
) AS
BEGIN
    EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';
    
    
    INSERT INTO PROPERTY (
        O_Aadhaar_ID,
        P_ID,
        Address,
        Locality,
        Owner,
        Floors,
        Available_From,
        Available_Till,
        Year_Of_Construction,
        Rent_Per_Month,
        Annual_Hike,
        Plinth_Area,
        Total_Area,
        Type,
        No_Of_Bedrooms
) VALUES (
        Input_O_Aadhaar_ID,
        Input_P_ID,
        Input_Address,
        Input_Locality,
        Input_Owner,
        Input_Floors,
        Input_Available_From,
        Input_Available_Till,
        Input_Year_Of_Construction,
        Input_Rent_Per_Month,
        Input_Annual_Hike,
        Input_Plinth_Area,
        Input_Total_Area,
        Input_Type,
        Input_No_Of_Bedrooms
    );
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error inserting data into Property table: '
            || SQLERRM);
END InsertPropertyRecord;
/


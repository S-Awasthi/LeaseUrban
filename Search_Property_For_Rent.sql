CREATE OR REPLACE PROCEDURE SearchPropertyForRent(input_Locality IN VARCHAR2) AS
Property_no number := 1 ;
BEGIN
  EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';
  FOR CURSOR IN (
    SELECT * FROM Property WHERE Property.Locality=input_locality AND CURRENT_DATE BETWEEN Property.Available_From AND Property.Available_Till
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('Property_no: ' || Property_no)
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Owner Aadhaar ID:        ' || Cursor.O_Aadhaar_ID);
    DBMS_OUTPUT.PUT_LINE('Property ID:           ' || Cursor.P_ID);
    DBMS_OUTPUT.PUT_LINE('Address:       ' || Cursor.Address);
    DBMS_OUTPUT.PUT_LINE('Locality:      ' || Cursor.Locality);
    DBMS_OUTPUT.PUT_LINE('Owner:      ' || Cursor.Owner);
    DBMS_OUTPUT.PUT_LINE('Floors:          ' || Cursor.Floors);
    DBMS_OUTPUT.PUT_LINE('Available from:         ' || Cursor.Available_From);
    DBMS_OUTPUT.PUT_LINE('Available till:         ' || Cursor.Available Till);
    DBMS_OUTPUT.PUT_LINE('year Of Construction: ' || Cursor.Year_Of_Construction);
    DBMS_OUTPUT.PUT_LINE('Rent per Month:           ' || Cursor.Rent_Per_Month);
    DBMS_OUTPUT.PUT_LINE('Annual Hike:            ' || Cursor.Annual_Hike);
    DBMS_OUTPUT.PUT_LINE('Plinth Area:         ' || Cursor.Plinth_Area);
    DBMS_OUTPUT.PUT_LINE('Total Area:       ' || Cursor.Total_Area);
    DBMS_OUTPUT.PUT_LINE('Type:        ' || Cursor.Type);
    DBMS_OUTPUT.PUT_LINE('No of Bedrooms    '|| Cursor.No_Of_Bedrooms);
    
    Property_no := Property_no + 1;
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

  END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('No properties available in this city for rent: '
            || SQLERRM);
END;
/
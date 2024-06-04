CREATE OR REPLACE PROCEDURE SearchPropertyForRent(input_Locality IN VARCHAR2) AS
Property_no number := 1 ;
CURSOR rent_cursor is (SELECT O_Aadhaar_ID,P_ID,Address,Locality,Owner,Floors,Available_From,Available_Till,Year_Of_Construction,Rent_Per_Month,Annual_Hike,Plinth_Area,Total_Area,Type,No_Of_Bedrooms FROM Property,Rented_To WHERE Rented_To.P_ID = Property.PID and Property.Locality=input_locality AND CURRENT_DATE BETWEEN Property.Available_From AND Property.Available_Till AND CURRENT_DATE > Rented_To.End_Date);

A_ID_2 varchar2(80);
P_Id_2 number;
add_2 varchar2(80);
local_2 varchar2(80);
Own_2 varchar2(80);
flo_2 number;
AF_2 DATE;
AT_2 DATE;
yoc number;
rpm number;
hike number;
pa number;
ta number;
ty varchar2(80);
nob number;



BEGIN
  open rent_cursor;
  LOOP
    FETCH rent_cursor into A_ID_2 ,P_Id_2 ,add_2 ,local_2 ,Own_2 ,flo_2 ,AF_2,AT_2 ,yoc ,rpm,hike ,pa ,ta,ty,nob ;
    exit when rent_cursor%notfound;
    DBMS_OUTPUT.PUT_LINE('Property_no: ' || Property_no);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Owner Aadhaar ID:        ' || A_ID_2);
    DBMS_OUTPUT.PUT_LINE('Property ID:           ' || P_Id_2);
    DBMS_OUTPUT.PUT_LINE('Address:       ' || add_2);
    DBMS_OUTPUT.PUT_LINE('Locality:      ' || local_2);
    DBMS_OUTPUT.PUT_LINE('Owner:      ' || Own_2);
    DBMS_OUTPUT.PUT_LINE('Floors:          ' || flo_2);
    DBMS_OUTPUT.PUT_LINE('Available from:         ' || AF_2);
    DBMS_OUTPUT.PUT_LINE('Available till:         ' || AT_2);
    DBMS_OUTPUT.PUT_LINE('year Of Construction: ' || yoc);
    DBMS_OUTPUT.PUT_LINE('Rent per Month:           ' || rpm);
    DBMS_OUTPUT.PUT_LINE('Annual Hike:            ' || hike);
    DBMS_OUTPUT.PUT_LINE('Plinth Area:         ' || pa);
    DBMS_OUTPUT.PUT_LINE('Total Area:       ' || ta);
    DBMS_OUTPUT.PUT_LINE('Type:        ' || ty);
    DBMS_OUTPUT.PUT_LINE('No of Bedrooms    '|| nob);
    
    Property_no := Property_no + 1;
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

  END LOOP;
  commit;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('No properties available in this city for rent: '
            || SQLERRM);
END;
/
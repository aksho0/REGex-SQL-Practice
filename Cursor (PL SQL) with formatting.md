# CURSOR



Cursor is a pointer that is used to refer the memory address/access the result of your SQL query.



##### There are two types of cursor

1\. Implicit : They are automatically created by oracle.

2\. Explicit : They are created by user.  



##### Attributes of cursor

1\. SQL%ROWCOUNT : counts the number of rows affected by the query

2\. %FOUND : returns true if cursor have any data otherwise false.

3\. %ISOPEN : returns true if cursor is open otherwise false.



##### Creating Explicit cursor 



###### Syntax



DECLARE

&#x09;cursor cursor\_name  is QUERY;

&#x09;variable datatype;

BEGIN

&#x09;OPEN cursor\_name;

&#x09;FETCH cursor\_name INTO variable;

&#x09;CLOSE cursor\_name;

END



###### Example (fetching single row with while loop)



DECLARE

&#x20;   cursor data\_cursor is SELECT first\_name FROM hr.employees;

&#x20;   v\_name VARCHAR(50);

BEGIN

&#x20;   DBMS\_OUTPUT.PUT\_LINE('Starting with cursor');

&#x20;   OPEN data\_cursor;

&#x20;   FETCH data\_cursor INTO v\_name;



&#x20;   IF (data\_cursor%ISOPEN) THEN

&#x20;       DBMS\_OUTPUT.PUT\_LINE('Cursor is open');

&#x20;   END IF;



&#x20;   DBMS\_OUTPUT.PUT\_LINE('Cursor open');



&#x20;   IF(data\_cursor%FOUND) THEN

&#x20;       DBMS\_OUTPUT.PUT\_LINE('Data found in cursor');

&#x20;   END IF;



&#x20;   WHILE(data\_cursor%FOUND) LOOP

&#x20;       DBMS\_OUTPUT.PUT\_LINE(v\_name);

&#x20;       FETCH data\_cursor INTO v\_name;

&#x20;   END LOOP;

END;



###### Example (fetching multiple rows with while loop)



DECLARE

&#x20;   cursor data\_cursor is SELECT \* FROM hr.employees;

&#x20;   detail\_rec hr.employees%ROWTYPE; -- fetch all the data in one valriable 

BEGIN

&#x20;   DBMS\_OUTPUT.PUT\_LINE('Starting with cursor');

&#x20;   OPEN data\_cursor;

&#x20;   FETCH data\_cursor INTO detail\_rec;



&#x20;   IF (data\_cursor%ISOPEN) THEN

&#x20;       DBMS\_OUTPUT.PUT\_LINE('Cursor is open');

&#x20;   END IF;



&#x20;   DBMS\_OUTPUT.PUT\_LINE('Cursor open');



&#x20;   IF(data\_cursor%FOUND) THEN

&#x20;       DBMS\_OUTPUT.PUT\_LINE('Data found in cursor');

&#x20;   END IF;



&#x20;   WHILE(data\_cursor%FOUND) LOOP

&#x20;       DBMS\_OUTPUT.PUT\_LINE(detail\_rec.first\_name || ' - ' || detail\_rec.salary);

&#x20;       FETCH data\_cursor INTO detail\_rec;

&#x20;   END LOOP;

END;







###### Example (with for loop)

DECLARE

&#x20;   cursor data\_cursor is SELECT first\_name FROM hr.employees;

BEGIN

&#x20;   -- There is no need to open the cursor explicitly

&#x20;   FOR data\_line IN data\_cursor LOOP

&#x20;       DBMS\_OUTPUT.PUT\_LINE(data\_line.first\_name);

&#x20;   END LOOP;

END;




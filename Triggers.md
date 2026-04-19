# Triggers



Triggers are the block of code, same as procedure, that will run automatically when an event is triggered.

Procedure doesn't have DECLARE section, triggers have.



#### Types

1. Statement level triggers : : The default type; they fire only once per SQL statement, regardless of how many rows are changed (even if zero rows are affected).
2. Row-Level Triggers: Defined with the FOR EACH ROW clause. They fire once for every individual row affected by the statement.



#### Syntax



CREATE \[OR REPLACE] TRIGGER trigger\_name

{BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE}

ON table\_name

\[FOR EACH ROW]

\[WHEN (condition)]

DECLARE

&#x20;  -- variable declarations

BEGIN

&#x20;  -- trigger logic (action)

END;



#### Example



CREATE OR REPLACE TRIGGER t\_name

BEFORE

UPDATE

ON hr.employees

BEGIN

&#x20;   DBMS\_OUTPUT.PUT\_LINE('Trigger invoked');

END;






DROP SCHEMA IF EXISTS jqb2jooq;
CREATE SCHEMA jqb2jooq;

SET SCHEMA jqb2jooq;

CREATE TABLE employees
(
  id UUID PRIMARY KEY,
  fullname TEXT NOT NULL,
  dob DATE NOT NULL,
  favorite_food text
);

CREATE TABLE payroll
(
  id UUID PRIMARY KEY,
  employee_id UUID NOT NULL,
  amount INT NOT NULL,
  type TEXT NOT NULL,
  CONSTRAINT payroll_employee_fk FOREIGN KEY (employee_id) REFERENCES employees (id) ON DELETE CASCADE
);


CREATE INDEX employees_id_index ON employees (id);
CREATE INDEX payroll_id_index ON payroll (id);


INSERT INTO employees (id, fullname, dob, favorite_food) VALUES
  ('2b538e32-a9aa-4549-9015-81d84fb91560', 'James C. Gomez', '1982-04-05', 'pizza'),
  ('a73ca7e3-80b2-4afa-aad1-e13a3b09bd11', 'Michael R. Prince', '1976-09-22', 'pizza'),
  ('3b7177e2-14dc-4169-8fb8-08ce308cb715', 'Willie P. Rudd', '1988-04-11', 'salad'),
  ('af3af775-76b4-46b3-8a3d-8e892b4a2c98', 'Sherry M. Moore', '1997-12-05', NULL),
  ('e1349340-a7ac-4caf-b983-604f3afa796b', 'Paul M. Boyer', '1950-05-01', NULL),
  ('7293357b-8c09-4662-8400-c7fb73d8ab1c', 'Isaac Fulmer', '1984-01-01', 'potato salad'),
  ('96d45af7-fbfc-42b4-9629-004e66945523', 'Patricia R. Loving', '1973-08-02', 'chicken'),
  ('b86c1517-8ecd-4a6f-9678-efa5541bf0d0', 'Cecelia J. Torres', '1982-04-05', 'roast beef');

INSERT INTO payroll (id, employee_id, amount, type) VALUES
  ('acfd69f5-f42d-489f-a89c-8c808345e380', '2b538e32-a9aa-4549-9015-81d84fb91560', 37000, 'SALARY'),
  ('4f06e027-d710-4dbe-88a9-992052364904', 'a73ca7e3-80b2-4afa-aad1-e13a3b09bd11', 23970,  'SALARY'),
  ('3301866a-97d9-441a-acc8-ab48dc06683c', '3b7177e2-14dc-4169-8fb8-08ce308cb715', 19435, 'SALARY'),
  ('8d625881-e075-4623-a229-206686ac3a30', 'af3af775-76b4-46b3-8a3d-8e892b4a2c98', 32, 'HOURLY'),
  ('647f7812-b3da-46ed-aa44-20d941d9e977', 'e1349340-a7ac-4caf-b983-604f3afa796b', 20, 'HOURLY'),
  ('5808cdf3-701a-47a2-a9c6-c2b8f6d37435', '7293357b-8c09-4662-8400-c7fb73d8ab1c', 2500000,  'SALARY'),
  ('0011be7c-edab-4c20-a291-2d4ab07b068c', '96d45af7-fbfc-42b4-9629-004e66945523', 12, 'HOURLY'),
  ('d297f9fb-d7a3-4201-9af8-ef08b65d714e', 'b86c1517-8ecd-4a6f-9678-efa5541bf0d0', 15, 'HOURLY');
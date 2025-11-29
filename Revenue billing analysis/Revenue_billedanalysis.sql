CREATE DATABASE Revenue_billing;
USE Revenue_billing;

SHOW DATABASES;

CREATE TABLE clients (
    client_id INT PRIMARY KEY,    #Unique client ID
    client_name VARCHAR(50)       #Name of the client
);

INSERT INTO clients VALUES
(1, 'Google'),
(2, 'Amazon'),
(3, 'Netflix');

SELECT * FROM clients;
DROP TABLE IF EXISTS clients;

CREATE TABLE projects (
    project_id INT PRIMARY KEY,                           #Unique project ID
    client_id INT,                                        #Linked to clients
    project_name VARCHAR(50),                             #Name of the project
    monthly_contract_amount DECIMAL(10,2),                #Monthly bill agreed
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

INSERT INTO projects VALUES
(101, 1, 'Data Pipeline Support', 50000),
(102, 2, 'Cloud Monitoring', 75000),
(103, 3, 'ETL Maintenance', 60000);

SELECT * FROM projects;

CREATE TABLE revenue_billing (
    billing_id INT PRIMARY KEY,
    client_name VARCHAR(50), #Unique
    project_id INT,                   #Linked to projects
    month VARCHAR(20),                #Revenue month
    billed_amount DECIMAL(10,2),      #Amount invoiced
    unbilled_amount DECIMAL(10,2),    #Work done but invoice not raised
    provision_amount DECIMAL(10,2),   #Accountant’s estimated revenue when data is missing
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO revenue_billing VALUES
(1, 101,'Google','January-2025', 50000, 0, 0),
(2, 102,'Google','January-2025', 0, 75000, 0),
(3, 103,'Amazon','January-2025', 0, 0, 60000),
(4, 101,'Amazon','February-2025', 50000, 0, 0),
(5, 102,'Netflix','February-2025', 40000, 35000, 0),
(6, 103,'Netflix','February-2025', 0, 0, 60000);

SELECT * FROM revenue_billing;

# Revenue = Billed + Unbilled + Provision

SELECT 
    month,
    SUM(billed_amount) AS total_billed,
    SUM(unbilled_amount) AS total_unbilled,
    SUM(provision_amount) AS total_provision,
    (SUM(billed_amount) + SUM(unbilled_amount) + SUM(provision_amount)) AS total_revenue
FROM revenue_billing
GROUP BY month;

# billed vs unbilled vs provision
SELECT 
    p.project_name,
    r.month,
    r.billed_amount,
    r.unbilled_amount,
    r.provision_amount,
    CASE
        WHEN r.billed_amount > 0 AND r.unbilled_amount = 0 AND r.provision_amount = 0 THEN 'Fully Billed'
        WHEN r.unbilled_amount > 0 THEN 'Unbilled Revenue'
        WHEN r.provision_amount > 0 THEN 'Provision'
        ELSE 'No Activity'
    END AS revenue_type
FROM revenue_billing r
JOIN projects p ON r.project_id = p.project_id
ORDER BY r.month, p.project_name;


CREATE TABLE revenue_billing2 (
    billing_id INT PRIMARY KEY,       #Unique
    client_id INT,                   #Linked to projects
    month VARCHAR(20),                #Revenue month
    billed_amount DECIMAL(10,2),      #Amount invoiced
    unbilled_amount DECIMAL(10,2),    #Work done but invoice not raised
    provision_amount DECIMAL(10,2),   #Accountant’s estimated revenue when data is missing
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

INSERT INTO revenue_billing2 VALUES
(1, 1,'January-2025', 50000, 0, 0),
(2, 1,'January-2025', 0, 75000, 0),
(3, 2,'January-2025', 0, 0, 60000),
(4, 2,'February-2025', 50000, 0, 0),
(5, 3,'February-2025', 40000, 35000, 0),
(6, 3,'February-2025', 0, 0, 60000);

SELECT * FROM revenue_billing2;
DROP TABLE IF EXISTS revenue_billing2;

SELECT 
    c.client_name,
    re.month,
    re.billed_amount,
    re.unbilled_amount,
    re.provision_amount,
    CASE
        WHEN re.billed_amount > 0 
             AND re.unbilled_amount = 0 
             AND re.provision_amount = 0 
            THEN 'Fully Billed'

        WHEN re.unbilled_amount > 0 
            THEN 'Unbilled Revenue'

        WHEN re.provision_amount > 0 
            THEN 'Provision'

        ELSE 'No Activity'
    END AS revenue_type
FROM revenue_billing2 re
JOIN clients c 
    ON re.client_id = c.client_id
ORDER BY re.month, c.client_name;

#Who is generating the most revenue?
SELECT 
    p.project_name,
    SUM(billed_amount + unbilled_amount + provision_amount) AS total_project_revenue
FROM revenue_billing r
JOIN projects p ON r.project_id = p.project_id
GROUP BY p.project_name;














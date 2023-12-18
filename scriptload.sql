USE projeto_final;

LOAD DATA INFILE 'H:\\MySQL Server 8.0\\Uploads\\projeto_mysql\\PdM_machines.csv'
INTO TABLE machine
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_machine, model, @idade)
SET manufacture_date = YEAR(DATE_SUB('2015-01-01', INTERVAL @idade YEAR));

LOAD DATA INFILE 'H:\\MySQL Server 8.0\\Uploads\\projeto_mysql\\PdM_maint.csv'
INTO TABLE maint
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@anodata, id_machine, `component`)
SET `datetime` = @anodata;

LOAD DATA INFILE 'H:\\MySQL Server 8.0\\Uploads\\projeto_mysql\\PdM_telemetry.csv'
INTO TABLE telemetry
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@anodata, id_machine, volt, `rotate`, pressure, vibration)
SET `datetime` = @anodata;

SET FOREIGN_KEY_CHECKS = 0;

LOAD DATA INFILE 'H:\\MySQL Server 8.0\\Uploads\\projeto_mysql\\PdM_failures.csv'
INTO TABLE failure
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'"
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@anodata, id_machine, failure)
SET `datetime` = @anodata;

SET FOREIGN_KEY_CHECKS = 1;

LOAD DATA INFILE 'H:\\MySQL Server 8.0\\Uploads\\projeto_mysql\\PdM_errors.csv'
INTO TABLE `error`
FIELDS TERMINATED BY ',' 
ESCAPED BY '"'
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(@diahora, id_machine, id_error)
SET `datetime` = @diahora;

INSERT INTO `projeto_final`.`brands` (id_machine, brand, motor_size)
VALUES ()



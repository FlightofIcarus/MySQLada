SELECT model, COUNT(model) AS total_falhas FROM machine AS m INNER JOIN failure AS f
ON m.id_machine = f.id_machine
GROUP BY model ORDER BY total_falhas DESC;

SELECT CONCAT(('2015' - manufacture_date), ' ANOS') AS idade_das_maquinas, COUNT(manufacture_date) AS falhas_por_idade 
FROM machine AS m INNER JOIN
failure AS f ON m.id_machine = f.id_machine
GROUP BY idade_das_maquinas 
ORDER BY falhas_por_idade DESC;

SELECT maquina, `component`, MAX(quantidade_de_falhas) FROM (SELECT id_machine AS maquina, `component`, COUNT(`component`) AS quantidade_de_falhas
FROM maint AS falha GROUP BY maquina, `component`) AS derived_table GROUP BY maquina, `component` ORDER BY maquina;

SELECT model, ROUND(AVG('2015' - manufacture_date)) AS average_age FROM machine INNER JOIN `error`
ON machine.id_machine = `error`.id_machine GROUP BY model;

SELECT model, id_error, COUNT(id_error) AS total_errors FROM machine INNER JOIN `error`
ON machine.id_machine = `error`.id_machine
GROUP BY model, id_error ORDER BY model;

CREATE VIEW `max_of_fail` AS SELECT maquina, `component`, higher_fail FROM(SELECT maquina, MAX(qtd_fail) AS higher_fail
FROM (SELECT id_machine AS maquina, `component`, COUNT(`component`) AS qtd_fail FROM maint GROUP BY maquina, `component`) AS `count` GROUP BY maquina) AS `max` 
INNER JOIN (SELECT id_machine, `component`, COUNT(`component`) AS max_fail 
FROM maint GROUP BY id_machine, `component`) AS fails ON `max`.higher_fail = fails.max_fail AND `max`.maquina = fails.id_machine GROUP BY maquina, `component`;

SELECT * FROM `max_of_fail`;
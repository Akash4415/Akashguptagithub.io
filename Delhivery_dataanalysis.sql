SELECT * FROM Delhivery_data;
SELECT * FROM Delhivery_data LIMIT 10000;
SELECT * FROM Delhivery_data LIMIT 140000;
SELECT 
    data,
    AVG(actual_distance_to_destination) AS avg_distance,
    MIN(actual_distance_to_destination) AS min_distance,
    MAX(actual_distance_to_destination) AS max_distance,
    COUNT(*) AS total_records
FROM Delhivery_data
WHERE data = 'test'
GROUP BY data;
SELECT 
    data,
    SUM(actual_distance_to_destination) AS total_distance
FROM Delhivery_data
WHERE data = 'test'
GROUP BY data;
SELECT 
    data,
    AVG(actual_distance_to_destination) AS avg_distance,
    MIN(actual_distance_to_destination) AS min_distance,
    MAX(actual_distance_to_destination) AS max_distance,
    COUNT(*) AS total_records
FROM Delhivery_data
WHERE data = 'training'
GROUP BY data;
SELECT 
    data,
    SUM(actual_distance_to_destination) AS total_distance
FROM Delhivery_data
WHERE data = 'training'
GROUP BY data;
ALTER TABLE Delhivery_data
ADD Transit_time INT;
-- Updating the new column with the difference between two dates
UPDATE Delhivery_data
SET Transit_time = DATEDIFF(day, `od_start date`,`cut off date`);
SELECT * FROM Delhivery_data;
ALTER TABLE Delhivery_data
DROP COLUMN Transit_time;
SELECT * FROM Delhivery_data;
SELECT * FROM Delhivery_data
WHERE route_type = "Carting" AND source_name = 'Anand_VUNagar_DC (Gujarat)' AND destination_name = 'Khambhat_MotvdDPP_D (Gujarat)';
SELECT 
    route_type,source_name,destination_name,
    SUM(osrm_distance) AS total_distancetravelled
FROM Delhivery_data
WHERE route_type  = "Carting" AND source_name = 'Anand_VUNagar_DC (Gujarat)' AND destination_name = 'Khambhat_MotvdDPP_D (Gujarat)'
GROUP BY route_type,source_name,destination_name;
SELECT 
    route_type,source_name,destination_name,
    SUM(osrm_distance) AS total_distancetravelled
FROM Delhivery_data
WHERE route_type  = "FTL" AND source_name = 'Anand_VUNagar_DC (Gujarat)' AND destination_name = 'Khambhat_MotvdDPP_D (Gujarat)'
GROUP BY route_type,source_name,destination_name;
SELECT 
    route_type,
    SUM(osrm_distance) AS total_distancetravelled
FROM Delhivery_data
GROUP BY route_type;
SELECT 
    source_center,
    SUM(osrm_distance) AS total_distancetravelled
FROM Delhivery_data
GROUP BY source_center;
SELECT MAX(actual_distance_to_destination) AS Max_Distance_travelled 
FROM Delhivery_data
WHERE route_type = 'Carting';
SELECT MAX(actual_distance_to_destination) AS Max_Distance_travelled 
FROM Delhivery_data
WHERE route_type = 'FTL';
SELECT COUNT(*) AS Record_Count
FROM Delhivery_data
WHERE `od_end time` > `cut off time`;
SELECT COUNT(*) AS Record_Count
FROM Delhivery_data
WHERE `od_end time` < `cut off time`;
SELECT *
FROM Delhivery_data
WHERE source_name = destination_name LIMIT 100;
SELECT COUNT(*) AS Number_of_rec
FROM Delhivery_data
WHERE actual_time > osrm_time;
SELECT COUNT(*) AS Number_of_records
FROM Delhivery_data
WHERE actual_time < osrm_time;









# Count number of males and females
SELECT 
    (SELECT COUNT(*) FROM stroke_dataset WHERE gender = 'FEMALE') AS FemaleNum,
    (SELECT COUNT(*) FROM stroke_dataset WHERE gender = 'MALE') AS MaleNum;


# Count stroke% per gender
SELECT 
    SUM(CASE WHEN gender = 'FEMALE' THEN stroke ELSE 0 END) / COUNT(CASE WHEN gender = 'FEMALE' THEN gender ELSE NULL END) AS FemaleStroke,
    SUM(CASE WHEN gender = 'MALE' THEN stroke ELSE 0 END) / COUNT(CASE WHEN gender = 'MALE' THEN gender ELSE NULL END) AS MaleStroke
FROM 
    stroke_dataset;

# age & stroke distribution
SELECT age, SUM(stroke) AS StrokeVictims
FROM stroke_dataset
GROUP BY age
ORDER BY age;

# age & stroke% distribution
SELECT age, SUM(stroke) / COUNT(age) AS PercentagePerAge
FROM stroke_dataset
GROUP BY age
ORDER BY age;

# Stroke% and Glucose level
SELECT 
    (SUM(CASE WHEN avg_glucose_level >= 40 AND avg_glucose_level < 70 THEN stroke ELSE 0 END)) / SUM(CASE WHEN avg_glucose_level >= 40 AND avg_glucose_level < 70 THEN 1 ELSE 0 END) AS StrokePercentage_40_70,
    (SUM(CASE WHEN avg_glucose_level >= 70 AND avg_glucose_level < 100 THEN stroke ELSE 0 END)) / SUM(CASE WHEN avg_glucose_level >= 70 AND avg_glucose_level < 100 THEN 1 ELSE 0 END) AS StrokePercentage_70_100,
    (SUM(CASE WHEN avg_glucose_level >= 100 AND avg_glucose_level < 126 THEN stroke ELSE 0 END)) / SUM(CASE WHEN avg_glucose_level >= 100 AND avg_glucose_level < 126 THEN 1 ELSE 0 END) AS StrokePercentage_100_126,
    (SUM(CASE WHEN avg_glucose_level >= 126 THEN stroke ELSE 0 END)) / SUM(CASE WHEN avg_glucose_level >= 126 THEN 1 ELSE 0 END) AS StrokePercentage_126_plus
FROM stroke_dataset;


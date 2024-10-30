-- 1.Count of F vs M that have OCD -- Average obsession score by gender

SELECT Gender, COUNT(`Patient ID`) AS Patient_Count, 
ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) AS Avg_OBS_Score
FROM ocd_patient_dataset
GROUP BY Gender;

-- 2.Count & Average Obsession Score by ethnicities that have ocd

SELECT Ethnicity,
COUNT(`Patient ID`) AS patient_count,
ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) AS Avg_OBS_Score
FROM ocd_patient_dataset
GROUP BY Ethnicity;

-- 3.Number of people diagoned with OCD MoM

ALTER TABLE ocd_patient_dataset
MODIFY `OCD Diagnosis Date` DATE;

SELECT 
date_format(`OCD Diagnosis Date`, '%Y-%m-%01') AS `month`,
COUNT(`Patient ID`) AS patient_count
FROM ocd_patient_dataset
GROUP BY 1
ORDER BY 1;

-- 4.What is the most common obsession type (count) & it's respective average obssession score

SELECT `Obsession Type`,
COUNT(`Patient ID`) AS patient_count,
ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) AS avg_OBS_score
FROM ocd_patient_dataset
GROUP BY `Obsession Type`
ORDER BY patient_count DESC;

-- 5. What is the most common compulsion type (count) & it's respective average obssession score


SELECT `Compulsion Type`,
COUNT(`Patient ID`) AS patient_count,
ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) AS avg_OBS_score
FROM ocd_patient_dataset
GROUP BY `Compulsion Type`
ORDER BY patient_count DESC;
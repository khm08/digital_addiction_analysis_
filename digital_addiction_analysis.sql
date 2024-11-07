
-- SQL query to extract and calculate KPIs for digital addiction and psychological well-being data
SELECT 
    Primary_Activity,
    AVG(Digital_Usage_Hours_Per_Day) AS Average_Digital_Usage_Hours_Per_Day,
    AVG(Addiction_Score) AS Average_Addiction_Score,
    AVG(Anxiety_Level) AS Average_Anxiety_Level,
    AVG(Depression_Level) AS Average_Depression_Level,
    AVG(Stress_Level) AS Average_Stress_Level,
    AVG(Wellbeing_Score) AS Average_Wellbeing_Score
FROM 
    digital_addiction_psychological_wellbeing_data
GROUP BY 
    Primary_Activity
ORDER BY 
    Average_Addiction_Score DESC;

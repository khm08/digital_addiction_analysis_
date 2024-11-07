
-- SQL Script: Airline Operations Analysis
-- =======================================

-- 1. Create Table: Airline Operations
CREATE TABLE Airline_Operations (
    Flight_Number VARCHAR(10),
    On_Time_Performance DECIMAL(5, 2),  -- percentage
    Cancellations INT,
    Revenue DECIMAL(10, 2),  -- in USD
    Costs DECIMAL(10, 2),  -- in USD
    Customer_Satisfaction DECIMAL(3, 2),  -- scale of 1 to 5
    Fuel_Consumption DECIMAL(10, 2),  -- in liters
    Staff_Efficiency DECIMAL(5, 2),  -- percentage
    Profit DECIMAL(10, 2),  -- Revenue - Costs
    Month_Index INT,
    Route VARCHAR(20),
    Time_of_Day VARCHAR(20)
);

-- 2. Insert Data into Airline_Operations
INSERT INTO Airline_Operations (Flight_Number, On_Time_Performance, Cancellations, Revenue, Costs, Customer_Satisfaction, Fuel_Consumption, Staff_Efficiency, Profit, Month_Index, Route, Time_of_Day)
VALUES
('FL0001', 81.24, 0, 160282.42, 136394.06, 4.39, 3734.47, 61.83, 23888.36, 6, 'Route B', 'Evening'),
('FL0002', 98.52, 3, 81360.74, 33314.01, 3.70, 4355.95, 84.83, 48046.73, 1, 'Route B', 'Afternoon'),
('FL0003', 91.96, 4, 131217.20, 99463.79, 4.87, 9966.65, 73.90, 31753.41, 8, 'Route C', 'Morning'),
('FL0004', 87.96, 3, 154367.66, 82616.89, 3.08, 7575.40, 68.37, 71750.77, 6, 'Route C', 'Evening'),
('FL0005', 74.68, 4, 84282.50, 110643.14, 3.84, 5073.61, 83.19, -26360.63, 3, 'Route C', 'Afternoon'),
('FL0006', 74.68, 4, 76243.24, 69378.32, 4.94, 7896.81, 73.66, 6864.92, 9, 'Route D', 'Morning'),
('FL0007', 71.74, 2, 197325.25, 48604.99, 4.10, 9322.03, 81.49, 148720.26, 2, 'Route B', 'Afternoon'),
('FL0008', 95.99, 4, 127495.38, 147820.91, 3.85, 9669.62, 78.40, -20325.52, 11, 'Route D', 'Evening'),
('FL0009', 88.03, 3, 89124.38, 130672.02, 4.14, 2462.91, 83.39, -41547.64, 8, 'Route D', 'Morning'),
('FL0010', 91.24, 4, 199438.05, 133248.55, 4.15, 5156.17, 76.01, 66189.50, 10, 'Route C', 'Afternoon'),
('FL0011', 70.62, 2, 194812.90, 60030.16, 4.46, 2854.05, 87.91, 134782.74, 3, 'Route C', 'Morning'),
('FL0012', 99.10, 2, 133744.02, 34660.17, 3.26, 4685.28, 67.20, 99083.85, 5, 'Route A', 'Afternoon'),
('FL0013', 94.97, 3, 182395.45, 66391.86, 3.50, 3357.44, 87.86, 116003.59, 6, 'Route A', 'Evening'),
('FL0014', 76.37, 1, 78306.07, 94449.89, 4.16, 7174.79, 76.47, -16143.83, 10, 'Route D', 'Evening'),
('FL0015', 75.45, 1, 91830.70, 69198.15, 4.73, 5106.15, 94.97, 22632.55, 6, 'Route B', 'Morning'),
('FL0016', 75.50, 4, 155053.67, 129344.28, 4.12, 3835.16, 80.61, 25709.39, 4, 'Route C', 'Afternoon'),
('FL0017', 79.13, 0, 176999.17, 62585.15, 3.48, 4127.50, 98.92, 114414.02, 3, 'Route C', 'Morning'),
('FL0018', 85.74, 4, 178448.64, 145830.22, 4.36, 4882.76, 84.08, 32618.42, 4, 'Route D', 'Morning'),
('FL0019', 82.96, 3, 110676.22, 84871.82, 4.48, 4079.60, 68.95, 25804.40, 1, 'Route A', 'Afternoon'),
('FL0020', 78.74, 3, 183165.51, 131042.77, 3.48, 5625.93, 92.87, 52122.75, 4, 'Route B', 'Afternoon'),
('FL0021', 88.36, 3, 177639.27, 53325.60, 3.76, 2258.53, 73.80, 124313.66, 1, 'Route A', 'Afternoon'),
('FL0022', 74.18, 3, 190345.25, 79362.47, 4.07, 4238.11, 73.90, 110982.78, 1, 'Route A', 'Evening'),
('FL0023', 78.76, 3, 167801.10, 113941.47, 3.99, 5289.65, 61.27, 53859.63, 10, 'Route A', 'Morning'),
('FL0024', 80.99, 2, 150348.24, 46602.37, 3.78, 6822.26, 81.95, 103745.87, 6, 'Route A', 'Morning'),
('FL0025', 83.68, 1, 137102.99, 45929.45, 3.60, 4167.66, 81.38, 91173.54, 5, 'Route C', 'Evening'),
('FL0026', 93.56, 3, 105842.41, 146344.42, 3.20, 3065.48, 74.24, -40502.01, 11, 'Route C', 'Afternoon'),
('FL0027', 75.99, 0, 191020.02, 115751.41, 3.11, 2609.60, 95.77, 75268.60, 4, 'Route A', 'Evening'),
('FL0028', 85.43, 0, 196049.58, 34928.10, 4.92, 9524.25, 65.15, 161121.47, 11, 'Route B', 'Evening'),
('FL0029', 87.77, 0, 92588.15, 77858.51, 4.69, 5333.11, 73.20, 14729.64, 3, 'Route D', 'Evening'),
('FL0030', 71.39, 0, 95804.58, 82022.49, 3.71, 6649.30, 72.86, 13782.09, 1, 'Route B', 'Morning'),
('FL0031', 88.23, 2, 122842.06, 119285.12, 4.91, 9353.41, 63.69, 3556.95, 6, 'Route B', 'Evening'),
('FL0032', 75.12, 0, 117263.62, 60103.26, 4.35, 2661.99, 79.25, 57160.36, 2, 'Route B', 'Morning'),
('FL0033', 71.95, 3, 199168.62, 52120.04, 3.97, 9013.29, 87.51, 147048.58, 8, 'Route A', 'Morning'),
('FL0034', 98.47, 4, 76388.79, 39704.76, 3.99, 6412.70, 80.47, 36684.03, 10, 'Route C', 'Morning'),
('FL0035', 98.97, 0, 52711.30, 81397.74, 3.17, 3318.67, 66.28, -28686.43, 5, 'Route B', 'Afternoon'),
('FL0036', 94.25, 2, 124084.06, 112619.99, 3.18, 5290.04, 75.09, 11464.07, 7, 'Route A', 'Morning'),
('FL0037', 79.14, 2, 76823.41, 36983.23, 4.20, 8220.82, 60.10, 39840.17, 10, 'Route B', 'Morning'),
('FL0038', 72.93, 0, 104970.32, 139825.65, 4.11, 5842.96, 94.73, -34855.33, 2, 'Route B', 'Afternoon'),
('FL0039', 90.53, 4, 161625.58, 83082.27, 3.43, 9882.29, 63.38, 78543.31, 8, 'Route A', 'Morning'),
('FL0040', 83.20, 0, 158140.99, 58774.48, 4.89, 5013.91, 83.89, 99366.51, 2, 'Route C', 'Evening'),
('FL0041', 73.66, 2, 96209.12, 41264.79, 4.56, 7996.63, 99.45, 54944.32, 4, 'Route C', 'Evening'),
('FL0042', 84.86, 1, 131381.03, 51943.92, 3.23, 5143.92, 81.46, 79437.11, 1, 'Route D', 'Morning'),
('FL0043', 71.03, 3, 126322.11, 142153.68, 4.86, 8633.31, 96.96, -15831.57, 5, 'Route A', 'Afternoon'),
('FL0044', 97.28, 2, 145449.89, 106592.47, 4.95, 6552.65, 69.44, 38857.42, 9, 'Route D', 'Evening'),
('FL0045', 77.76, 0, 87569.27, 92003.55, 4.99, 2508.09, 90.40, -4434.28, 1, 'Route D', 'Afternoon'),
('FL0046', 89.88, 3, 138480.63, 108853.36, 3.11, 2294.57, 81.25, 29627.27, 9, 'Route D', 'Afternoon'),
('FL0047', 79.35, 0, 196833.93, 82280.75, 4.47, 3070.82, 88.82, 114553.18, 11, 'Route C', 'Evening'),
('FL0048', 85.60, 0, 123011.32, 117604.72, 4.09, 2109.38, 62.49, 5406.60, 8, 'Route A', 'Afternoon'),
('FL0049', 86.40, 1, 185914.82, 35725.94, 4.41, 2602.87, 65.91, 150188.88, 6, 'Route D', 'Evening'),
('FL0050', 75.55, 3, 115159.15, 97924.47, 4.94, 7533.72, 65.32, 17234.69, 7, 'Route A', 'Afternoon'),
('FL0051', 99.09, 3, 102511.76, 49037.57, 4.38, 6274.77, 87.49, 53474.19, 3, 'Route A', 'Evening'),
('FL0052', 93.25, 1, 146765.50, 44419.76, 4.67, 7999.29, 93.78, 102345.75, 1, 'Route C', 'Morning'),
('FL0053', 98.18, 2, 150338.61, 71025.56, 4.73, 9305.33, 89.98, 79313.05, 5, 'Route D', 'Evening'),
('FL0054', 96.84, 0, 179625.13, 41015.89, 4.68, 6681.20, 61.22, 138609.25, 2, 'Route D', 'Evening'),
('FL0055', 87.94, 4, 84527.79, 41298.84, 3.85, 7808.97, 94.69, 43228.95, 5, 'Route A', 'Evening'),
('FL0056', 97.66, 0, 124879.01, 67369.60, 3.45, 8056.65, 74.17, 57509.41, 8, 'Route B', 'Evening'),
('FL0057', 72.65, 0, 135800.63, 147541.26, 3.79, 5022.80, 75.89, -11740.63, 11, 'Route C', 'Afternoon'),
('FL0058', 75.88, 2, 165283.10, 51039.63, 4.78, 3928.68, 64.19, 114243.47, 9, 'Route C', 'Morning'),
('FL0059', 71.36, 0, 56540.57, 32059.33, 3.29, 3640.36, 89.50, 24481.23, 2, 'Route C', 'Evening'),
('FL0060', 79.76, 1, 199182.58, 121603.73, 4.03, 4011.54, 67.29, 77578.85, 3, 'Route C', 'Afternoon'),
('FL0061', 81.66, 1, 120491.68, 126829.56, 3.47, 4197.85, 82.56, -6337.88, 3, 'Route D', 'Morning'),
('FL0062', 78.14, 3, 91934.05, 71556.52, 4.16, 3657.82, 93.63, 20377.53, 1, 'Route D', 'Morning'),
('FL0063', 94.86, 4, 182524.10, 85760.86, 4.73, 9025.77, 63.57, 96763.25, 8, 'Route B', 'Morning'),
('FL0064', 80.70, 0, 162157.82, 107972.84, 4.76, 8055.99, 81.41, 54184.97, 6, 'Route C', 'Morning'),
('FL0065', 78.43, 0, 192960.78, 35767.07, 3.47, 2375.17, 69.33, 157193.71, 8, 'Route C', 'Evening'),
('FL0066', 86.28, 2, 99612.55, 143897.49, 4.82, 4149.38, 73.72, -44284.94, 11, 'Route A', 'Evening'),
('FL0067', 74.23, 1, 132914.75, 136401.65, 4.18, 2177.48, 78.96, -3486.90, 9, 'Route D', 'Afternoon'),
('FL0068', 94.07, 4, 135843.87, 61307.23, 3.70, 5985.32, 74.20, 74536.64, 5, 'Route C', 'Afternoon'),
('FL0069', 72.24, 3, 197049.74, 31836.54, 4.42, 5809.69, 85.95, 165213.19, 3, 'Route B', 'Afternoon'),
('FL0070', 99.61, 1, 61301.94, 142012.36, 3.96, 8650.97, 79.18, -80710.42, 5, 'Route B', 'Morning'),
('FL0071', 93.17, 3, 95854.55, 90124.79, 3.76, 4462.22, 83.37, 5729.77, 5, 'Route D', 'Morning'),
('FL0072', 75.96, 2, 78636.65, 94725.29, 4.41, 8531.09, 89.47, -16088.64, 5, 'Route B', 'Evening'),
('FL0073', 70.17, 2, 90271.23, 112075.65, 3.50, 9743.79, 82.31, -21804.42, 3, 'Route B', 'Morning'),
('FL0074', 94.46, 0, 122791.98, 103902.14, 3.66, 2707.27, 83.46, 18889.84, 11, 'Route D', 'Morning'),
('FL0075', 91.21, 4, 105903.03, 143266.99, 3.87, 8334.54, 82.58, -37363.96, 10, 'Route C', 'Morning'),
('FL0076', 91.87, 3, 109203.72, 143310.19, 3.51, 6719.65, 75.15, -34106.47, 4, 'Route C', 'Afternoon'),
('FL0077', 93.14, 1, 176631.97, 134063.87, 3.81, 5840.37, 73.50, 42568.10, 9, 'Route B', 'Afternoon'),
('FL0078', 72.22, 2, 189502.53, 106368.43, 4.14, 5364.29, 95.99, 83134.09, 10, 'Route B', 'Evening'),
('FL0079', 80.75, 0, 60562.42, 126113.92, 4.48, 8277.35, 84.30, -65551.50, 9, 'Route C', 'Morning'),
('FL0080', 73.48, 0, 81337.81, 111260.20, 4.53, 7114.89, 69.77, -29922.39, 2, 'Route D', 'Morning'),
('FL0081', 95.89, 3, 150671.53, 98804.05, 4.65, 8440.36, 79.93, 51867.48, 8, 'Route B', 'Evening'),
('FL0082', 88.70, 2, 103797.02, 45420.04, 4.49, 9225.21, 73.21, 58376.97, 8, 'Route A', 'Morning'),
('FL0083', 79.93, 4, 88124.55, 127344.50, 4.36, 6938.11, 97.35, -39219.95, 7, 'Route D', 'Morning'),
('FL0084', 71.91, 2, 94293.59, 128476.74, 3.48, 9843.70, 60.30, -34183.15, 8, 'Route B', 'Afternoon'),
('FL0085', 79.33, 3, 98382.61, 105112.76, 3.80, 6864.70, 69.01, -6730.15, 3, 'Route B', 'Evening'),
('FL0086', 79.76, 3, 177300.47, 128451.22, 3.96, 7093.15, 74.61, 48849.25, 6, 'Route A', 'Evening'),
('FL0087', 91.89, 2, 70493.20, 108178.17, 3.17, 6438.52, 79.51, -37684.97, 1, 'Route A', 'Evening'),
('FL0088', 89.13, 3, 156336.65, 54802.12, 4.06, 2728.02, 94.03, 101534.53, 7, 'Route C', 'Evening'),
('FL0089', 96.62, 2, 132923.00, 62875.34, 3.87, 7811.18, 63.52, 70047.66, 1, 'Route D', 'Afternoon'),
('FL0090', 84.17, 1, 94476.52, 55750.69, 4.60, 6379.57, 92.23, 38725.83, 9, 'Route D', 'Afternoon'),
('FL0091', 73.59, 2, 112967.13, 75271.09, 4.96, 5607.28, 62.23, 37696.04, 1, 'Route C', 'Morning'),
('FL0092', 91.40, 2, 88431.04, 34675.58, 4.11, 9283.77, 93.69, 53755.47, 1, 'Route D', 'Morning'),
('FL0093', 92.82, 3, 141727.06, 104190.47, 3.65, 4383.68, 62.07, 37536.59, 7, 'Route D', 'Morning'),
('FL0094', 86.84, 3, 62239.13, 70386.51, 3.09, 6188.82, 60.73, -8147.38, 2, 'Route D', 'Morning'),
('FL0095', 93.13, 0, 50777.73, 108686.72, 4.85, 7581.13, 87.88, -57908.99, 5, 'Route D', 'Afternoon'),
('FL0096', 84.81, 0, 144184.16, 76247.59, 4.84, 8371.77, 99.89, 67936.57, 8, 'Route D', 'Evening'),
('FL0097', 85.68, 1, 79141.09, 111793.64, 3.51, 5674.77, 95.86, -32652.55, 8, 'Route A', 'Afternoon'),
('FL0098', 82.83, 0, 60641.14, 70874.95, 4.39, 8736.73, 83.04, -10233.81, 3, 'Route D', 'Morning'),
('FL0099', 70.76, 2, 109517.57, 61283.34, 3.15, 8151.34, 96.70, 48234.23, 7, 'Route A', 'Afternoon'),
('FL0100', 73.24, 3, 57615.28, 89524.49, 3.33, 2529.89, 60.21, -31909.21, 3, 'Route D', 'Evening');


-- 3. Analytics Queries
-- --------------------------------

-- Descriptive Statistics
SELECT 
    AVG(On_Time_Performance) AS Avg_On_Time_Performance,
    AVG(Cancellations) AS Avg_Cancellations,
    AVG(Revenue) AS Avg_Revenue,
    AVG(Costs) AS Avg_Costs,
    AVG(Customer_Satisfaction) AS Avg_Customer_Satisfaction,
    AVG(Fuel_Consumption) AS Avg_Fuel_Consumption,
    AVG(Staff_Efficiency) AS Avg_Staff_Efficiency,
    AVG(Profit) AS Avg_Profit
FROM 
    Airline_Operations;

-- Correlation Analysis (Approximate)
SELECT 
    ROUND(CORR(On_Time_Performance, Fuel_Consumption), 2) AS Corr_OnTime_Fuel,
    ROUND(CORR(On_Time_Performance, Staff_Efficiency), 2) AS Corr_OnTime_Staff,
    ROUND(CORR(Customer_Satisfaction, On_Time_Performance), 2) AS Corr_CustSat_OnTime
FROM 
    Airline_Operations;

-- Clustering-like Segmentation (using CASE statements for simplicity)
SELECT 
    CASE 
        WHEN Customer_Satisfaction >= 4.5 AND On_Time_Performance >= 90 THEN 'High Satisfaction, High On-Time'
        WHEN Customer_Satisfaction < 4.5 AND On_Time_Performance >= 90 THEN 'Moderate Satisfaction, High On-Time'
        ELSE 'Low Satisfaction or Low On-Time'
    END AS Customer_Segment,
    COUNT(*) AS Num_Customers
FROM 
    Airline_Operations
GROUP BY 
    Customer_Segment;

-- Monthly Operational Cost Trends
SELECT 
    Month_Index, SUM(Costs) AS Total_Costs
FROM 
    Airline_Operations
GROUP BY 
    Month_Index
ORDER BY 
    Month_Index;

-- Summary & Recommendations (as comments)
-- ----------------------------------------
-- 1. Optimize flight schedules for routes with frequent delays.
-- 2. Implement fuel efficiency programs, especially on high-consumption routes.
-- 3. Tailor loyalty programs based on customer segmentation.
-- 4. Rationalize unprofitable routes.
-- 5. Invest in staff training to improve efficiency.
-- 6. Regularly monitor operations and adjust based on real-time data.
-- 7. Adopt advanced predictive models for cost forecasting.


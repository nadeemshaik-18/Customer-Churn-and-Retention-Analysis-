CREATE TABLE CustomerData (
    CustomerID VARCHAR(10),
    StartDate DATE,
    EndDate DATE,
    UsageFrequency INT,
    AvgSessionDuration INT,
    FeedbackScore INT,
    Age INT,
    Gender VARCHAR(10),
    Location VARCHAR(50)
);

-- 1) Calculate Subscription Duration:
SET SQL_SAFE_UPDATES = 0;
UPDATE CustomerData
SET SubscriptionDuration = DATEDIFF(IFNULL(EndDate, CURDATE()), StartDate);
SET SQL_SAFE_UPDATES = 1;

-- 2) Categorize Usage Frequency
UPDATE CustomerData
SET UsageCategory = CASE
    WHEN UsageFrequency >= 5 THEN 'High'
    WHEN UsageFrequency BETWEEN 3 AND 4 THEN 'Medium'
    ELSE 'Low'
END;
SET SQL_SAFE_UPDATES = 1;

-- 3) Calculate Customer Lifetime Value (CLTV):
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE CustomerData
ADD CLTV INT;
UPDATE CustomerData
SET CLTV = AvgSessionDuration * UsageFrequency * 10;
SET SQL_SAFE_UPDATES = 1;

-- 4) Analyze Customer Churn:
ALTER TABLE CustomerData
ADD IsChurned VARCHAR(10);
SET SQL_SAFE_UPDATES = 0;
UPDATE CustomerData
SET IsChurned = CASE
    WHEN EndDate IS NOT NULL AND EndDate < CURDATE() THEN 'Yes'
    WHEN EndDate IS NULL THEN 'No'
    ELSE 'No'
END;
SET SQL_SAFE_UPDATES = 1;

-- 5) Churn Rate
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM CustomerData) AS ChurnRate
FROM CustomerData
WHERE IsChurned = 'Yes';

-- 6) Average Subscription Duration
SELECT AVG(SubscriptionDuration) AS AvgSubscriptionDuration
FROM CustomerData;

-- 7) Average Customer Lifetime Value
SELECT AVG(CLTV) AS AvgCLTV
FROM CustomerData;

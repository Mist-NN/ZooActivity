USE zooactivity5;

-- 1. Query the number of customers for the corresponding activity for each animal
SELECT
    a.Species,
    COUNT(DISTINCT c.CustomerID) AS CustomerCount
FROM
    Animal a
        JOIN AnimalDetails ad ON a.Species = ad.Species
        JOIN Activity_Animal aa ON ad.AnimalID = aa.AnimalID
        JOIN Activity act ON aa.ActivityID = act.ActivityID
        JOIN Customer c ON act.ActivityID = c.ActivityID
GROUP BY
    a.Species
ORDER BY
    CustomerCount DESC;
    
-- 2. Query the number of activities the feeder is responsible for and the number of visitors participating in the activities
-- Update the employee salary based on this
WITH ActivityCount AS (
    SELECT
        f.FeederID,
        f.FeederName,
        COUNT(DISTINCT a.ActivityID) AS ActivityCount,
        COUNT(c.CustomerID) AS TotalVisitors,
        f.Salary AS OriginalSalary
    FROM
        Feeder f
        LEFT JOIN Activity a ON f.FeederID = a.FeederID
        LEFT JOIN Customer c ON a.ActivityID = c.ActivityID
    GROUP BY
        f.FeederID, f.FeederName, f.Salary
)
SELECT
    ac.FeederID,
    ac.FeederName,
    ac.ActivityCount,
    ac.TotalVisitors,
    ac.OriginalSalary,
    ac.OriginalSalary+(ac.ActivityCount * 100)+CASE WHEN ac.TotalVisitors = (SELECT MAX(TotalVisitors) FROM ActivityCount) THEN 200 ELSE 0 END AS UpdatedSalary
FROM
    ActivityCount ac
ORDER BY
    ac.FeederID;

    
-- 3. Query all carnivore feeders, showing the total number of animals and activities they are responsible for
-- in order of workload (animals + activities) from largest to smallest
SELECT
	f.FeederID,
	f.FeederName,
	COUNT(DISTINCT ad.AnimalID) AS AnimalCount,
	COUNT(DISTINCT a.ActivityID) AS ActivityCount,
	COUNT(DISTINCT ad.AnimalID) + COUNT(DISTINCT a.ActivityID) AS totalcount
FROM
	Feeder f
LEFT JOIN
AnimalDetails ad ON f.FeederID = ad.FeederID
JOIN
Animal an ON ad.Species = an.Species AND an.Diet = 'Carnivore'
LEFT JOIN
Activity a ON f.FeederID = a.FeederID
GROUP BY
f.FeederID, f.FeederName
ORDER BY
COUNT(DISTINCT ad.AnimalID) + COUNT(DISTINCT a.ActivityID) DESC;
    
-- 4. Query the health assessment information of the participating animals and select the unhealthy animals and the ones that can be used as substitutes
SELECT
    a.ActivityID,
    ad.AnimalID AS Non_healthy_animal_id,
    ad.AnimalName AS Non_healthy_animal_name,
    aas.HealthStatus,
    (SELECT GROUP_CONCAT(healthy_ad.AnimalID)
     FROM AnimalDetails healthy_ad
              JOIN AnimalAssessments healthy_aas ON healthy_ad.AnimalID = healthy_aas.AnimalID
              JOIN Animal an ON healthy_ad.Species = an.Species
     WHERE healthy_aas.HealthStatus = 'Healthy'
       AND healthy_ad.Species = ad.Species
       AND healthy_ad.AnimalID NOT IN (SELECT AnimalID FROM Activity_Animal WHERE ActivityID = a.ActivityID)
    ) AS Replaceable_animals
FROM
    Activity a
	JOIN
    Activity_Animal aa ON a.ActivityID = aa.ActivityID
	JOIN
    AnimalDetails ad ON aa.AnimalID = ad.AnimalID
	JOIN
    AnimalAssessments aas ON ad.AnimalID = aas.AnimalID
WHERE
    aas.HealthStatus!= 'Healthy'
    AND
    a.ActivityStatus = 'Open';


-- 5. Query the work of each veterinarian for six months, and count the number of healthy and unhealthy animals assessed by veterinarians respectively
-- Assuming the current date is 2024-12-01 for the purpose of this query
SELECT 
    V.VeterinarianID,
    V.VeterinarianName,
    -- Using COALESCE(), the NULL value is converted to the value 0
    COALESCE((SELECT 
    COUNT(*) 
    FROM 
    AnimalAssessments AA 
    WHERE 
    AA.VeterinarianID = V.VeterinarianID AND AA.HealthStatus = 'Healthy' AND AA.AssessmentDate >= '2024-06-01'), 0) AS HealthyAnimalsAssessed,
    COALESCE((SELECT
    COUNT(*)
    FROM
    AnimalAssessments AA 
    WHERE
    AA.VeterinarianID = V.VeterinarianID AND AA.HealthStatus!= 'Healthy' AND AA.AssessmentDate >= '2024-06-01'), 0) AS UnHealthyAnimalsAssessed
FROM
Veterinarian V
ORDER BY
V.VeterinarianID;

-- 6. Check the number of people who can register for all open activities and the corresponding activity information (activity name, id, participating animal species, suitable age, start time and end time)-- 
SELECT 
    a.ActivityID,
    a.ActivityName,
    a.AgeGroup,
    a.Species,
    a.starttime,
    a.endtime,
    a.MaxParticipants - (SELECT COUNT(*) FROM Customer c 
		WHERE c.ActivityID = a.ActivityID) AS AvailableSlots
FROM 
    Activity a
WHERE 
    a.ActivityStatus = 'Open'
GROUP BY 
    a.ActivityID, a.ActivityName, a.Species;
    

-- 7. The names of the animals whose Health status was checked the most frequently between July and November and the names of their keepers.
SELECT am.animalid, am.AnimalName, f.feederid, f.FeederName, health_counts.healthycount
FROM (
    SELECT aa.AnimalID, COUNT(*) AS HealthyCount
    FROM AnimalAssessments aa
    WHERE aa.HealthStatus like 'Hea%'
    AND aa.AssessmentDate between  '2024-07-01' and '2024-11-01' 
    GROUP BY aa.AnimalID
) AS health_counts
JOIN AnimalDetails am ON health_counts.AnimalID = am.AnimalID
JOIN Feeder f ON am.FeederID = f.FeederID
ORDER BY health_counts.HealthyCount DESC
LIMIT 1;


-- 8. Check the income, id and price of activities with more than 5 participants in November
SELECT 
    Activity.ActivityID,
    Activity.Price,
    COUNT(Customer.CustomerID) AS NumberOfParticipants,
    Activity.Price * COUNT(Customer.CustomerID) AS TotalActivityRevenue
FROM 
    Activity
JOIN 
    Customer ON Activity.ActivityID = Customer.ActivityID
WHERE 
    Activity.StartTime BETWEEN '2024-11-01' AND '2024-12-01'
GROUP BY 
    Activity.ActivityID, Activity.Price
HAVING 
    COUNT(Customer.CustomerID) > 5;
   
   
-- 9. Check completed events The number of visitors per event and the number of animals involved
SELECT 
    a.ActivityID,
    a.ActivityName,
    a.ActivityType,
    COUNT(DISTINCT c.CustomerID) AS NumberOfParticipants,
    COUNT(DISTINCT aa.AnimalID) AS NumberOfAnimals 
FROM 
    Activity a
LEFT JOIN 
    Customer c ON a.ActivityID = c.ActivityID
LEFT JOIN 
    Activity_Animal aa ON a.ActivityID = aa.ActivityID
WHERE 
    a.ActivityStatus = 'Finished'
GROUP BY 
    a.ActivityID, a.ActivityName, a.ActivityType;


-- 10. Check the average rating and number of participants for each event, including only completed events
SELECT 
    a.ActivityID,
    a.ActivityName,
    AVG(c.Score) AS AverageScore,
    COUNT(DISTINCT c.CustomerID) AS NumberOfParticipants
FROM 
    Activity a
JOIN 
    Customer c ON a.ActivityID = c.ActivityID
WHERE 
    a.ActivityStatus = 'Finished'
GROUP BY 
    a.ActivityID, a.ActivityName
ORDER BY 
    AverageScore DESC;
    
-- 11. Calculate health statistics and average score of animals.
SELECT 
    ad.Species,
    COUNT(CASE WHEN a.HealthStatus = 'Healthy' THEN 1 END) AS HealthyCount,
    COUNT(CASE WHEN a.HealthStatus = 'Sub-Healthy' THEN 1 END) AS SubHealthyCount,
    COUNT(CASE WHEN a.HealthStatus = 'Disease' THEN 1 END) AS DiseaseCount,
    (COUNT(CASE WHEN a.HealthStatus = 'Healthy' THEN 1 END) * 10 +
     COUNT(CASE WHEN a.HealthStatus = 'Sub-Healthy' THEN 1 END) * 8 +
     COUNT(CASE WHEN a.HealthStatus = 'Disease' THEN 1 END) * 6) / 
    NULLIF(COUNT(*), 0) AS AverageScore
FROM 
    AnimalAssessments a
JOIN 
    AnimalDetails ad ON a.AnimalID = ad.AnimalID
WHERE 
    a.AssessmentDate >= NOW() - INTERVAL 6 MONTH
GROUP BY 
    ad.Species
ORDER BY 
    ad.Species;

-- 12. Query customer groups participating in each activity and their feedback.
SELECT 
    A.ActivityID,
    A.ActivityName,
    COUNT(DISTINCT C.CustomerID) AS TotalParticipants,
    AVG(C.Score) AS AverageScore,
    AVG(TIMESTAMPDIFF(MINUTE, A.StartTime, A.EndTime)) AS AverageDuration,
    GROUP_CONCAT(DISTINCT AA.AnimalID ORDER BY AA.AnimalID SEPARATOR ', ') AS AnimalsInActivity,
    COUNT(DISTINCT CASE WHEN C.CustomerAge < '13' THEN C.CustomerID END) AS ChildCount,
    COUNT(DISTINCT CASE WHEN C.CustomerAge BETWEEN '13' AND '17' THEN C.CustomerID END) AS StudentCount,
    COUNT(DISTINCT CASE WHEN C.CustomerAge BETWEEN '18' AND '64' THEN C.CustomerID END) AS AdultCount,
    COUNT(DISTINCT CASE WHEN C.CustomerAge >= '65' THEN C.CustomerID END) AS ElderCount
FROM 
    Activity A
LEFT JOIN 
    Customer C ON A.ActivityID = C.ActivityID
LEFT JOIN 
    Activity_Animal AA ON A.ActivityID = AA.ActivityID
GROUP BY 
    A.ActivityID, A.ActivityName
ORDER BY 
    A.ActivityID;

-- 13. Query activities suitable for children, with status "Open" and available slots.
SELECT 
    A.ActivityID,
    A.ActivityName,
    A.ActivityDescription,
    A.ActivityType,
    A.AgeGroup,
    A.Species,
    A.MaxParticipants - (SELECT COUNT(*) FROM Customer WHERE ActivityID = A.ActivityID) AS RemainingSlots,
    A.Price,
    A.Location,
    F.FeederName,
    (SELECT GROUP_CONCAT(DISTINCT AD.Species ORDER BY AD.Species SEPARATOR ', ') 
     FROM Activity_Animal AA
     JOIN AnimalDetails AD ON AA.AnimalID = AD.AnimalID
     WHERE AA.ActivityID = A.ActivityID) AS InvolvedAnimals
FROM 
    Activity A
LEFT JOIN 
    Feeder F ON A.FeederID = F.FeederID
WHERE 
    A.ActivityStatus = 'Open'
    AND A.AgeGroup = 'All Ages'
GROUP BY A.ActivityID
HAVING RemainingSlots > 0
ORDER BY 
    A.Price DESC, A.ActivityID;

-- 14. Query information about lions that do not meet weight standards.
SELECT 
    AD.AnimalID,
    AD.AnimalName,
    AD.Gender,
    AA.Weight,
    F.FeederID,
    F.FeederName,
    F.PhoneNumber AS FeederPhone,
    V.VeterinarianID,
    V.VeterinarianName,
    V.PhoneNumber AS VeterinarianPhone
FROM 
    AnimalDetails AD
JOIN 
    Animal A ON AD.Species = A.Species
JOIN 
    Feeder F ON AD.FeederID = F.FeederID
JOIN 
    AnimalAssessments AA ON AD.AnimalID = AA.AnimalID
JOIN 
    Veterinarian V ON AA.VeterinarianID = V.VeterinarianID
WHERE 
    A.Species = 'Lion'
    AND ((AD.Gender = 'F' AND (AA.Weight < 130 OR AA.Weight > 150)) OR
    (AD.Gender = 'M' AND (AA.Weight < 180 OR AA.Weight > 200)))
ORDER BY 
    AD.AnimalID;

-- 15. Query information about animals that share the same birthday.
SELECT 
    ad.AnimalName,
    ad.Species,
    ad.Gender,
    DATE_FORMAT(ad.Birthday, '%m-%d') AS Birthday,
    f.FeederName,
    f.PhoneNumber
FROM 
    AnimalDetails ad
JOIN 
    Feeder f ON ad.FeederID = f.FeederID
WHERE 
    (MONTH(ad.Birthday), DAY(ad.Birthday)) IN (
        SELECT 
            MONTH(Birthday), DAY(Birthday)
        FROM 
            AnimalDetails
        GROUP BY 
            MONTH(Birthday), DAY(Birthday)
        HAVING 
            COUNT(*) > 1
    )
ORDER BY 
    MONTH(ad.Birthday), DAY(ad.Birthday);
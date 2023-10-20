select * from Car_Prices_Poland;
ALTER TABLE Car_Prices_Poland DROP COLUMN generation_name;
ALTER TABLE Car_Prices_Poland DROP COLUMN vol_engine;
ALTER TABLE Car_Prices_Poland DROP COLUMN province;

CREATE TABLE YearGroups (
    YearGroup NVARCHAR(20),
    YearGroupCount INT
);

INSERT INTO YearGroups (YearGroup, YearGroupCount)
SELECT
    CASE
        WHEN year BETWEEN 1980 AND 2005 THEN 'old_gen'
        WHEN year BETWEEN 2006 AND 2015 THEN 'mid_gen'
        WHEN year BETWEEN 2016 AND 2023 THEN 'new_gen'
        ELSE 'other'
    END AS YearGroup,
    COUNT(*) AS YearGroupCount
FROM Car_Prices_Poland
GROUP BY
    CASE
        WHEN year BETWEEN 1980 AND 2005 THEN 'old_gen'
        WHEN year BETWEEN 2006 AND 2015 THEN 'mid_gen'
        WHEN year BETWEEN 2016 AND 2023 THEN 'new_gen'
        ELSE 'other'
    END;

	select * from YearGroups;
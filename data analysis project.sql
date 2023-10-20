select * from Car_Prices_Poland;
ALTER TABLE Car_Prices_Poland DROP COLUMN generation_name;
ALTER TABLE Car_Prices_Poland DROP COLUMN vol_engine;
ALTER TABLE Car_Prices_Poland DROP COLUMN province;
-- In the above steps, what I did was drop the columns that were redundant for this project.



-- Below I created the table below to split the cars into 4 categories each representing an era.
-- Depending on what year the car was made, it will be counted in the correct category.
-- This will show how many cars per era are present in this data set.
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

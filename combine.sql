-- combine --
-- multiple statements that are in a serializable transaction
-- Checks ElectedOffices for same PRIMARY KEY officeID
-- If no matching one found INSERT into EelectedOffices TABLE
-- if already exists then UPDATE table about that elected office

-- if not found insert new tuple with officeID with corresponding values in the ModifyElectedOffices with salary as 12345.67

-- if found update the tuple in ElectedOffices with that officeID using officeName, city, state values which appear in ModifyElectedOffices tuple also make salary NULL ADD

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE ElectedOffices eo 
SET officeName = meo.officeName, city = meo.city, state = meo.state, salary = 12345.67
FROM ModifyElectedOffices meo
WHERE eo.officeID = meo.officeID;
INSERT INTO ElectedOffices
SELECT meo.officeID, meo.officeName, meo.city, meo.state
FROM ModifyElectedOffices meo
WHERE NOT EXISTS (SELECT * 
    FROM ElectedOffices eo
    WHERE eo.officeID = meo.officeID);
COMMIT TRANSACTION;
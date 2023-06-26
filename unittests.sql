-- Violates Foreign Key contributions(contributorID) foreign key in Persons(personID)
INSERT INTO Contributions
VALUES(99, 1, 101, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 9999.99);

-- Violates Foreign Key Contributions(candidateID, officeId, electionDate) 
-- must be in CandidatesForOffice(candidateID, officeID, electionDate)
INSERT INTO CONTRIBUTIONS
VALUES(2, 1, 101, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 50000.00);

-- -- Violates Foreign Key OfficeHodlers(candidateID, officeID, electionDate)
INSERT INTO OfficeHolders
VALUES(1, 106, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 'A');




-- Contributions(contributorID, candidateID, officeID, electionDate, contribution)
-- Violates General Constraint Contributions( contributions > 0 )
UPDATE Contributions
    SET contribution = 0
    WHERE officeID = 101;
    
-- Does not violate General Constraint Contributions( contributions > 0 )
UPDATE Contributions
    SET contribution = 999999
    WHERE officeID = 101;
    
    
-- Elections(officeID, electionDate, officeStartDate, officeEndDate)
-- Violates General Constraint Elections(officeStartDate < officeEndDate)
UPDATE Elections
    SET officeStartDate = TO_DATE('31/05/2018', 'DD/MM/YYYY'), officeEndDate = TO_DATE('31/01/2018', 'DD/MM/YYYY')
    WHERE officeID = 101;
    
-- Does not violate General Constraint Elections(officeStartDate < officeEndDate)
UPDATE Elections
    SET officeStartDate = TO_DATE('01/01/2011', 'DD/MM/YYYY'), officeEndDate = TO_DATE('31/01/2018', 'DD/MM/YYYY')
    WHERE officeID = 101;



-- CandidatesForOffice(candidateID, officeID, electionDate, party, votes, totalContributions, wonElection)
-- Violates General Constraint CandidatesForOffice( if vote NULL then wonElection also NULL )
UPDATE CandidatesForOffice
    SET votes = NULL, wonElection = TRUE
    WHERE officeID = 101;
    
-- Does not violate General Constraint CandidatesForOffice( if vote NULL then wonElection also NULL )
UPDATE CandidatesForOffice
    SET votes = NULL, wonElection = NULL
    WHERE officeID = 101;

ALTER TABLE Contributions
ADD CONSTRAINT ContributionsToPersons FOREIGN KEY (contributorID)
REFERENCES Persons(personID)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE Contributions
ADD CONSTRAINT ContributionsToCFO FOREIGN KEY (candidateID, officeID, electionDate)
REFERENCES CandidatesForOffice(candidateID, officeID, electionDate)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;
    
ALTER TABLE OfficeHolders
ADD CONSTRAINT OfficeHoldersToCFO FOREIGN KEY  (candidateID, officeID, electionDate)
REFERENCES CandidatesForOffice(candidateID, officeID, electionDate)
    ON UPDATE RESTRICT
    ON DELETE CASCADE;
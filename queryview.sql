SELECT oh.candidateID, p.peronName, oh.officeID, oh.electionDate
FROM WronglyDeclaredWinnerView wdwv, OfficeHolders oh, Persons p
WHERE (wdwv.candidateID, wdwv.officeID, wdwv.electionDate) = (oh.candidateID, oh.officeID, oh.electionDate)
    AND oh.candidateID = p.personID;
    

UPDATE CandidatesForOffice
    SET wonElection = FALSE
    WHERE (candidateID, officeID, electionDate) = (9, 106, DATE '2005-05-15');
    
    
SELECT oh.candidateID, p.personName, oh.officeID, oh.electionDate
From WronglyDeclaredWinnerView wdwv, OfficeHolders oh, Persons p
WHERE(wdwv.candidateID, wdwv.officeID, wdwv.elctionDate) = (oh.candidateID, oh.officeID, oh.electionDate)
    AND oh.candidateID = p.personID;
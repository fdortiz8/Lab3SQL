-- if won election attribute is true = declared winner
-- if has the most votes than others in their election = most votes
-- wonElection is true but not most votes = wronglyDeclaredWinner

CREATE VIEW WronglyDeclaredWinnerView AS
SELECT cfo.candidateID, cfo.officeID, cfo.electionDate, COUNT(*) AS numCandidatesWithMoreVotes
FROM CandidatesForOffice cfo, CandidatesForOffice moreVotesCFO
WHERE cfo.wonElection = TRUE 
    AND cfo.officeId = moreVotesCFO.officeID
    AND cfo.electionDate = moreVotesCFO.electionDate
    AND cfo.votes < moreVotesCFO.votes
GROUP BY cfo.candidateID, cfo.officeID, cfo.electionDate
HAVING COUNT(*) >= 2;
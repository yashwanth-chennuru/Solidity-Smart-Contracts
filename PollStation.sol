//SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract PollStation{
    
    string[] public candidateName;
    mapping (string => uint256) voteCount;
    function addCandidates(string memory _candidateName) public {
        candidateName.push(_candidateName);
        voteCount[_candidateName]=0;
    }
     function retrieveCandidateNames() view public returns ( string[] memory ){
        return candidateName;
    }
 
    function doVote(string memory _candidateName) public{
        voteCount[_candidateName] += 1;

    }
    function retrieveNoOfVotes(string memory _candidateName) view public returns(uint256){
        return voteCount[_candidateName];
    }
}


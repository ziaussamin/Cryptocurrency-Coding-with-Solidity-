// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.2 <0.9.0;

/**
 * @title IssueTracker
 * @dev Store & retrieve issues with their descriptions and statuses
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract IssueTracker {
    struct issue {
        uint issueId;
        string description;
        string status;
    }
    mapping(uint => issue) private issueList;
    uint private issueIdCounter; 

    function addIssue(string memory _description, string memory _status, uint issue_id) external {
        issueList[issue_id] = issue(issue_id, _description, _status);
        issueIdCounter++;  // Increment the counter when adding an issue
    }

    function getTotalIssues() external view returns (uint) {
        return issueIdCounter;
    }

    function updateIssueStatus(uint issue_id, string memory _status) external {
        issue storage i = issueList[issue_id];
        i.status = _status;
    }

    function getIssue(uint issue_id) external view returns (uint, string memory, string memory) {
        issue memory i = issueList[issue_id];
        return (i.issueId, i.description, i.status);
    }
}





// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "./Hometask12.sol";

/**
 * @title Driver
 * @dev Interact with the IssueTracker contract to add, update, and retrieve issues
 */
contract Driver {
    IssueTracker private issueTracker;

    constructor(address _issueTrackerAddress) {
        issueTracker = IssueTracker(_issueTrackerAddress);
    }


    function addIssueToTracker(string memory _description, string memory _status, uint issue_id) external {
        issueTracker.addIssue(_description, _status, issue_id);
    }

    function updateIssueStatusInTracker(uint issue_id, string memory _status) external {
        issueTracker.updateIssueStatus(issue_id, _status);
    }

    function getIssue(uint issue_id) external view returns (uint, string memory, string memory) {
        return issueTracker.getIssue(issue_id);
    }

    function getTotalIssues() external view returns (uint) {
        return issueTracker.getTotalIssues();
    }
}

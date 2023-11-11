// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

struct Claim {
    uint256 id;
    uint256 policyId;
    uint256 amount;
    uint256 date;
    ClaimStatus status;
    bytes32 ipfsHash;
}

struct Policy {
    uint256 id;
    uint256 premium;
    uint256 coverageLimit;
    PolicyStatus status;
    bytes32 ipfsHash;
}

enum PolicyStatus {
    Active,
    Inactive
}

enum ClaimStatus {
    Pending,
    Accepted,
    Rejected,
    UnderDispute,
    DisputeApproved,
    DisputeRejected
}

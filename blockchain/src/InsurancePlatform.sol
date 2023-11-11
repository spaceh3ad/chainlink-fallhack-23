// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "./Library.sol";

contract InsurancePlatform {
    mapping(uint256 => Policy) public policies;
    mapping(uint256 => Claim) public claims;

    uint256 public policyCounter = 1;
    uint256 public claimCounter = 1;

    function createPolicy(Policy calldata _policy) public {
        policies[policyCounter] = _policy;
        policyCounter += 1;
    }

    function submitClaim(Claim calldata _claim) public {
        if (policies[_claim.policyId].status != PolicyStatus.Active) {
            revert("Policy is not active");
        }
        claims[claimCounter] = _claim;
        // claims[0] = Claim(0, _policyId, _amount, block.timestamp, 0);
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Vault} from "../src/Vault.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract CounterScript is Script {
    function setUp() public {
        Vault vault = new Vault(IERC20(address(0)));
        console2.log("Vault address: %s", address(vault));
    }

    function run() public {
        vm.broadcast();
    }
}

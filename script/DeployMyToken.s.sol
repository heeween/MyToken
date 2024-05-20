//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";

contract DeployMyToken is Script {
    uint256 initialSupply = 1000 ether;
    function run() external returns (MyToken) {
        console.log("msg.sender in Deploy   ", msg.sender);
        console.log("DeployMyToken          ", address(this));
        console.log("tx.origin              ", tx.origin);
        vm.startBroadcast();
        MyToken token = new MyToken(initialSupply);
        vm.stopBroadcast();
        address owner = token.getOwner();
        console.log("owner:                 ", owner);
        return token;
    }
}

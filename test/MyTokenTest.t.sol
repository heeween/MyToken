//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMyToken} from "../script/DeployMyToken.s.sol";
import {MyToken} from "../src/MyToken.sol";

contract MyTokenTest is Test {
    MyToken public myToken;
    DeployMyToken deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;
    function setUp() public {
        deployer = new DeployMyToken();
        console.log("msg.sender in Test     ", msg.sender);
        console.log("MyTokenTest            ", address(this));
        myToken = deployer.run();
        vm.prank(msg.sender);
        myToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(myToken.balanceOf(bob), STARTING_BALANCE);
    }

    function testAllowenceWorkWell() public {
        uint256 initialAllowence = 1000;
        uint256 transerAmout = 500;

        vm.prank(bob);
        myToken.approve(alice, initialAllowence);
        vm.prank(alice);
        myToken.transferFrom(bob, alice, transerAmout);
        assertEq(myToken.balanceOf(alice), transerAmout);
        assertEq(myToken.balanceOf(bob), STARTING_BALANCE - transerAmout);
    }

    function testTransfer() public {
        vm.prank(bob);
        myToken.transfer(alice, 100);
        assertEq(myToken.balanceOf(alice), 100);
    }
}

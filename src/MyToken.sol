//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address private owner;
    constructor(uint256 _initialSupply) ERC20("MyToken", "MT") {
        _mint(msg.sender, _initialSupply);
        owner = msg.sender;
    }
    function getOwner() public view returns (address) {
        return owner;
    }
}

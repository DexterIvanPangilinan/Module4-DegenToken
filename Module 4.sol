// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/access/Ownable.sol";


contract DexterCoin is ERC20, Ownable {

    constructor() ERC20("Degen", "DGN") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferTokens(address _receiver, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        transfer(_receiver, amount); 
    }

    function checkBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "You do not have enough Tokens");
        _burn(msg.sender, amount);
    }

    function gameStore() public pure returns (string memory) {
        return "1.  Robot value = 300 \n 2. Lego value = 250 \n 3. HotWheels value = 75";
    }

    function reedemTokens(uint256 choice) public  {
        require(choice <= 3, "The number that you input is not on the list");
        uint256 amount;

       if (choice == 1) {
            amount = 300;
            _burn(msg.sender,300);
        } else if (choice == 2) {
            amount = 250;
            _burn(msg.sender,250);
        } else {
            amount = 75;
            _burn(msg.sender,75);
        }

        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        transfer(owner(), amount); // 
    }
}
# Creating Avalanche
The tasks for this last module are Mint, Burn, Redeem, Transfer, and check balance of the users or player.

# GETTING STARTED
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., module4.sol). Copy and paste the following code into the file:

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

# AUTHOR
Dexter Ivan A. Pangilinan 
3.1 BSIT

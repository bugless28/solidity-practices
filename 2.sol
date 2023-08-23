// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the necessary interfaces and libraries
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Define your token contract, inheriting from ERC721 and Ownable
contract MyCollectible is ERC721Enumerable, Ownable {
    constructor() ERC721("MyCollectible", "MC") {
        // Mint the first collectible to the contract owner
        _mint(msg.sender, 1);
    }

    // Function to mint new collectibles, only callable by the owner
    function mint(address to, uint256 tokenId) public onlyOwner {
        _mint(to, tokenId);
    }
}
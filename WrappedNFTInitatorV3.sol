// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";


contract WrappedNFT is ERC20 {
    
    constructor (string memory name_,string memory symbol_) ERC20(name_,symbol_) {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals()))); 
    }
}


// This would be the NFTStaking contract with modiified version
contract WrappedNFTSwap {
    string public name;
    string public gender;
    address public wNFTAddress;

    constructor(string memory _name, string memory _gender) {
        name = _name;
        gender = _gender;
        
    }

    function returnWNFTAddress() public view returns(address)
    {
        return wNFTAddress;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    function getResult() public view returns(string memory){
      
      return name;
   }
}


contract WrappedNFTInitator{

    

    WrappedNFTSwap public wrappedNFTswap;
    WrappedNFT public wrappedNFT; 
    

    function createWrappedNFT(string memory _name, string memory _gender,string memory name_,string memory symbol_) public returns(WrappedNFTSwap) {
       wrappedNFT = new WrappedNFT(name_,symbol_);
       wrappedNFTswap = new WrappedNFTSwap(_name, _gender); // creating new contract inside another parent contract
       return wrappedNFTswap;
    }


    // Write function
    function setWrappedNFTName(string memory _name) public {
        wrappedNFTswap.setName(_name);
    }

    // Get function
    function getWrappedNFTName() public view returns(string memory){
      return wrappedNFTswap.getResult();
   }

   function getWrappedNFTAddress() public view returns(address)
   {
       return address(wrappedNFTswap);
   }

   function returnWrappedNFTBalance() public view returns(uint256)
   {
       return wrappedNFT.balanceOf(address(this));
   }
}


// Test git push
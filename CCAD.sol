// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract CCAD {

    string private      tokenName;
    string private      tokenSymbol;
    uint8 private       tokenDecimals;
    uint256 private     circulatingSupply;

    mapping (address => uint256) private accountBalances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor() {

        tokenName                   = "CCAD";
        tokenSymbol                 = "CCAD";
        tokenDecimals               = 18;
        accountBalances[msg.sender] = 0;

        emit Transfer(address(0), msg.sender, 0);

    }

    /*
    This function gets the current circulating supply of CCAD, this is not the absolute total.
    */
    function getCirculatingSupply() view external returns (uint256) {

        return circulatingSupply;
        
    }


    /*
    This function creates new CCAD and sends it to a certain address.
    */
    function mintCCADTo(address destination, uint256 value) public returns (bool) {

        emit Transfer(address(0), destination, value);

        return true;

    }


    /*
    This function should be executed when the accumulation period finishes. It sends CCAD to 
    account that meet the criteriea to recieve it (those who have invested).
    */
    function closeEscrow(address[] calldata addresses, uint256[] calldata values) external returns (bool) {

        for (uint i = 0; i < addresses.length; i++) {

            mintCCADTo(addresses[i], values[i]); //Minting CCAD to the accounts which need it

        }

        return true;

    }

}
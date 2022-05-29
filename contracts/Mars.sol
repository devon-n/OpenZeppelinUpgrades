//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


/* Transparent Proxy Contract */

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";


// contract Mars is Initializable, ERC20Upgradeable {
//     function initialize() public initializer {
//         __ERC20_init("Mars", "MARS");
//         _mint(msg.sender, 10000 * 10**18);
//     }
// }

/* UUPS Proxy Contract */

import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";


contract Mars is Initializable, ERC20Upgradeable, UUPSUpgradeable {
    function initialize() public initializer {
        __ERC20_init("Mars", "MARS");
        __Ownable_init();
        _mint(msg.sender, 10000 * 10**18);
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {

    }
}

contract MarsV2 is Mars {
    uint fee;

    function version() pure public returns (string memory) {
        return "v2";
    }
}

contract MarsV3 is Mars {
    uint fee;
    string tax;

    function version() pure public returns (string memory) {
        return "v3";
    }
}
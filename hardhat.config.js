require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/contracts-upgradeable");


module.exports = {
  solidity: "0.8.4",
  networks: {
    local: {
      url: "http://localhost:8545"
    }
  }
};

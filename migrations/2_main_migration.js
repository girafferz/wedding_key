var SimpleStore = artifacts.require("./SimpleStore.sol");
var Wedding = artifacts.require("./Wedding.sol");

module.exports = function(deployer) {
  deployer.deploy(SimpleStore);
  deployer.deploy(Wedding);
};

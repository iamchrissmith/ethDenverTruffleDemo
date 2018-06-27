const DenverToken = artifacts.require("DenverToken");

module.exports = function(deployer) {
  deployer.deploy(DenverToken);
};

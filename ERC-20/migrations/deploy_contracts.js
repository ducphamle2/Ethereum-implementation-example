const KimHaiToken = artifacts.require("./KimHaiToken.sol")

module.exports = function(deployer) {
    deployer.deploy(KimHaiToken);
};
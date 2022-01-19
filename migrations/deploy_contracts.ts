type Network = "development" | "kovan" | "mainnet";

module.exports = (artifacts: Truffle.Artifacts) => {
  return async (
    deployer: Truffle.Deployer
  ) => {
    const ERC1190Marketplace = artifacts.require("ERC1190Marketplace");

    // Deploying test contracts!
    deployer.deploy(ERC1190Marketplace);
  };
};

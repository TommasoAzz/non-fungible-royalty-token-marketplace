const tsNode = require("ts-node");
const dotenv = require("dotenv");
const HDWalletProvider = require("truffle-hdwallet-provider");

tsNode.register({
  files: true,
});

dotenv.config();

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
    },
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(
          process.env.MNEMONIC, 
          process.env.URL
        );
      },
      network_id: 4,
      gas: 6700000,
      gasPrice: 10000000000,
    }
  },
  mocha: {
  },
  compilers: {
    solc: {
      version: "0.8.11",
      settings: {
        optimizer: {
          enabled: true,
          runs: 2000
        }
      }
    }
  }
};

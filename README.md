# non-fungible-royalty-token-marketplace

A university project for implementing a marketplace of a slightly modified version of the ERC1190 proposal "Non-Fungible Royalty Token".

Made for the course "Blockchain and Cryptocurrencies", University of Bologna, A.Y. 2021/2022.

This is part of the parent repository [non-fungible-royalty-token](https://github.com/TommasoAzz/non-fungible-royalty-token).
Here are implemented a smart contract for managing `ERC1190` compliant collections inside a website mocking the famous [OpenSea](https://opensea.io/).

## Structure of the repository
You may find:

- the contracts inside the `contracts` folder,
- the documentation of the contracts inside `docs`,
- some tests inside `test`.

## Prerequisites and steps to work with this contracts (or continue to develop them!)
### Requirements

- [Node.js](https://nodejs.org/en/) (compulsory),
- [Truffle](https://trufflesuite.com/tutorial/index.html#setting-up-the-development-environment) (compulsory),
- a crypto wallet, we advise [MetaMask](https://metamask.io/) (compulsory),
- an [Infura](https://infura.io/) project set up (please refer to the following section) (compulsory if you want to deploy to an Ethereum network),
- [Ganache](https://trufflesuite.com/ganache/) (advised, but not required).

### Infura setup
Please register to the website of [Infura](https://infura.io/), log in and then create a new project selecting "Ethereum" as the product.
When created, please select your favourite Ethereum network (we used *Rinkeby*) and take note of the HTTPS endpoint.  
For Rinkeby it something like this: https://rinkeby.infura.io/v3/...
In the root folder of this repository create a file named `.env` and add the following content:
MNEMONIC=&lt;your-wallet-account-mnemonic&gt;
URL=&lt;the-url-you-copied-from-infura&gt;
NETWORK_ID=&lt;network-id&gt;

For the wallet account's mnemonic, please refer to [this guide from Metamask](https://metamask.zendesk.com/hc/en-us/articles/360015290032-How-to-reveal-your-Secret-Recovery-Phrase).
For the network id, which is an integer, please refer to [this source](https://besu.hyperledger.org/en/stable/Concepts/NetworkID-And-ChainID/).
  

### Initial setup

- `npm install`

If you want to use Ganache (as advised), please open it, press the button *Quickstart (Ethereum)* and, when loaded, click the *Settings* icon, visit the *Server* tab/page and ensure the port number under *Port number* is `8545` (otherwise the default configuration in `truffle-config.js` will not work).

If you do not want to use Ganache (not advised), please type the following command from within the project folder: `truffle develop`.
When it is loaded, please take note of the first row displayed. It should be "Truffle Develop started at http://127.0.0.1:.../".
Instead of the "..." you will find a port number, please check it is equal to that at line 11 of `truffle-config.js`. If it is not so, please update it.

### Other commands

- Compile the contracts: `npm run compile`
- Migrate the contracts on the development network (i.e., Ganache or Truffle): `npm run migrate`
- Migrate the contracts on a real Ethereum network (i.e., Rinkeby): `truffle migrate --reset --network ethnetwork`
- Generate **TypeScript** types: `npm run generate-types`
- Generate the documentation (based on **Solidity** comments): `npm run docs`

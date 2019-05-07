### General structure

Three major contracts are involved in the implementation of the Dapp, namely `ERC721Mintable.sol`, `Verifier.sol`, `SonlSquareVerifier.sol`. Other supportive contacts are also involved, mainly from the `OpenZeppellin` package. 

The top level contract is the `SonlSquareVerifier.sol` which extends the 



### Tips

To run the test ganache is invoked using the following commands (mnemonic words are not required)

```
ganache-cli -p 8545 -m 'candy maple cake sugar pudding cream honey rich smooth crumble sweet treat' -a 20
```

### Running Zokrates

Zokrates is invoked in docked with the following command. Replace the `<absolute path>`with your path to the project. 

```
docker run -v <absolute path>\Blockchain-Capstone\zokrates\code:/home/zokrates/cod
e  -ti zokrates/zokrates /bin/bash
```

Compile the program written in ZoKrates DSL

```
../../zokrates compile -i square.code
```

```
 ../../zokrates setup --proving-scheme pghr13
```

```
~/zokrates compute-witness -a 3 9 
```

```
~/zokrates generate-proof --proving-scheme pghr13
```

```
~/zokrates export-verifier --proving-scheme pghr13
```



### Testing

There are three files used for testing.  Running

```
truffle test
```

produces the following output:

```
 Contract: TestERC721Mintable
    match erc721 spec
      ✓ should return total supply
      ✓ should get token balance
      ✓ should return token uri
      ✓ should transfer token from one owner to another (57ms)
    have ownership properties
      ✓ should fail when minting when address is not contract owner
      ✓ should return contract owner

  Contract: TestSolnSquareVerifier
    Mint with square verifier
      ✓ Minting (2519ms)

  Contract: TestSquareVerifier
    Verify Tx
      ✓ Correct verification (1698ms)


  8 passing (8s)
```

### Deployment to Rinkeby

In order to deploy to Rinkeby test network, the `truffle-config.js` file has been appropriately modified. Then executing the command:

```
truffle migrate --reset --network
```

logs the output: 

```
Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.


Starting migrations...
======================
> Network name:    'rinkeby'
> Network id:      4
> Block gas limit: 0x6aea72


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > transaction hash:    0xe8f9457f71b5fdb5a1eb565fa4f268cfbb2dd458ab0d82aa2e479c0312128a99
   > Blocks: 2            Seconds: 23
   > contract address:    0x44AF111a91F63142893535C45476Eb0aB1AffE41
   > block number:        4334771
   > block timestamp:     1557151020
   > account:             0xefa409f8db2dCa2D0d8838ab72CBA15Ffc4e4026
   > balance:             1.987270104
   > gas used:            284908
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.00569816 ETH

   Pausing for 2 confirmations...
   ------------------------------
   > confirmation number: 1 (block: 4334774)
   > confirmation number: 2 (block: 4334775)

   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.00569816 ETH


2_deploy_contracts.js
=====================

   Deploying 'Verifier'
   --------------------
   > transaction hash:    0xffa4e38f408f038b5f322c5ff4cb3bdeee7862539f4d453497037b1ce0565d76
   > Blocks: 4            Seconds: 65
   > contract address:    0x86d86048A1E13D5A113c3742a4A67b2D5dDFEF14
   > block number:        4334783
   > block timestamp:     1557151200
   > account:             0xefa409f8db2dCa2D0d8838ab72CBA15Ffc4e4026
   > balance:             1.950767884
   > gas used:            1783077
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.03566154 ETH

   Pausing for 2 confirmations...
   ------------------------------
   > confirmation number: 1 (block: 4334787)
   > confirmation number: 2 (block: 4334788)

   Deploying 'SolnSquareVerifier'
   ------------------------------
   > transaction hash:    0x917a1dc3218941a705bb11d8aad3cdc3b5e72e0931d9c425375b55f56a44784b
   > Blocks: 2            Seconds: 45
   > contract address:    0xEd7c77c20bEf51817e48D187777DFfeA042786A3
   > block number:        4334791
   > block timestamp:     1557151320
   > account:             0xefa409f8db2dCa2D0d8838ab72CBA15Ffc4e4026
   > balance:             1.862426744
   > gas used:            4417057
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.08834114 ETH

   Pausing for 2 confirmations...
   ------------------------------
   > confirmation number: 1 (block: 4334795)
   > confirmation number: 2 (block: 4334796)

   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.12400268 ETH


Summary
=======
> Total deployments:   3
> Final cost:          0.12970084 ETH
```



## Project Review prerequisites

### Project Deliverables



| CRITERIA | MEETS SPECIFICATIONS                                         |
| :------- | :----------------------------------------------------------- |
| Write Up | Student includes a README to explain how to test their code. |
| Write Up | Student provides Contract Addresses, Contract Abi's, OpenSea MarketPlace Storefront link's. |

This file provides the information on how to test the code

The required links are summarized as:

- **Contract address:**
- ABI: Abi is part of the file and is copied for conveniece in the abi.json file
- **OpenSea Marketplace:** 



### ERC721

| CRITERIA                                     | MEETS SPECIFICATIONS                                         |
| :------------------------------------------- | :----------------------------------------------------------- |
| ERC721 Mintable Contract                     | Student completes the boilerplate ERC721 Mintable Contract in `ERC721Mintable.sol` |
| ERC721 Mintable Contract Test Cases          | Student writes and passes the test cases in `TestERC721Mintable.js` |
| ERC721 Mintable Contract Zokrates Test       | Student writes and passes the test cases in `TestSquareVerifier.js` |
| ERC721 Mintable Contract Zokrates Test Cases | Student writes and passes the test cases in `TestSolnSquareVerifier.js` |

- `ERC721Mintable.sol` is complete
- `TestERC721Mintable.js` test cases are written and passed as shown earlier
- `TestSquareVerifier.js` test cases are written and passed
- `TestSolnSquareVerifier.js` test cases are written and passed

### Zokrates

| CRITERIA                           | MEETS SPECIFICATIONS                                         |
| :--------------------------------- | :----------------------------------------------------------- |
| Zokrates program written using DSL | Student completes the Zokrates proof in square.code by adding the variable names in `square.code` |
| Zokrates Test Cases                | Student completes test contract in `SolnSquareVerifier.sol`  |
| Zokrates Test Cases                | Student writes and passes the test cases in `TestSolnSquareVerifier.js` |

- Variables in `square.code` are replaced
- `SolnSquareVerifier.sol` is complete
- `TestSolnSquareVerifier.js` is implemented and passes the test cases



## OpenSea Marketplace



| CRITERIA     | MEETS SPECIFICATIONS                                         |
| :----------- | :----------------------------------------------------------- |
| Market Place | Student list ERC721/ ZoKrates tokens & complete transactions on market place |

- Market Place is is completed in OpenSea in the address: 



## Deployment



| CRITERIA   | MEETS SPECIFICATIONS                                        |
| :--------- | :---------------------------------------------------------- |
| Deployment | Student deploys ERC721 contracts with Zokrates integration. |

- ERC721 contracts with Zokrates integration are deployed on Rinkeby





## notes 

<https://rinkeby.etherscan.io/address/0xEd7c77c20bEf51817e48D187777DFfeA042786A3>

<https://rinkeby.opensea.io/get-listed/step-two>





## References

- Student hub
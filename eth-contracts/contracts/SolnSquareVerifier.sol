pragma solidity ^0.5.2;

// define a contract call to the zokrates generated solidity contract <Verifier> or <renamedVerifier>

import './ERC721Mintable.sol';
// import './Verifier.sol';
// define another contract named SolnSquareVerifier that inherits from your ERC721Mintable class
contract SolnSquareVerifier is HomeERC721Token {

    Verifier verifier;

    // define a solutions struct that can hold an index & an address
    struct Solution{
        uint256 index;
        address addrSolution;
    }

    // define an array of the above struct
    Solution[] private _solutions;

    // define a mapping to store unique solutions submitted
    mapping(bytes32 => Solution) private _uniqueSolutions;

    // Create an event to emit when a solution is added
    event SolutionAdded(address addr);


    constructor
                    (
                    address verifierAddress
                    )
                    public
    {
        verifier = Verifier(verifierAddress);
    }




     // Create a function to add the solutions to the array and emit the event
    function addSolution
                            (
                                bytes32 solutionId,
                                uint256 tokenId,
                                address addrSolution
                            )
                            public
    {
        _solutions.push(Solution({ index: tokenId, addrSolution:addrSolution }));
        _uniqueSolutions[solutionId] = Solution({ index: tokenId, addrSolution:addrSolution });
        emit SolutionAdded(addrSolution);
    }


// Create a function to mint new NFT only after the solution has been verified
//  - make sure the solution is unique (has not been used before)
//  - make sure you handle metadata as well as tokenSupply
    function mintNFT
                        (
                            address to,
                            uint256 tokenId,
                            uint[2] memory a,
                            uint[2] memory a_p,
                            uint[2][2] memory b,
                            uint[2] memory b_p,
                            uint[2] memory c,
                            uint[2] memory c_p,
                            uint[2] memory h,
                            uint[2] memory k,
                            uint[2] memory input
                        )
                        public
 //                       returns(bool)
    {
        bytes32 solutionId = getSolutionId(a, a_p, b, b_p, c, c_p, h, k, input);
        require(_uniqueSolutions[solutionId].addrSolution == address(0), "mintNFT: Solution already exists!");
        require(verifier.verifyTx(a, a_p, b, b_p, c, c_p, h, k, input), "mintNFT: Solution not verified");

        addSolution(solutionId, tokenId, to);
        mint(to, tokenId);
    }


    function getSolutionId
                    (
                        uint[2] memory a,
                        uint[2] memory a_p,
                        uint[2][2] memory b,
                        uint[2] memory b_p,
                        uint[2] memory c,
                        uint[2] memory c_p,
                        uint[2] memory h,
                        uint[2] memory k,
                        uint[2] memory input
                    )
                    private
                    pure
                    returns(bytes32)
    {
        return keccak256(abi.encodePacked(a, a_p, b, b_p, c, c_p, h, k, input));
    }
}


contract Verifier {

    function verifyTx
                        (
                            uint[2] memory a,
                            uint[2] memory a_p,
                            uint[2][2] memory b,
                            uint[2] memory b_p,
                            uint[2] memory c,
                            uint[2] memory c_p,
                            uint[2] memory h,
                            uint[2] memory k,
                            uint[2] memory input
                        )
                        public returns (bool r);
}
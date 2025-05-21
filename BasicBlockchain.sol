// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicBlockchain {
    struct Block {
        uint256 id;
        uint256 timestamp;
        bytes32 previousHash;
        string data;
    }

    Block[] public chain;

    constructor() {
        chain.push(Block(0, block.timestamp, bytes32(0), "Genesis Block"));
    }

    function addBlock(string memory _data) public {
        uint256 newId = chain.length;
        bytes32 prevHash = bytes32(chain[chain.length - 1].id);
        chain.push(Block(newId, block.timestamp, prevHash, _data));
    }

    function getLatestBlock() public view returns (Block memory) {
        require(chain.length > 0, "Chain is empty");
        return chain[chain.length - 1];
    }

    function getBlock(uint256 _blockId) public view returns (Block memory) {
        require(_blockId < chain.length, "Block ID out of bounds");
        return chain[_blockId];
    }
}

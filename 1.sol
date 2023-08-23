// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalNotary {
    // Mapping to store document hashes and their timestamp
    mapping(bytes32 => uint256) public documentTimestamps;

    // Event to log document submission
    event DocumentNotarized(bytes32 indexed documentHash, uint256 timestamp);

    // Function to notarize a document
    function notarizeDocument(bytes32 _documentHash) public {
        require(documentTimestamps[_documentHash] == 0, "Document already notarized");
        
        uint256 timestamp = block.timestamp; // Get the current block timestamp
        
        documentTimestamps[_documentHash] = timestamp;
        emit DocumentNotarized(_documentHash, timestamp);
    }

    // Function to check the timestamp of a notarized document
    function getTimestamp(bytes32 _documentHash) public view returns (uint256) {
        return documentTimestamps[_documentHash];
    }
}
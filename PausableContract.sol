// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PausableContract {
    bool public paused;
    address public admin;

    event PausedStateChanged(address indexed by, bool isPaused);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not an admin");
        _;
    }

    modifier whenNotPaused() {
        require(!paused, "Token operations are paused");
        _;
    }

    constructor() {
        admin = msg.sender; // Set the deployer as the admin
    }

    function pause() external onlyAdmin {
        paused = true;
        emit PausedStateChanged(msg.sender, true);
    }

    function unpause() external onlyAdmin {
        paused = false;
        emit PausedStateChanged(msg.sender, false);
    }

    function performOperation() external whenNotPaused {
        // Example operation that requires the contract to not be paused
        // Add your business logic here
    }
}

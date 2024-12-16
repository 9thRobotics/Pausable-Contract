// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PausableContract {
    bool public paused;
    address public admin;

    event Paused(address indexed by);
    event Unpaused(address indexed by);

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
        emit Paused(msg.sender);
    }

    function unpause() external onlyAdmin {
        paused = false;
        emit Unpaused(msg.sender);
    }

    function performOperation() external whenNotPaused {
        // Example operation that requires the contract to not be paused
        // Add your business logic here
    }
}

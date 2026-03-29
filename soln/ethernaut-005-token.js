// Check balance
await contract.balanceOf(player).then(v => v.toString());

// Transfer 21 tokens to some address
await contract.transfer("0x0000000000000000000000000000000000000001", 21);
// https://sepolia.etherscan.io/tx/0x187eadcd2537be423750788195fdc8680106621fd54aa830ab7a4b2af5d9740a

// Check balance
await contract.balanceOf(player).then(v => v.toString());
// '115792089237316195423570985008687907853269984665640564039457584007913129639935'

// https://sepolia.etherscan.io/tx/0x6668eb3789c9ba7fcbfd4209fa7fbb8ce10d16a9178dbf8c3512e31990dabfb1

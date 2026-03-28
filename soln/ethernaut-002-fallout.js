await contract.Fal1out({ value: toWei("0.000000001") });
// https://sepolia.etherscan.io/tx/0xa723b0afc695bc686603cd2c44c4c05faaae904f9d556cd19cad9c26de3d6520

// verify owner
await contract.owner();

// https://sepolia.etherscan.io/tx/0x127dd33b52aa2498890dcfa58be983beadb1116958aa017161d6f722fcda1a33
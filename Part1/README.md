# zku-c3-week2-q1

Part 1 Hashes and Merkle Tree

1. Gas cost (verifier time): SHA256 < Poseidon < MiMC = Pedersen

Note that MiMC has similar gas cost for initialization + insertion but MiMC is significantly more expensive when verifying.

Capacity (number of inputs it can take): SHA256< MiMC = Pedersen < Poseidon (5 leaf tree, Quinary Merkle tree)

Note that Quinary is so good at proof generation but high gas cost. [https://ethresear.ch/t/gas-and-circuit-constraint-benchmarks-of-binary-and-quinary-incremental-merkle-trees-using-the-poseidon-hash-function/7446](https://ethresear.ch/t/gas-and-circuit-constraint-benchmarks-of-binary-and-quinary-incremental-merkle-trees-using-the-poseidon-hash-function/7446)

Proof of generation efficiency: Poseidon< Pedersen = MiMC<< SHA. [https://ethresear.ch/t/performance-of-rescue-and-poseidon-hash-functions/7161](https://ethresear.ch/t/performance-of-rescue-and-poseidon-hash-functions/7161), [https://medium.com/aztec-protocol/plonk-benchmarks-ii-5x-faster-than-groth16-on-pedersen-hashes-ea5285353db0](https://medium.com/aztec-protocol/plonk-benchmarks-ii-5x-faster-than-groth16-on-pedersen-hashes-ea5285353db0)

Proof size: SHA256 < MiMC < Pedersen < Poseidon

2. Done
3. Done

Part 2 + Part3 README

Part2

1. Nova allows custom deposit amount, and allow fund transfer between users inside the pool, leveraging almost-immediate settlement layer 2 (formerly xdai chain)
2. Relayers are accounts that pay gas fees on behalf of another users when they are withdrawing. Relayers help keep user anonymous by not needing to pay gas fees when withdrawing. (or else they need to transfer eth to the new wallet somehow and leave too much trade)

Part3

1. Semaphore is a system that allows the user to get an authorization for an action and execute it, without revealing any personal info. It allows us to create proof off-chain then broacast a singal for proof of verification on-chain.
2. Semaphore stores a hash of the identity to prevent double signing.
3. Group signature, commitment pool

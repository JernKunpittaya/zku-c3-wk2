pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/poseidon.circom";
include "../node_modules/circomlib/circuits/switcher.circom";

template CheckRoot(n) { // compute the root of a MerkleTree of n Levels 
    signal input leaves[2**n];
    signal output root;
    //[assignment] insert your code here to calculate the Merkle root from 2^n leaves
    component poseidon[2**n];
    //Deal with leaves first
    for (var i=0; i<2**(n-1); i++){
        var index = 2**(n-1)+i;
        poseidon[index] = Poseidon(2);
        poseidon[index].inputs[0] <== leaves[2*i];
        poseidon[index].inputs[1] <== leaves[2*i+1];
    }
    // Do the rest
    for (var depth = n-2 ; depth >= 0; depth--){
        for (var i=2**depth;i<2**(depth+1);i++){
            poseidon[i] = Poseidon(2);
            poseidon[i].inputs[0] <== poseidon[2*i].out;
            poseidon[i].inputs[1] <== poseidon[2*i+1].out;
        }
    }
    root <== poseidon[1].out;

}

template MerkleTreeInclusionProof(n) {
    signal input leaf;
    signal input path_elements[n];
    signal input path_index[n]; // path index are 0's and 1's indicating whether the current element is on the left or right
    signal output root; // note that this is an OUTPUT signal
    //[assignment] insert your code here to compute the root from a leaf and elements along the path
    component poseidon[n];
    component switcher[n];

    //Deal with the leaf first
    switcher[n-1] = Switcher();
    switcher[n-1].sel <== path_index[0];
    switcher[n-1].L <== leaf;
    switcher[n-1].R <== path_elements[0];

    poseidon[n-1] = Poseidon(2);
    poseidon[n-1].inputs[0] <== switcher[n-1].outL;
    poseidon[n-1].inputs[1] <== switcher[n-1].outR;

    //Do the rest
    for(var depth = n-2; depth >=0; depth--){
        switcher[depth] = Switcher();
        switcher[depth].sel <== path_index[n-1-depth];
        switcher[depth].L <== poseidon[depth+1].out;
        switcher[depth].R <== path_elements[n-1-depth];

        poseidon[depth] = Poseidon(2);
        poseidon[depth].inputs[0] <== switcher[depth].outL;
        poseidon[depth].inputs[1] <== switcher[depth].outR;
    }
    root <== poseidon[0].out;
}
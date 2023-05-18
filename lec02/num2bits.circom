pragma circom 2.1.4;

template Num2Bits (nBits) {
    signal input in;
    signal output b[nBits];

    var accum = 0;
    for (var i = 0; i < nBits; i ++) {
        b[i] <-- (in >> i) & 1;
        0 === b[i] * (1 - b[i]);
        accum = accum + 2**i * b[i];
    }
    
    accum === in;
}

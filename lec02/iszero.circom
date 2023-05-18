pragma circom 2.1.4;

template IsZero () {
    signal input in;
    signal output out;
    
    signal inverse <-- in == 0 ? 0 : 1 / in;
    out <== -inverse * in + 1;
    0 === in * out;
}

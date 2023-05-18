pragma circom 2.1.4;

template IsEqual () {
    signal input in[2];
    signal output out;

    component isZero = IsZero();
    isZero.in <== in[0] - in[1];
    out <== isZero.out;
}

pragma circom 2.1.4;

include "num2bits.circom";

template LessThan () {
    signal input in[2];
    signal output out;
    var max = 254;

    component n2b = Num2Bits(max);
    // if in[0] - in[1] < 0, then the sum of the delta + (1 << k) is less than 2^k, which means the greatest significant bit is 0
    n2b.in <== in[0] - in[1] + (1 << (max - 1));

    out <== 1 - n2b.b[max - 1];
}

template LessThanEx (k) {
    assert(k <= 252);
    signal input in[2];
    signal output out;

    component n2b = Num2Bits(k + 1);
    n2b.in <== in[0] - in[1] + (1 << k);

    out <== 1 - n2b.b[k];
}

template LessEqThan (k) {
    signal input in[2];
    signal output out;

    component lt = LessThanEx(k);
    lt.in[0] <== in[0];
    lt.in[1] <== in[1] + 1;
    
    out <== lt.out;
}

template GreaterThan (k) {
    signal input in[2];
    signal output out;

    component lt = LessThanEx(k);
    lt.in[0] <== in[1];
    lt.in[1] <== in[0];

    out <== lt.out;
}

template GreaterEqThan (k) {
    signal input in[2];
    signal output out;

    component gt = GreaterThan(k);
    gt.in[0] <== in[0] + 1;
    gt.in[1] <== in[1];

    out <== gt.out;
}

pragma circom 2.1.4;

include "circomlib/compconstant.circom";

template IsNegative() {
    signal input in[254];
    signal output out;

    component cmp = CompConstant(10944121435919637611123202872628637544274182200208017171849102093287904247808);

    for (var i = 0; i < 254; i ++) {
        cmp.in[i] <== in[i];
    }

    out <== cmp.out;
}

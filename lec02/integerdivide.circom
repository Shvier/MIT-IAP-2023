pragma circom 2.1.4;

include "num2bits.circom";

template IntegerDivide (nBits) {
    assert(nBits <= 126);
    signal input dividend;
    signal input divisor;
    signal output remainder;
    signal output quotient;

    component n2bDvd = Num2Bits(nBits + 1);
    n2bDvd.in <== dividend;
    0 === n2bDvd.b[nBits];

    component n2bDvs = Num2Bits(nBits + 1);
    n2bDvs.in <== divisor;
    0 === n2bDvs.b[nBits];

    remainder <-- dividend % divisor;
    quotient <-- (dividend - remainder) / divisor;

    dividend === divisor * quotient + remainder;
}

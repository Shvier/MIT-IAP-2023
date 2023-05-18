pragma circom 2.1.4;

template TotalValue (n) {
    signal input in[n];
    signal output out;

    signal sum[n];
    sum[0] <== in[0];
    for (var i = 1; i < n; i ++) {
        sum[i] <== sum[i - 1] + in[i];
    }

    out <== sum[n - 1];
}

template Selector (nChoices) {
    signal input in[nChoices];
    signal input index;
    signal output out;
    
    component totalValue = TotalValue(nChoices);
    component equals[nChoices];
    for (var i = 0; i < nChoices; i ++) {
        equals[i] = IsEqual();
        equals[i].in[0] <== i;
        equals[i].in[1] <== index;

        totalValue.in[i] <== equals[i].out * in[i];
    }

    out <== totalValue.out;
}

pragma circom 2.0.3;

template IsEqual() {
    signal input in[2];
    signal output out;

    component isz = IsZero();

    in[1] - in[0] ==> isz.in;

    isz.out ==> out;
}


template CubicCircuit() {
    signal input ivc_input[1]; // IVC state
    signal input external_inputs[2]; // not part of the state

    signal output ivc_output[1]; // next IVC state

    signal temp1;
    signal temp2;
    
    temp1 <== ivc_input[0] * ivc_input[0];
    temp2 <== ivc_input[0] * external_inputs[0];
    ivc_output[0] <== temp1 * ivc_input[0] + temp2 + external_inputs[1];
}

component main {public [ivc_input]} = CubicCircuit();
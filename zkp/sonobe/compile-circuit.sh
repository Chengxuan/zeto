#!/bin/bash

rm -r ./circuit/*_js
rm -rf compiled/*

cd circuit
npm install
cd ..

circom ./circuit/cubic_circuit.circom --r1cs --sym --wasm --prime bn128 --output ./compiled/

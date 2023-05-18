#!/bin/bash

CIRCUIT_NAME=""
if [ "$1" ]; then
    CIRCUIT_NAME=$1
else
  echo "Please provide name of the circuit to compile"
  exit 1
fi

circom ./circuits/${CIRCUIT_NAME}.circom --r1cs --wasm --sym -o build/binaries
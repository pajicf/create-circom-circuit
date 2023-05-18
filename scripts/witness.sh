#!/bin/bash

CIRCUIT_NAME=""
if [ "$1" ]; then
    CIRCUIT_NAME=$1
else
  echo "Please provide name of the circuit to compile"
  exit 1
fi

# Generates /build/witness/CIRCUIT_NAME.wtns
node build/binaries/${CIRCUIT_NAME}_js/generate_witness.js build/binaries/${CIRCUIT_NAME}_js/${CIRCUIT_NAME}.wasm build/inputs/${CIRCUIT_NAME}_input.json build/witness/${CIRCUIT_NAME}.wtns
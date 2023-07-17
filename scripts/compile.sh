#!/bin/bash
. ./scripts/build_constants

CIRCUIT_NAME=""
if [ "$1" ]; then
    CIRCUIT_NAME=$1
else
  echo "Please provide name of the circuit to compile"
  exit 1
fi

# Generates
# - build/binaries/CIRCUIT_NAME_js binaries
# - build/binaries/CIRCUIT_NAME.r1cs
# - build/binaries/CIRCUIT_NAME.sym
mkdir -p ${BINARIES_FOLDER_PATH}
circom ./circuits/${CIRCUIT_NAME}.circom --r1cs --wasm --sym -o ${BINARIES_FOLDER_PATH}
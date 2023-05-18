#!/bin/bash

PTAU_OUT_FILE_PATH=""
CIRCUIT_NAME=""

if [ "$1" ]; then
    PTAU_OUT_FILE_PATH=$1
else
  echo "Please provide power of Tau file to contribute to"
  exit 1
fi

if [ "$2" ]; then
    CIRCUIT_NAME=$2
else
  echo "Please provide circuit name"
  exit 1
fi

if ! [ -f ${PTAU_OUT_FILE_PATH} ]; then
  echo "${PTAU_OUT_FILE_PATH} Doesn't exist, try fetching or generating it first"
  exit 1
fi

# Generates zKey in build/keys folder
echo "Generating zKeys"
snarkjs groth16 setup ./build/binaries/${CIRCUIT_NAME}.r1cs ${PTAU_OUT_FILE_PATH} ./build/keys/${CIRCUIT_NAME}_0000.zkey

# Contribute to the ceremony
echo "Contributing to the ceremony"
snarkjs zkey contribute ./build/keys/${CIRCUIT_NAME}_0000.zkey ./build/keys/${CIRCUIT_NAME}_final.zkey --name="PTAU Contributor" -v -e="Random text to contribute"

# Export the key
echo "Exporting the key"
snarkjs zkey export verificationkey ./build/keys/${CIRCUIT_NAME}_final.zkey ./build/keys/${CIRCUIT_NAME}_verification_key.json

echo "PTUA Phase 2 complete"
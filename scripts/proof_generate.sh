#!/bin/bash

CIRCUIT_NAME=""
if [ "$1" ]; then
    CIRCUIT_NAME=$1
else
  echo "Please provide circuit name"
  exit 1
fi

PROOF_FOLDER_PATH=./build/proof/${CIRCUIT_NAME}

if [ ${PROOF_FOLDER_PATH} ]; then
  echo "test"
  mkdir -p ${PROOF_FOLDER_PATH}
fi

echo "Generating proof for ${CIRCUIT_NAME} circuit"
snarkjs groth16 prove ./build/keys/${CIRCUIT_NAME}_final.zkey ./build/witness/${CIRCUIT_NAME}.wtns ${PROOF_FOLDER_PATH}/proof.json ${PROOF_FOLDER_PATH}/public.json

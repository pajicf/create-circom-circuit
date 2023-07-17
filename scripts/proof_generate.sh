#!/bin/bash
. ./scripts/build_constants

CIRCUIT_NAME=""
if [ "$1" ]; then
    CIRCUIT_NAME=$1
else
  echo "Please provide circuit name"
  exit 1
fi

PROOF_FOLDER_PATH=${PROOFS_FOLDER_PATH}/${CIRCUIT_NAME}

# Creating directories
mkdir -p ${PROOF_FOLDER_PATH}
mkdir -p ${KEYS_FOLDER_PATH}
mkdir -p ${WITNESS_FOLDER_PATH}

echo "Generating proof for ${CIRCUIT_NAME} circuit"
snarkjs groth16 prove ${KEYS_FOLDER_PATH}/${CIRCUIT_NAME}_final.zkey ${WITNESS_FOLDER_PATH}/${CIRCUIT_NAME}.wtns ${PROOF_FOLDER_PATH}/proof.json ${PROOF_FOLDER_PATH}/public.json

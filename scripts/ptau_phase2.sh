#!/bin/bash
. ./scripts/build_constants

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

CONSTRAINT_SYSTEM_BINARIES_PATH=${BINARIES_FOLDER_PATH}/${CIRCUIT_NAME}.r1cs
INITIAL_ZKEY_PATH=${KEYS_FOLDER_PATH}/${CIRCUIT_NAME}_0000.zkey
FINAL_ZKEY_PATH=${KEYS_FOLDER_PATH}/${CIRCUIT_NAME}_final.zkey
VERIFICATION_KEY_PATH=${KEYS_FOLDER_PATH}/${CIRCUIT_NAME}_verification_key.json

mkdir -p ${KEYS_FOLDER_PATH}

# Generates zKey in build/keys folder
echo "Generating zKeys"
snarkjs groth16 setup ./build/binaries/${CIRCUIT_NAME}.r1cs ${PTAU_OUT_FILE_PATH} ./build/keys/${CIRCUIT_NAME}_0000.zkey
#snarkjs groth16 setup ${CONSTRAINT_SYSTEM_BINARIES_PATH} ${PTAU_OUT_FILE_PATH} ${INITIAL_ZKEY_PATH}

# Contribute to the ceremony
echo "Contributing to the ceremony"
snarkjs zkey contribute ${INITIAL_ZKEY_PATH} ${FINAL_ZKEY_PATH} --name="PTAU Contributor" -v -e="Random text to contribute"

# Export the key
echo "Exporting the key"
snarkjs zkey export verificationkey ${FINAL_ZKEY_PATH} ${VERIFICATION_KEY_PATH}

echo "PTUA Phase 2 complete"
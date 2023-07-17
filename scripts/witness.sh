#!/bin/bash
. ./scripts/build_constants

CIRCUIT_NAME=""
if [ "$1" ]; then
    CIRCUIT_NAME=$1
else
  echo "Please provide circuit name"
  exit 1
fi

# Creating directories
mkdir -p ${WITNESS_FOLDER_PATH}

# Generates /build/witness/CIRCUIT_NAME.wtns
node ${BINARIES_FOLDER_PATH}/${CIRCUIT_NAME}_js/generate_witness.js ${BINARIES_FOLDER_PATH}/${CIRCUIT_NAME}_js/${CIRCUIT_NAME}.wasm ${INPUTS_FOLDER_PATH}/${CIRCUIT_NAME}_input.json ${WITNESS_FOLDER_PATH}/${CIRCUIT_NAME}.wtns
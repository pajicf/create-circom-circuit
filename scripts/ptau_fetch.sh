#!/bin/bash
. ./scripts/build_constants

PTAU_POWER=""
if [ "$1" ]; then
    PTAU_POWER=$1
else
  echo "Please provide power of Tau to download"
  exit 1
fi

PTAU_URL=https://storage.googleapis.com/zkevm/ptau/powersOfTau28_hez_final_${PTAU_POWER}.ptau

PTAU_OUT_FILE=powers_of_tau_${PTAU_POWER}.ptau

PTAU_OUT_FILE_PATH=${PTAU_FOLDER_PATH}/${PTAU_OUT_FILE}

mkdir -p ${PTAU_FOLDER_PATH}

# Generates /build/ptau/PTAU_OUT_FILE
if [ -f ${PTAU_OUT_FILE_PATH} ]; then
  echo "${PTAU_OUT_FILE} download already Completed!"
  exit 0
else
  echo "Downloading ${PTAU_OUT_FILE}" 
  curl ${PTAU_URL} --output ${PTAU_OUT_FILE_PATH} --progress-bar
  echo "${PTAU_OUT_FILE} download Completed!"
fi
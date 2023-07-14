import path = require("path");
import { wasm } from "circom_tester"

export const baseTestCircuitPath = path.join(__dirname, "../circuits/");

export const getCircuitPath = (circuitName: string) => {
  return baseTestCircuitPath + `${circuitName}.circom`;
}

export const getCircuitWasm = async (circuitName: string) => {
  const circuitPath = getCircuitPath(circuitName);

  return await wasm(circuitPath);
} 
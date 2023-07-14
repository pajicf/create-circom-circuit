import { assert } from "chai";
import { getCircuitWasm } from "./utils/circuits";

describe("Math test", () => {
  let multiplierCircuit;
  let additionCircuit;

  before(async () => {
    multiplierCircuit = await getCircuitWasm("multiplier");
    additionCircuit = await getCircuitWasm("addition");
  });

  it("Should multiply two numbers correctly", async () => {
    const input = {
      "a": "3", 
      "b": "11"
    };

    const witness = await multiplierCircuit.calculateWitness(input);
    await multiplierCircuit.checkConstraints(witness);
    await multiplierCircuit.assertOut(witness, { "c": "33" });
  });

  it("Should add two numbers correctly", async () => {
    const input = {
      "a": "3", 
      "b": "11"
    };

    const witness = await additionCircuit.calculateWitness(input);
    await additionCircuit.checkConstraints(witness);
    await additionCircuit.assertOut(witness, { "c": "14" });
  })
});
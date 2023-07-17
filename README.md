<img align="left" width="150" height="150" top="100" src="https://ipfs.io/ipfs/QmQCD5LZcxBky4rxNriBNx36cACdwxeMtyEets3Au8cV4Q">

# [Circom] create-circuit-template

Light and Easy to use template for **Circom** projects with the **_"easy build flow"_**

<br/>

## What do I need to have before I start?

To run the project, you need:

- [Circom 2](https://docs.circom.io/getting-started/installation/) - For writing and compiling the circuits
- [Node.js](https://nodejs.org/en/) & [Yarn](https://yarnpkg.com/) - For Writing tests and running the _"easy build flow"_
- Bash Shell
  - If you're on Linux or Mac OS, skip this, you probably already have it.
  - If you're on Windows, use [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)

## How to run?

Before running any command, first:

1. Navigate to the project root
2. Run `yarn` to install the dependencies
3. `yarn build` - **The Easy Build flow** (Compiles, fetches trusted ceremony and creates a ZKP proof for the project)

### Command list

For more control, the build command is broken down into several atomic components, where each can be ran by an individual command

| Command | Description |
| --- | --- |
| `yarn compile` | Compiles the circuits and creates wasm binaries |
| `yarn ptau:fetch` | Fetches the Powers of Tau ceremony automatically |
| `yarn ptau:phase2` | Contributes to the Powers of Tau ceremony to be used for the project circuit |
| `yarn witness:generate` | Generate a witness using the inputs and the project circuit |
| `yarn proof:generate` | Create a Zero-Knowledge proof using the inputs |

## Testing

Tests are written in Typescript and done using the Mocha framework.

To run the tests, use `yarn test`

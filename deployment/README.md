# Deployment & Interaction Guide

This guide provides instructions on how to deploy and interact with the smart contract using Remix IDE and MetaMask.

## Requirements

- [Remix IDE](https://remix.ethereum.org/)
- [MetaMask Wallet](https://metamask.io/)
- [Etherscan Page of the Contract](https://sepolia.etherscan.io/address/0xe3996f4e094471342ae1ef51f59f01b898c709da)
- **Contract Address:** `0xE3996F4E094471342AE1EF51F59F01b898C709da`

---

## Deployment of the 42DK Contract (First Time)

Follow these steps to deploy the contract for the first time:

1. **Open Remix IDE:**
   - Navigate to [Remix IDE](https://remix.ethereum.org/) in your browser.

2. **Create a New File:**
   - In the file explorer, create a new file named `42DK.sol`.

3. **Paste Contract Code:**
   - Copy the contract code from the `42DK.sol` file located in the `contracts` folder of this repository.
   - Paste it into the `42DK.sol` file in the Remix IDE.

4. **Compile the Contract:**
   - Click on the `Solidity Compiler` tab on the left sidebar.
   - Choose the appropriate compiler version if necessary.
   - Click `Compile 42DK.sol`.

5. **Deploy the Contract:**
   - Navigate to the `Deploy & run transactions` tab.
   - In the `Environment` dropdown, select `Injected Provider - MetaMask` to connect your MetaMask wallet.
   - Ensure MetaMask is set to the correct network (e.g., Sepolia Testnet).

6. **Deploy:**
   - Click the `Deploy` button and confirm the transaction in MetaMask.

7. **Contract Deployed:**
   - After confirming the transaction, the contract will be deployed and visible under the `Deployed Contracts` section.

---

## Interacting with an Already Deployed Contract

If the contract is already deployed (e.g., using address `0xE3996F4E094471342AE1EF51F59F01b898C709da`), follow these steps:

1. **Open Remix IDE:**
   - Go to [Remix IDE](https://remix.ethereum.org/).

2. **Compile the Contract:**
   - In the `Solidity Compiler` tab, compile the `42DK.sol` contract again.

3. **Connect MetaMask:**
   - In the `Deploy & run transactions` tab, select `Injected Provider - MetaMask` to connect your wallet.

4. **Access the Deployed Contract:**
   - In the `At Address` field, enter the contract address `0xE3996F4E094471342AE1EF51F59F01b898C709da`.
   - Click the `At Address` button to load the contract.

5. **Interact with the Contract:**
   - Once loaded, the contract will appear in the `Deployed Contracts` section where you can interact with it.

---

## Additional Resources

- **Remix IDE Documentation:** [https://remix-ide.readthedocs.io/](https://remix-ide.readthedocs.io/)
- **MetaMask Setup Guide:** [https://metamask.io/](https://metamask.io/)
- **Contract Etherscan Page:** [https://sepolia.etherscan.io/address/0xe3996f4e094471342ae1ef51f59f01b898c709da](https://sepolia.etherscan.io/address/0xe3996f4e094471342ae1ef51f59f01b898c709da)

---

By following these instructions, you can successfully deploy or interact with the 42DK contract using Remix IDE and MetaMask.

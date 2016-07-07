# Documentation File


## Key Components for Contract Programming in Solidity

### Contract

A very important property of Etheruem contracts is that when a contract has been uploaded to the chain, the code can never be changed. Contracts are stored in special account objects that hold references to the contract (byte) code, and a database, and some other things. The database is a key-value store, also known as 'storage', and that's where data such as the values of contract fields are stored.
When contracts are uploaded to the chain, the first thing that happens is that a new account is created. The contract code is then loaded into a VM which runs the constructor part, initializes fields etc., and then adds the runtime portion (or body) of the contract to the account. After the account has been created there is no way to change the code, and there is no way to update the database except through that code.

### Transaction
A `transaction` is a signed transaction sent by a user to a contract account, or external account, that changes (or at least tries to change) the world state. Transactions are placed in the tx queue and are not considered valid until they are eventually mined into a block. Transactions must always be used when sending Ether, or doing any form of write operation.

### Call
A `call` is used to read data from the chain, or do computations that does not change the world state, so it does not require a valid signature or consensus from the other users in the network. An example of when a call should be used is when checking the value of a contract field through its public accessor function.

### external and public

From a visibility perspective, `external` is essentially the same as `public`. When a contract containing a `public` or an `external` function has been deployed, the function can be called from other contracts, calls, and transaction.

The `external` modifier must not be confused with "external" as it's used in the white paper, i.e. "external accounts", which means accounts that are not contract accounts. `external` functions can be called from other contracts as well as through transactions or calls.

The main difference between `external` and `public` functions is the way they are called from the contract that contains them, and how the input parameters are handled. If you call a `public` function from another function in the same contract, the code will be executed using a JUMP, much like private and internal functions, whereas `external` functions must be invoked using the CALL instruction. Additionally, `external` functions does not copy the input data from the read-only calldata array into memory and/or stack variables, which can be used for optimization.

Finally, `public` is the default visibility, meaning functions will be public if nothing else is specified.

### internal

`internal` is essentially the same as protected. The function can't be called from other contracts, or by transacting to or calling the contract, but it can be called from other functions in the same contract and any contracts that extend it.

### private

`private` functions can only be called from functions in the same contract.



# Source Materials
https://github.com/androlo/solidity-workshop/blob/master/tutorials/2016-02-17-solidity-systems-I.md

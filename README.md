# [Fiat Relay]

[Fiat Relay] is an Ethereum contract that can be leveraged by other Ethereum Contracts for conversion to Fiat (using an Exchange) and payment via traditional fiat Payment Services (provided by Bank XXX)

The main functionality it provides are:

1. verification of an Ethereum message (eg. An Ethereum Contract has provided a payment for X amount of Ether to the FiatRelay Ethereum contract

Contracts have the ability to send "messages" to other contracts. Messages are virtual objects that are never serialized and exist only in the Ethereum execution environment. A message contains:
* The sender of the message (implicit)
* The recipient of the message
* The amount of ether to transfer alongside the message
* An optional data field
* A STARTGAS value

Essentially, a message is like a transaction, except it is produced by a contract and not an external actor.
Note that the gas allowance assigned by a transaction or contract applies to the total gas consumed by that transaction and all sub-executions. For example, if an external actor A sends a transaction to B with 1000 gas, and B consumes 600 gas before sending a message to C, and the internal execution of C consumes 300 gas before returning, then B can spend another 100 gas before running out of gas.
(source - https://github.com/ethereum/wiki/wiki/White-Paper#ethereum-accounts)



## Fiat Relay contract address and ABI: (Work in Progress)

* [mainnet](http://fiatrelay.surge.sh/mainnetStatus.html)
* [testnet Morden](http://fiatrelay.surge.sh/testnetContractStatus.html)

The address and ABI is all that's needed to use Fiat Relay, in addition to the API documentation below.

## API


##### verifyTx(rawTransaction, transactionIndex, merkleSibling, blockHash)

Verifies the presence of a transaction on the Bitcoin blockchain, primarily that the transaction is on Bitcoin's main chain and has at least 6 confirmations.

* `rawTransaction` - raw `bytes` of the transaction
* `transactionIndex` - transaction's index within the block, as `int256`
* `merkleSibling` - array of the sibling hashes comprising the Merkle proof, as `int256[]`
* `blockHash` - hash of the block that contains the transaction, as `int256`

Returns `uint256`
* hash of the verified Bitcoin transaction
* `0` if `rawTransaction` is exactly 64 bytes in length or fails verification

*Note:* See [examples/sampleCall.html](examples/sampleCall.html) including use of [bitcoin-proof](https://www.npmjs.com/package/bitcoin-proof) for constructing `merkleSibling`.

---

##### relayTx(rawTransaction, transactionIndex, merkleSibling, blockHash, contractAddress)

Verifies a Bitcoin transaction per `verifyTx()` and relays the verified transaction to the specified Ethereum contract.

* `rawTransaction` - raw `bytes` of the transaction
* `transactionIndex` - transaction's index within the block, as `int256`
* `merkleSibling` - array of the sibling hashes comprising the Merkle proof, as `int256[]`
* `blockHash` - hash of the block that contains the transaction, as `int256`
* `contractAddress` - address of the processor contract that will receive the verified Bitcoin transaction, as `int256`

The processor contract at `contractAddress` should have a function of signature
`processTransaction(bytes rawTransaction, uint256 transactionHash) returns (int256)`
and is what will be invoked by `relayTx` if the transaction passes
verification.  For examples, see
[BitcoinProcessor.sol](examples/BitcoinProcessor.sol)
and [testnetSampleRelayTx.html](examples/testnetSampleRelayTx.html).

Returns `int256`
* value returned by the processor contract's `processTransaction` function
* or ERR_RELAY_VERIFY, see [constants.se](constants.se)

Note: Callers cannot be 100% certain when an ERR_RELAY_VERIFY occurs because
it may also have been returned by processTransaction().  Callers should be
aware of the contract that they are relaying transactions to, and
understand what the processor contract's processTransaction method returns.

----

##### storeBlockHeader(blockHeader)

Store a single block header if it is valid, such as a valid Proof-of-Work and the previous block it reference exists.

* `blockHeader` - raw `bytes` of the block header (not the hex string, but the actual bytes).

Returns `int256`
* block height of the header if it was successfully stored
* `0` otherwise

----

##### bulkStoreHeader(bytesOfHeaders, numberOfHeaders)

Store multiple block headers if they are valid.

* `bytesOfHeaders` - raw `bytes` of the block headers (not the hex string, but the actual bytes), with one following immediately the other.
* `numberOfHeaders` - `int256` count of the number of headers being stored.

Returns `int256`
* block height of the last header if all block headers were successfully stored
* `0` if any of the block headers were not successfully stored

*Note:* See [deploy/relayTest/testBulkDeploy.yaml](deploy/relayTest/testBulkDeploy.yaml) for an example of the data for storing multiple headers.  Also, to avoid exceeding Ethereum's block gas limit, a guideline is to store only 5 headers at time.

----

##### getBlockHeader(blockHash)

Get the 80 byte block header for a given `blockHash`.  A payment value of
`getFeeAmount(blockHash)` must be provided in the transaction.

* `blockHash` - hash of the block as `int256`

Returns `bytes`
* block header, always as 80 bytes (all zeros if header does not exist)
* or `0` (as a single byte) if insufficient payment is provided

----

##### getBlockHash(blockHeight)

Get the block hash for a given `blockHeight`.

* `blockHeight` - height of the block as `int256`.  Minimum value is `1`.

Returns `int256`
* block hash
* `0` if not found

----

##### getAverageChainWork()

Returns the difference between the chainWork of the latest block and the
10th block prior.

This is provided in case an Ethereum contract wants to use the chainWork
or Bitcoin network difficulty (which can be derived) as a data feed.

----

##### getBlockchainHead(), getLastBlockHeight(), others

`getBlockchainHead` - returns the hash of the latest block, as`int256`

`getLastBlockHeight` - returns the block height of the latest block, as `int256`

See [BitcoinRelayAbi.js](examples/BitcoinRelayABI.js) for other APIs and [testnetContractStatus.html](examples/testnetContractStatus.html) for an example of calling some of them.

----

## License

See [full MIT License](LICENSE) including:
```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

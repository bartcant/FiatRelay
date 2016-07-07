# Fiat-Relay contract

Disclaimer: This is experimental code and not suitable for consumption

```
contract FiatRelay {
    // The keyword "public" makes those variable readable from outside.
    address public originalcontract;

    Struct Beneficary // this contains all information related to the Beneficiary
    {
      byte32 BeneficiaryNanme;
      byte32 BeneficiaryAccount;
      byte32 BeneficiaryAccountType;
      byte32 BeneficiaryBankName:
      byte32 BeneficiaryABA;
      byte32 BeneficiaryAddress;
      byte32 BeneficicaryEmail;
      // Other information to be added here
    }

    Struct Originator  // this contains all information related to the Originator

    {
      byte32 OriginatorNanme;
      byte32 OriginatorAccount;
      byte32 OriginatorBankName
      byte32 OriginatorABA;
      byte32 OriginatorAddress;
      byte32 OriginatorEmail;
      Address OriginatorEthereumAddress;
      // Other information to be added here
    }

    // This declares a state variable that stores a `Originator` struct for each possible address.
    mapping(address => Originator) public Originator;

    // This declares a state variable that stores a `Beneficiary` struct for each possible address.
    mapping(address => Beneficiary) public Beneficiary;


    // This is the constructor whose code is run only when the contract is created.
    function FiatRelay() {
        originalcontract = msg.sender;
    }

    function receiveBeneficiary(address receiver, uint amount, byte32 beneficiary) {

    }
}
```

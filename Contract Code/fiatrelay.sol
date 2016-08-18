# Disclaimer : This is experimental code not suitable for testing or production

# FiatRelay Contract describing the collection of data elements necessary between an originator and a beneficiary.

contract FiatRelay is mortal{



    mapping (address=>Originator) public Originators
    mapping (address=>BankProcessor) public BankProcessors

    struct Originator {
      bool Active;
      uint LastUpdate;
      string OriginatorName;
      string OriginatorAddress1;
      string OriginatorAddress2;
      string OriginatorCity;
      string OriginatorState;
      string OriginatorZipPostal;
      string OriginatorTelephone;
      string OriginatorEmailAddress;
      string OriginatorBCIdentity;
      address EthereumOriginalAccount;
      address ReturnEthereumAddress;
    }

    struct Benefiicary {
      string BeneficiaryName;
      string BeneficiaryBankAccountNumber;
      string BeneficiaryBankABANumber;
      string BeneficiaryAddress1;
      string BeneficiaryAddress2;
      string BeneficiaryCity;
      string BeneficiaryState;
      string BeneficiaryZipPostal;
      string BeneficiaryCountry;
      string BeneficiaryTelephone;
      string BeneficiaryEmailAddress;
      string BeneficiaryBCIdentity;

    }

    struct  BankProcessor {
      bool Active;
      uint LastUpdate;
      address BankProcessorAddress;
      string BankName;

    }

    struct Transaction  {

      string Originator ;
      string Beneficiary;
      String Bankprocessor;
      uint256 EtherAmount;
      string ReferenceMessage;
    }



    function SetOriginator (string _originatorname, string _originatoraddress1, string _originatoraddress2,
      string _originatorcity, string  _originatorstate, string _originatorstate, string _originatorzippostal,
      string _originatortelephone, string _originatoremailaddress, string _Originatorbcidentity ) {

      OriginatorName = _originatorname ;
      OriginatorAddress1 = _originatoraddress1;
      OriginatorAddress2 = _originatoraddress2;
      OriginatorCity = _originatorcity;
      OriginatorState =  _originatorstate;
      OriginatorZipPostal = _originatorzippostal;
      OriginatorTelephone = _originatortelephone;
      OriginatorEmailAddress = _originatoremailaddress;
      OriginatorBCIdentity = _Originatorbcidentity;

    }

    function SetBeneficiary (string _beneficiaryname,  string _beneficiarybankaccountnumber,
      string beneficiarybankabanumber, string _beneficiaryaddress1, string _beneficiaryaddress2,
      string _beneficiarycity, string  _beneficiarystate, string _beneficiaryzippostal, string _beneficiarytelephone,
      string _beneficiaryemailaddress, string _beneficiarybcidentity ) {

      BeneficiaryName = _beneficiaryname;
      BeneficiaryBankAccountNumber = _beneficiarybankaccountnumber;
      BeneficiaryBankABANumber = _beneficiarybankabanumber;
      BeneficiaryAddress1 = _beneficiaryaddress1;
      BeneficiaryAddress2 = _beneficiaryaddress2;
      BeneficiaryCity = _beneficiarycity;
      BeneficiaryState =  _beneficiarystate;
      BeneficiaryZipPostal = _beneficiaryzippostal;
      BeneficiaryTelephone = _beneficiarytelephone;
      BeneficiaryEmailAddress = _beneficiaryemailaddress;
      BeneficiaryBCIdentity = _beneficiarybcidentity;

    }

    function Amount (uint _amount){

      EtherAmount = _amount;


    }

    function OriginalAddress  (address _originaladdress) {

        EthereumOriginatingAccount = originaladdress;

    }

}

contract mortal{

    address public owner;

    function mortal() {

      owner = msg.sender;
    }

    modifier onlyOwner {
      if (msg.sender != owner) {
          throw;
        } else {
          -
        }

    }

    function kill() onlyOwner{

      suicide(owner);
    }


}

contract FiatRelay{


    string public OriginatorName;
    string public OriginatorAddress1;
    string public OriginatorAddress2;
    string public OriginatorCity;
    string public OriginatorState;
    string public OriginatorZipPostal;
    string public OriginatorTelephone;
    string public OriginatorEmailAddress;
    string public OriginatorBCIdentity;
    string public BeneficiaryName;
    string public BeneficiaryBankAccountNumber;
    string public BeneficiaryBankABANumber;
    string public BeneficiaryAddress1;
    string public BeneficiaryAddress2;
    string public BeneficiaryCity;
    string public BeneficiaryState;
    string public BeneficiaryZipPostal;
    string public BeneficiaryCountry;
    string public BeneficiaryTelephone;
    string public BeneficiaryEmailAddress;
    string public BeneficiaryBCIdentity;
    string public EtherAmount;
    string public EthereumOriginatingAccount;
    string public EthereumBankAccount;
    string public ReturnEthereumAddress:
    string public ReferenceMessage;


    function Originator (string _originatorname, string _originatoraddress1, string _originatoraddress2,
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

    function Beneficiary (string _beneficiaryname,  string _beneficiarybankaccountnumber,
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

    function Amount (uint _amount) {

      EtherAmount = _amount;

    Function BankProcessor (uint _bankprocessor) {

      EthereumBankAccount = _bankprocessor
      
    }

    }

}

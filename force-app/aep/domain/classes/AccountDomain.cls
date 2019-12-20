/***********************************************************************
* This class is for facilitating actions occuring on the Account object
***********************************************************************/

public with sharing class AccountDomain extends fflib_SObjectDomain {

    /**
     * Constructor to the AccountDomain class
    **/
    public AccountDomain(List<Account> accountList) {
        super((List<SObject>) accountList);
    }

    /**
     * An inner class to the AccountDomain class, supported here for test purposes
    **/
    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new AccountDomain(sObjectList);
        }
    }
}
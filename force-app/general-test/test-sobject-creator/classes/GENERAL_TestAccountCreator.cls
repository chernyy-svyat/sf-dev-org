/********************************************************************
* This class is for creating instances of Account object
********************************************************************/

@isTest
public with sharing class GENERAL_TestAccountCreator {

    /**
     * List of available test NAICS codes
    **/
    public static List<String> naicsCodes = new List<String> {
        '721110', '721111', '721112'
    };

    /**
     * This method creates List<Account> by input number
    **/
    public static List<Account> create(Integer accountNumber) {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < accountNumber; i++) {
            accounts.Add(
                new Account(
                    Name = 'Account' + DateTime.now().getTime(),
                    NaicsCode = GENERAL_TestUtils.randomSelect(naicsCodes)
                )
            );
        }
        return accounts;
    }
}
/********************************************************************
* This class is for generating test data for Account object
********************************************************************/

@isTest
public with sharing class GENERAL_TestAccountFactory {

    /**
     * This inner class is for changing the delault field values
     * Setter: withTravelAgency, withNaicsCode (return this)
     * Getter: get (return Account)
    **/
    public class Single {

        public Account account;

        public Single withTravelAgency(TravelAgency__c value) {
            try {
                this.account.TravelAgency__c = value.Id;
            } catch (Exception ex) {
                System.debug('Incorrect TravelAgency__c value in method withTravelAgency: ' + ex.getMessage());
            }
            return this;
        }

        public Single withNaicsCode(String value) {
            try {
                this.account.NaicsCode = value;
            } catch (Exception ex) {
                System.debug('Incorrect NaicsCode value in method withNaicsCode: ' + ex.getMessage());
            }
            return this;
        }

        public Account get() {
            insert this.account;
            return this.account;
        }
    }

    /**
     * This method creates only one Account instance
     * For futher use Account instance it is necessary to call get() method
     * (createSingle().get())
    **/
    public static Single createSingle() {
        Single single = new Single();
        single.account = GENERAL_TestAccountCreator.create(1)[0];
        TravelAgency__c travelAgency = GENERAL_TestTravelAgencyCreator.create(1)[0];
        single.account.TravelAgency__c = travelAgency.Id;
        return single;
    }

    /**
     * This method creates List<Account> by input number
    **/
    public static List<Account> createByNumber(Integer accountNumber) {
        List<Account> accounts = GENERAL_TestAccountCreator.create(accountNumber);
        List<TravelAgency__c> travelAgencies = GENERAL_TestTravelAgencyCreator.create(accountNumber);
        for (Integer i = 0; i < accounts.size(); i++) {
            accounts[i].TravelAgency__c = travelAgencies[i].Id;
        }
        insert accounts;
        return accounts;
    }
}
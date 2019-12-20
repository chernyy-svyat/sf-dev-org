/*****************************************************************
* This class contains test methods for the AccountSelector class
*****************************************************************/

@isTest
public class AccountSelectorTest {

    @isTest
    static void selectByIdWithDynamicFieldList() {
        Account account = GENERAL_TestAccountFactory.createByNumber(1)[0];
        List<String> fields = new List<String> {'NaicsCode' };
        List<Account> selectedAccounts = new AccountSelector().selectById(account.Id, fields);
        System.assert(String.isNotBlank(selectedAccounts[0].NaicsCode),
            'ShippingAddress field should be in the response');
    }

    @isTest
    static void selectByIdWithDynamicFieldString() {
        Account account = GENERAL_TestAccountFactory.createByNumber(1)[0];
        String stringFields = 'NaicsCode';
        List<Account> selectedAccounts = new AccountSelector().selectById(account.Id, stringFields);
        System.assert(String.isNotBlank(selectedAccounts[0].NaicsCode),
            'ShippingAddress field should be in the response');
    }

    @isTest
    static void selectByTravelAgencyId() {
       TravelAgency__c travelAgency = GENERAL_TestTravelAgencyFactory.createSingle().get();
        Account account =
            GENERAL_TestAccountFactory.createSingle()
                .withTravelAgency(travelAgency)
                .get();
       List<Account> accounts = new AccountSelector().selectByTravelAgencyId(travelAgency.Id);
       System.assertEquals(accounts[0].TravelAgency__c, travelAgency.Id, 'Travel Agency Id should be equals travelAgency.Id');
       System.assertEquals(accounts.size(), 1, 'Size should meet the expectations (1)');
    }

    @isTest
    static void selectByTravelAgencyName() {
        TravelAgency__c travelAgency =
            GENERAL_TestTravelAgencyFactory.createSingle()
                .withName('TravelAgency1')
                .get();
        Account account =
            GENERAL_TestAccountFactory.createSingle()
                .withTravelAgency(travelAgency)
                .get();
        List<Account> accounts = new AccountSelector().selectByTravelAgencyName('TravelAgency1');
        System.assertEquals(accounts[0].TravelAgency__r.Name, 'TravelAgency1', 'Travel Agency name should be TravelAgency1');
        System.assertEquals(accounts.size(), 1, 'Size should meet the expectations (1)');
    }

    @isTest
    static void selectByTravelAgencyLevel() {
       TravelAgency__c travelAgency =
            GENERAL_TestTravelAgencyFactory.createSingle()
                .withLevel('Level A')
                .get();
        Account account =
            GENERAL_TestAccountFactory.createSingle()
                .withTravelAgency(travelAgency)
                .get();
       List<Account> accounts = new AccountSelector().selectByTravelAgencyLevel('A');
       System.assertEquals(accounts[0].TravelAgency__r.Level__c, 'A', 'Travel Agency level should be equals A');
       System.assertEquals(accounts.size(), 1, 'Size should meet the expectations (1)');
    }
}
/********************************************************************
* This class is for creating instances of User object
********************************************************************/

@isTest
public with sharing class GENERAL_TestUserCreator {

    /**
     * List of available test lastnames
    **/
    public static List<String> lastNames = new List<String> {
        'James', 'Smith', 'Brown'
    };

    /**
     * List of available test titles
    **/
    public static List<String> titles = new List<String> {
        'Test Title 1', 'Test Title 2', 'Test Title 3'
    };

    /**
     * List of available test companies
    **/
    public static List<String> companies = new List<String> {
        'TestCompany1', 'TestCompany2', 'TestCompany3'
    };

    /**
     * This field is for storing Id of default profile
    **/
    public static Id defaultProfileId;

    /**
     * This method returns Id of default profile (System User)
    **/
    public static Id getDefaultProfileId() {
        if (defaultProfileId == null) {
            defaultProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1].Id;
        }
        return defaultProfileId;
    }

    /**
     * This method creates List<User> by input number
    **/
    public static List<User> create(Integer userNumber) {
        List<User> users = new List<User>();
        for (Integer i = 0; i < userNumber; i++) {
            users.Add(
                new User(
                    ProfileId = getDefaultProfileId(),
                    LastName = GENERAL_TestUtils.randomSelect(lastNames),
                    Email = 'testuser@testmail.com.' + DateTime.now().getTime(),
                    Username = 'testuser@testdomain.com.' + DateTime.now().getTime(),
                    CompanyName = GENERAL_TestUtils.randomSelect(companies),
                    Title = GENERAL_TestUtils.randomSelect(titles),
                    Alias = GENERAL_TestUtils.generateRandomString(8),
                    TimeZoneSidKey = 'America/Los_Angeles',
                    EmailEncodingKey = 'UTF-8',
                    LanguageLocaleKey = 'en_US',
                    LocaleSidKey = 'en_US'
                )
            );
        }
        return users;
    }
}
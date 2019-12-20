/***************************************************************
* This class contains test methods for the UserSelector class
***************************************************************/

@isTest
public without sharing class UserSelectorTest {

    @isTest
    static void selectByIdWithDynamicFieldList() {
        User user = GENERAL_TestUserFactory.createByNumber(1)[0];
        List<String> fields = new List<String> {'EmailEncodingKey', 'LanguageLocaleKey' };
        List<User> selectedUsers = new UserSelector().selectById(user.Id, fields);
        System.assert(String.isNotBlank(selectedUsers[0].EmailEncodingKey),
            'EmailEncodingKey field should be in the response');
        System.assert(String.isNotBlank(selectedUsers[0].LanguageLocaleKey),
            'LanguageLocaleKey field should be in the response');
    }

    @isTest
    static void selectByIdWithDynamicFieldString() {
        User user = GENERAL_TestUserFactory.createByNumber(1)[0];
        String stringFields = 'EmailEncodingKey,LanguageLocaleKey';
        List<User> selectedUsers = new UserSelector().selectById(user.Id, stringFields);
        System.assert(String.isNotBlank(selectedUsers[0].EmailEncodingKey),
            'EmailEncodingKey field should be in the response');
        System.assert(String.isNotBlank(selectedUsers[0].LanguageLocaleKey),
            'LanguageLocaleKey field should be in the response');
    }
}
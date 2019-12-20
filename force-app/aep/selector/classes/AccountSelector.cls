/************************************************************************
* This class contains methods for generating query to the Account object
************************************************************************/

public with sharing class AccountSelector extends GENERAL_SObjectSelector implements GENERAL_DynamicFieldSelector {

    public SObjectType getSObjectType() {
        return Account.SObjectType;
    }

    /**
     * Default fields of Account object
    **/
    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField> {
            Account.Id,
            Account.OwnerId,
            Account.Type,
            Account.TravelAgency__c
        };
    }

    /**
     * This method selects account by its id (default fields)
    **/
    public List<Account> selectById(Id id) {
        return Database.query(
            newQueryFactory()
                .setCondition('Id = :id')
                .ToSOQl()
            );
    }

    /**
     * This method selects account by their ids (default fields)
    **/
    public List<Account> selectById(Set<Id> idSet) {
        return Database.query(
            newQueryFactory()
                .setCondition('Id IN :idSet')
                .setOrdering('Id', fflib_QueryFactory.SortOrder.ASCENDING)
                .ToSOQl()
            );
    }

    /**
     * This method selects account by its id (dynamic fields via list)
    **/
    public List<Account> selectById(Id id, List<String> fields) {
        fflib_QueryFactory query = createDynamicFieldQuery(fields);
        query.setCondition('Id = :id');
        return Database.query(query.ToSOQl());
    }

    /**
     * This method selects account by its id (dynamic fields via string)
    **/
    public List<Account> selectById(Id id, String stringFields) {
        fflib_QueryFactory query = createDynamicFieldQuery(stringFields);
        query.setCondition('Id = :id');
        return Database.query(query.ToSOQl());
    }

    /**
     * This method selects accounts by the travel agency Id
    **/
    public List<Account> selectByTravelAgencyId(Id travelAgencyId) {
        return Database.query(
            newQueryFactory()
                .setCondition('TravelAgency__c = :travelAgencyId')
                .ToSOQl()
            );
    }

    /**
     * This method selects accounts by the travel agency Id
    **/
    public List<Account> selectByTravelAgencyIdSet(Set<Id> travelAgencyIdSet) {
        return Database.query(
            newQueryFactory()
                .setCondition('TravelAgency__c IN :travelAgencyIdSet')
                .ToSOQl()
            );
    }

    /**
     * This method selects accounts by the travel agency name
    **/
    public List<Account> selectByTravelAgencyName(String travelAgencyName) {
        return Database.query(
            newQueryFactory()
                .selectField('TravelAgency__r.Name')
                .setCondition('TravelAgency__r.Name = :travelAgencyName')
                .ToSOQl()
            );
    }

    /**
     * This method selects accounts by the travel agency level
    **/
    public List<Account> selectByTravelAgencyLevel(String level) {
        return Database.query(
            newQueryFactory()
                .selectField('TravelAgency__r.Level__c')
                .setCondition('TravelAgency__r.Level__c = :level')
                .ToSOQl().replaceAll('TravelAgency__r.Level__c', 'toLabel(TravelAgency__r.Level__c)')
            );
    }
}
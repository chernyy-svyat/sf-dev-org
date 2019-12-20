/*********************************************************************************
* This class contains methods for generating query to the Accommodation__c object
*********************************************************************************/

public with sharing class AccommodationSelector extends GENERAL_SObjectSelector implements GENERAL_DynamicFieldSelector {

    public SObjectType getSObjectType() {
        return Accommodation__c.SObjectType;
    }

    /**
     * Default fields of Accommodation__c object
    **/
    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField> {
            Accommodation__c.Id,
            Accommodation__c.Name,
            Accommodation__c.Address__c,
            Accommodation__c.Location__Latitude__s,
            Accommodation__c.Location__Longitude__s,
            Accommodation__c.PhotoUrl__c
        };
    }

    /**
     * This method selects accommodations by its id (dynamic fields via list)
    **/
    public List<Accommodation__c> selectById(Id id, List<String> fields) {
        fflib_QueryFactory query = createDynamicFieldQuery(fields);
        query.setCondition('Id = :id');
        return Database.query(query.ToSOQl());
    }

    /**
     * This method selects accommodations by its id (dynamic fields via string)
    **/
    public List<Accommodation__c> selectById(Id id, String stringFields) {
        fflib_QueryFactory query = createDynamicFieldQuery(stringFields);
        query.setCondition('Id = :id');
        return Database.query(query.ToSOQl());
    }

    /**
     * This method selects accommodation by its id (all fields)
    **/
    public List<Accommodation__c> selectByIdWithFullFieldset(Id id) {
        return Database.query(
            newQueryFactory()
                .setCondition('Id = :id')
                .selectFieldSet(GENERAL_FieldSetHelper.getFieldSet('Accommodation', 'Full'))
                .ToSOQl()
            );
    }

    /**
     * This method selects accommodations by their ids (all fields)
    **/
    public List<Accommodation__c> selectByIdWithFullFieldset(Set<Id> idSet) {
        return Database.query(
            newQueryFactory()
                .setCondition('Id IN :idSet')
                .selectFieldSet(GENERAL_FieldSetHelper.getFieldSet('Accommodation', 'Full'))
                .ToSOQl()
            );
    }

    /**
     * This method selects all accommodations (default fields)
    **/
    public List<Accommodation__c> selectAll() {
        return Database.query(
            newQueryFactory()
                .ToSOQl()
            );
    }

    /**
     * This method selects all accommodations (all fields)
    **/
    public List<Accommodation__c> selectAllWithFullFieldset() {
        return Database.query(
            newQueryFactory()
                .selectFieldSet(GENERAL_FieldSetHelper.getFieldSet('Accommodation', 'Full'))
                .ToSOQl()
            );
    }

    /**
     * This method searches all accommodations by word via SOSL query
    **/
    public List<Accommodation__c> search(String word, String fieldSetName) {
        List<Accommodation__c> acmList = new List<Accommodation__c>();
        String searchquery = String.format('FIND \'{\'*{0}*\'}\' IN ALL FIELDS RETURNING Accommodation__c({1})',
                   new String[] { word, GENERAL_FieldSetHelper.getFieldsString('Accommodation', fieldSetName)});
        List<List<Accommodation__c>> searchList = System.search.query(searchquery);
        if (searchList[0].size() > 0) acmList = searchList[0];
        return acmList;
    }
}

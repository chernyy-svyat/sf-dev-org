/*********************************************************************
* This class contains methods for generating query to the User object
*********************************************************************/

public with sharing class UserSelector extends GENERAL_SObjectSelector implements GENERAL_DynamicFieldSelector {

    public SObjectType getSObjectType() {
        return User.SObjectType;
    }

    /**
     * Default fields of User object
    **/
    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField> {
            User.Id,
            User.Username,
            User.ProfileId,
            User.Alias,
            User.CompanyName
        };
    }

    /**
     * This method selects User by its id (dynamic fields via list)
    **/
    public List<User> selectById(Id id, List<String> fields) {
        fflib_QueryFactory query = createDynamicFieldQuery(fields);
        query.setCondition('Id = :id');
        return Database.query(query.ToSOQl());
    }

    /**
     * This method selects User by its id (dynamic fields via string)
    **/
    public List<User> selectById(Id id, String stringFields) {
        fflib_QueryFactory query = createDynamicFieldQuery(stringFields);
        query.setCondition('Id = :id');
        return Database.query(query.ToSOQl());
    }

    /**
     * This method selects User by its Account Id
    **/
    public List<User> selectByAccountIdSet(Set<Id> accountIdSet) {
         return Database.query(
            newQueryFactory()
                .setCondition('AccountId IN :accountIdSet')
                .ToSOQl()
            );
    }
}
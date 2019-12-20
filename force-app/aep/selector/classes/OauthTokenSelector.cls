/***********************************************************************
* This class contains methods to generate query to the OauthToken object
***********************************************************************/

public with sharing class OauthTokenSelector extends GENERAL_SObjectSelector {

    public SObjectType getSObjectType() {
        return OauthToken.SObjectType;
    }

    /**
     * Default fields of OauthToken object
    **/
    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField> {
            OauthToken.Id,
            OauthToken.userId,
            OauthToken.DeleteToken
        };
    }

    /**
     * This method selects the tokens by their user ids
    **/
    public List<OauthToken> selectLastByUserIdSet(Set<Id> userIdSet) {
        return Database.query(
            newQueryFactory()
                .setCondition('userId IN :userIdSet')
                .setOrdering('LastUsedDate', fflib_QueryFactory.SortOrder.DESCENDING)
                .toSOQL());
    }
}
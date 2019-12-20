/**********************************************************************************
* This class contains methods for generating query to the TourSaleStatus__c object
**********************************************************************************/

public with sharing class TourSaleStatusSelector extends GENERAL_SObjectSelector {

    public SObjectType getSObjectType() {
        return TourSaleStatus__c.SObjectType;
    }

    /**
     * Defaulf fields of TourSaleStatus__c object
    **/
    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField> {
            TourSaleStatus__c.Id,
            TourSaleStatus__c.Price__c,
            TourSaleStatus__c.TotalPrice__c,
            TourSaleStatus__c.Status__c
        };
    }

    /**
     * selectByTourId method selects TourSaleStatus__c by its Tour Id
    **/
    public List<TourSaleStatus__c> selectByTourId(Id tourId) {
        return Database.query(
            newQueryFactory()
                .setCondition('Tour__c = :tourId')
                .ToSOQl()
            );
    }
}
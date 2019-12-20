/*********************************************************************
* This class contains methods for generating query to the Tour object
*********************************************************************/

public with sharing class TourSelector extends GENERAL_SObjectSelector {

    public SObjectType getSObjectType() {
        return Tour__c.SObjectType;
    }

    /**
     * Defaulf fields of Tour__c object
    **/
    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField> {
            Tour__c.Id,
            Tour__c.BeginDate__c,
            Tour__c.EndDate__c,
            Tour__c.GuestsNumber__c,
            Tour__c.Visa__c
        };
    }

    /**
     * This method selects Tour__c by its flight PNR
    **/
    public List<Tour__c> selectByFlightPNR(String pnr) {
        List<TourFlight__c> tfList = [SELECT Tour__c FROM TourFlight__c WHERE TourFlight__c.Flight__r.PNR__c = :pnr];
        Set<Id> idSet = new Set<Id>();
        for (TourFlight__c tf : tfList) idSet.Add(tf.Tour__c);
        return Database.query(
            newQueryFactory()
                .setCondition('Id IN :idSet')
                .ToSOQl()
            );
    }
}
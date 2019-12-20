/**************************************************************************
* This class contains methods for generating query to the Flight__c object
**************************************************************************/

public with sharing class FlightSelector extends GENERAL_SObjectSelector {

    public FlightSelector() {}

    public FlightSelector(String fieldSetName) {
        super(fieldSetName);
    }

    public SObjectType getSObjectType() {
        return Flight__c.SObjectType;
    }

    public override SObjectType genGetSObjectType() {
        return Flight__c.SObjectType;
    }

    /**
     * Default fields of Flight__c object
    **/
    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField> {
            Flight__c.Id,
            Flight__c.Departure__c,
            Flight__c.Destination__c,
            Flight__c.FlightNumber__c,
            Flight__c.Airlines__c,
            Flight__c.PNR__c
        };
    }

    // public List<Schema.FieldSet> getSObjectFieldSetList()
    // {
    //     if(!String.isBnank(this.fieldSetName))
    //         return new List<Schema.FieldSet> {
    //             GENERAL_FieldSetHelper.getFieldSet(
    //                 this.getSObjectType().getDescribe().getLabel(),
    //                 this.fieldSetName
    //             )
    //         };
    //     return null;
    // }

    /**
     * This method selects the flights by their PNR codes
    **/
    public List<Flight__c> selectByPNR(String pnr) {
        return Database.query(
            newQueryFactory()
                .setCondition('PNR__c = :pnr')
                .ToSOQl()
            );
    }

    /**
     * This method selects the flights by AirLines name
    **/
    public List<Flight__c> selectByAirlines(String airLines) {
        String airLinesName = airLines + '%';
        return Database.query(
            newQueryFactory()
                .setCondition('Airlines__c LIKE :airLinesName')
                .ToSOQl()
            );
    }
}
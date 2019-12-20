/******************************************************************************
* This class is for facilitating actions occuring on the TravelAgency__c object
******************************************************************************/

public with sharing class TravelAgencyDomain extends fflib_SObjectDomain {

    /**
     * Constructor to the TravelAgencyDomain class
    **/
    public TravelAgencyDomain(List<TravelAgency__c> travelAgencyList) {
        super((List<SObject>) travelAgencyList);
    }

    /**
     * This method is used to set the TravelAgency__c.Status__c
     * depending on the TravelAgency__c.Level__c
    **/
    public override void onBeforeUpdate(Map<Id, SObject> oldMap) {
        try {
            new TravelAgencyService().setStatusByLevel((List<TravelAgency__c>)Records);
        } catch (Exception ex) {
            System.debug(LoggingLevel.ERROR, ex.getMessage());
        }
    }

    /**
     * This method is used to check the TravelAgency__c.Status__c
     * for futher access token revoking
    **/
    public override void onAfterUpdate(Map<Id, SObject> oldMap) {
        try {
            new TravelAgencyService().checkBlockedTravelAgency((List<TravelAgency__c>)Records);
        } catch (Exception ex) {
            System.debug(LoggingLevel.ERROR, ex.getMessage());
        }
    }

    /**
     * An inner class to the TravelAgencyDomain class, supported here for test purposes
    **/
    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new TravelAgencyDomain(sObjectList);
        }
    }
}
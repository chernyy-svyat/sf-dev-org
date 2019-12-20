/********************************************************************************
* This Trigger class is for the TravelAgency__c object
********************************************************************************/

trigger TravelAgencyTrigger on TravelAgency__c (before update, after update) {
    TravelAgencyDomain.triggerHandler(TravelAgencyDomain.class);
}

/********************************************************************************
* This Trigger class is for the Tour__c object
********************************************************************************/

trigger TourTrigger on Tour__c (after update) {
    TourDomain.triggerHandler(TourDomain.class);
}

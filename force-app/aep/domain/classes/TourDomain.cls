/***********************************************************************
* This class is for facilitating actions occuring on the Tour__c object
***********************************************************************/

public with sharing class TourDomain extends fflib_SObjectDomain {

    /**
     * Constructor to the TourDomain class
    **/
    public TourDomain(List<Tour__c> tourList) {
        super((List<SObject>) tourList);
    }

    /**
     * This method is used to check guest's number
     * for futher recalculating tour price
    **/
    public override void onAfterUpdate(Map<Id, SObject> oldMap) {
        try {
            new TourService().checkGuestsNumber((List<Tour__c>)Records, (Map<Id, Tour__c>)oldMap);
        } catch (Exception ex) {
            System.debug(LoggingLevel.ERROR, ex.getMessage());
        }
    }

    /**
     * An inner class to the TourDomain class, supported here for test purposes
    **/
    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new TourDomain(sObjectList);
        }
    }
}
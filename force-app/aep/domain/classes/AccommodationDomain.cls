/********************************************************************************
* This class is for facilitating actions occuring on the Accommodation__c object
********************************************************************************/

public with sharing class AccommodationDomain extends fflib_SObjectDomain {

    /**
     * Constructor to the AccommodationDomain class
    **/
    public AccommodationDomain(List<Accommodation__c> accommodationList) {
        super((List<SObject>) accommodationList);
    }

    /**
     * An inner class to the AccommodationDomain class, supported here for test purposes
    **/
    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new AccommodationDomain(sObjectList);
        }
    }
}
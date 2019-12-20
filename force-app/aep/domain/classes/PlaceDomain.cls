/************************************************************************
* This class is for facilitating actions occuring on the Place__c object
************************************************************************/

public with sharing class PlaceDomain extends fflib_SObjectDomain {

    /**
     * Constructor to the PlaceDomain class
    **/
    public PlaceDomain(List<Place__c> placeList) {
        super((List<SObject>) placeList);
    }

    /**
     * An inner class to the PlaceDomain class, supported here for test purposes
    **/
    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new PlaceDomain(sObjectList);
        }
    }
}
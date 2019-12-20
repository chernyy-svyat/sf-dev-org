/*************************************************************************
* This class is for facilitating actions occuring on the Flight__c object
*************************************************************************/

public with sharing class FlightDomain extends fflib_SObjectDomain {

    /**
     * Constructor to the FlightDomain class
    **/
    public FlightDomain(List<Flight__c> flightList) {
        super((List<SObject>) flightList);
    }

    /**
     * An inner class to the FlightDomain class, supported here for test purposes
    **/
    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new FlightDomain(sObjectList);
        }
    }
}
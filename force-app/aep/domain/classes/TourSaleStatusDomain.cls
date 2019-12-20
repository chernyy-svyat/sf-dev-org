/********************************************************************************
* This class is for facilitating actions occuring on the TourSaleStatus__c object
*********************************************************************************/

public with sharing class TourSaleStatusDomain extends fflib_SObjectDomain {

    /**
     * Constructor to the TourSaleStatusDomain class
    **/
    public TourSaleStatusDomain(List<TourSaleStatus__c> tourSaleStatusList) {
        super((List<SObject>) tourSaleStatusList);
    }

    /**
     * An inner class to the TourSaleStatusDomain class, supported here for test purposes
    **/
    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new TourSaleStatusDomain(sObjectList);
        }
    }
}
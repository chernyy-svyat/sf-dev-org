/***************************************************************************
* This class is for facilitating actions occuring on the Transfer__c object
***************************************************************************/

public with sharing class TransferDomain extends fflib_SObjectDomain {

    /**
     * Constructor to the TransferDomain class
    **/
    public TransferDomain(List<Transfer__c> transferList) {
        super((List<SObject>) transferList);
    }

    /**
     * An inner class to the TransferDomain class, supported here for test purposes
    **/
    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new TransferDomain(sObjectList);
        }
    }
}
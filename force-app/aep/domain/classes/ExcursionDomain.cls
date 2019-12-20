/****************************************************************************
* This class is for facilitating actions occuring on the Excursion__c object
****************************************************************************/

public with sharing class ExcursionDomain extends fflib_SObjectDomain {

    /**
     * Constructor to the ExcursionDomain class
    **/
    public ExcursionDomain(List<Excursion__c> excursionList) {
        super((List<SObject>) excursionList);
    }

    /**
     * An inner class to the ExcursionDomain class, supported here for test purposes
    **/
    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new ExcursionDomain(sObjectList);
        }
    }
}
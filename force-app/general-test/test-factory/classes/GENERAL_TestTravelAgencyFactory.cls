/********************************************************************
* This class is for generating test data for TravelAgency__C object
********************************************************************/

@isTest
public with sharing class GENERAL_TestTravelAgencyFactory {

    /**
     * This inner class is for changing the delault field values
     * Setter: withName, withLevel, withActivityStatus (return this)
     * Getter: get (return TravelAgency__c)
    **/
    public class Single {

        private TravelAgency__c travelAgency;

        public Single withName(String value) {
            try {
                this.travelAgency.Name = value;
            } catch (Exception ex) {
                System.debug('Incorrect Name value in method withName: ' + ex.getMessage());
            }
            return this;
        }

        public Single withLevel(String value) {
            try {
                this.travelAgency.Level__c = value;
            } catch (Exception ex) {
                System.debug('Incorrect Level__c value in method withLevel: ' + ex.getMessage());
            }
            return this;
        }

        public Single withActivityStatus(String value) {
            try {
                this.travelAgency.ActivityStatus__c = value;
            } catch (Exception ex) {
                System.debug('Incorrect ActivityStatus__c value in method withActivityStatus: ' + ex.getMessage());
            }
            return this;
        }

        public TravelAgency__c get() {
            insert this.travelAgency;
            return this.travelAgency;
        }
    }

    /**
     * This method creates only one TravelAgency__c instance
     * For futher use TravelAgency__c instance it is necessary to call get() method
     * (createSingle().get())
    **/
    public static Single createSingle() {
        Single single = new Single();
        single.travelAgency = GENERAL_TestTravelAgencyCreator.create(1)[0];
        return single;
    }

    /**
     * This method creates List<TravelAgency__c> by input number
    **/
    public static List<TravelAgency__c> createByNumber(Integer travelAgencyNumber) {
        List<TravelAgency__c> travelAgencies = GENERAL_TestTravelAgencyCreator.create(travelAgencyNumber);
        insert travelAgencies;
        return travelAgencies;
    }
}
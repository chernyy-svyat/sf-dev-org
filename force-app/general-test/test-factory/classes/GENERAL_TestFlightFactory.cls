/********************************************************************
* This class is for generating test data for Flight__c object
********************************************************************/

@isTest
public with sharing class GENERAL_TestFlightFactory {

    /**
     * This inner class is for changing the delault field values
     * Setter: withProfile (return this)
     * Getter: get (return User)
    **/
    public class Single {

        public Flight__c flight;

        public Single withPNR(String value) {
            try {
                this.flight.PNR__c = value;
            } catch (Exception ex) {
                System.debug('Incorrect PRN__c value in method withPNR: ' + ex.getMessage());
            }
            return this;
        }

        public Flight__c get() {
            insert this.flight;
            return this.flight;
        }
    }

    /**
     * This method creates only one Flight__c instance
     * For futher use Flight__c instance it is necessary to call get() method
     * (createSingle().get())
    **/
    public static Single createSingle() {
        Single single = new Single();
        single.flight = GENERAL_TestFlightCreator.create(1)[0];
        return single;
    }

    /**
     * This method creates List<Flight__c> by input number
    **/
    public static List<Flight__c> createByNumber(Integer flightNumber) {
        List<Flight__c> flights = GENERAL_TestFlightCreator.create(flightNumber);
        insert flights;
        return flights;
    }
}
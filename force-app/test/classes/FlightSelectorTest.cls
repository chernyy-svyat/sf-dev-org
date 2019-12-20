/***************************************************************
* This class contains test methods for the FlightSelector class
***************************************************************/

@isTest
public with sharing class FlightSelectorTest {

    @isTest
    static void selectByPNR() {
        Flight__c flight =
            GENERAL_TestFlightFactory.createSingle()
                .withPNR('D4D4D4')
                .get();
        List<Flight__c> flights = new FlightSelector('Full').selectByPNR('D4D4D4');
        System.debug(flights[0]);
        System.assertEquals(flights[0].PNR__c, 'D4D4D4', 'PNR should be D4D4D4');
        System.assertEquals(flights.size(), 1, 'Size should meet the expectations (1)');
    }
}
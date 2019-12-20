/********************************************************************
* This class is for creating instances of Flight__c object
********************************************************************/

@isTest
public with sharing class GENERAL_TestFlightCreator {

    /**
     * List of available test aircrafts
    **/
    public static List<String> aircrafts = new List<String> {
        'Boeing 787-8', 'Boeing 787-9', 'Boeing 787-10',
        'Airbus A380-800', 'Airbus A380-900', 'Airbus A380-10000'
    };

    /**
     * List of available test departures codes
    **/
    public static List<String> departures = new List<String> {
        'SVO', 'DME', 'VKO'
    };

    /**
     * List of available test destinations codes
    **/
    public static List<String> destinations = new List<String> {
        'DXB', 'DHF', 'DIA'
    };

    /**
     * List of available test airlines
    **/
    public static List<String> airlines = new List<String> {
        'Emirates', 'Etihad', 'Qatar Airways'
    };

    /**
     * List of available test PNR codes
    **/
    public static List<String> PNRs = new List<String> {
        'A1A1A1', 'B2B2B2', 'C3C3C3'
    };

    /**
     * This method creates List<Flight__c> by input number
    **/
    public static List<Flight__c> create(Integer flightNumber) {
        List<Flight__c> flights = new List<Flight__c>();
        for (Integer i = 0; i < flightNumber; i++) {
            flights.Add(
                new Flight__c(
                    Name = 'Flight' + DateTime.now().getTime(),
                    Aircraft__c = GENERAL_TestUtils.randomSelect(aircrafts),
                    Departure__c = GENERAL_TestUtils.randomSelect(departures),
                    Destination__c = GENERAL_TestUtils.randomSelect(destinations),
                    DepartureTime__c = DateTime.now(),
                    ArrivalTime__c = DateTime.now(),
                    Airlines__c = GENERAL_TestUtils.randomSelect(airlines),
                    PNR__c = GENERAL_TestUtils.randomSelect(PNRs)
                )
            );
        }
        return flights;
    }
}
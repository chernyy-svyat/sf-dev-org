/********************************************************************
* This class is for creating instances of TravelAgency__c object
********************************************************************/

@isTest
public with sharing class GENERAL_TestTravelAgencyCreator {

    /**
     * List of available test activity statuses
    **/
    public static List<String> activityStatuses = new List<String> {
        'Active', 'Blocked', 'Limited Access'
    };

    /**
     * List of available test levels
    **/
    public static List<String> levels = new List<String> {
        'Level A', 'Level B', 'Level C'
    };

    /**
     * This method creates List<TravelAgency__c> by input number
    **/
    public static List<TravelAgency__c> create(Integer travelAgencyNumber) {
        List<TravelAgency__c> travelAgencies = new List<TravelAgency__c>();
        for (Integer i = 0; i < travelAgencyNumber; i++) {
            travelAgencies.Add(
                new TravelAgency__c(
                    Name = 'TravelAgency' + DateTime.now().getTime(),
                    ActivityStatus__c = GENERAL_TestUtils.randomSelect(activityStatuses),
                    Level__c = GENERAL_TestUtils.randomSelect(levels)
                )
            );
        }
        return travelAgencies;
    }
}
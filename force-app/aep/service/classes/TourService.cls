/*******************************************************************
* This class contains methods for working with the Tour__c object
*******************************************************************/

public with sharing class TourService {

    /**
     * This method called from TourTrigger wher guests count changed
    **/
    public void checkGuestsNumber(List<Tour__c> newRecordsList, Map<Id, Tour__c> oldRecordsMap) {
        try {
            for (Tour__c newTour : newRecordsList) {
                if (oldRecordsMap == null) continue;
                Tour__c oldTour = oldRecordsMap.get(newTour.Id);
                if (oldTour != null && oldTour.GuestsNumber__c != newTour.GuestsNumber__c) {
                    TourSaleStatusService.recalcTourPrice(newTour.Id, (Integer)oldTour.GuestsNumber__c, (Integer)oldTour.GuestsNumber__c);
                }
            }
        } catch (Exception ex) {
            System.debug(LoggingLevel.ERROR, ex.getMessage());
        }
    }
}
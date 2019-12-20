/***************************************************************************
* This class contains methods for working with the TourSaleStatus__c object
***************************************************************************/

public with sharing class TourSaleStatusService {

    /**
     * This method recalculates the tour price according to the guests number
    **/
    public static void recalcTourPrice(Id tourId, Integer oldGuestsNumber, Integer newGuestsNumber) {
        try {
            List<TourSaleStatus__c> tssList = new TourSaleStatusSelector().selectByTourId(tourId);
            TourSaleStatus__c tourSaleStatus = tssList[0];
            tourSaleStatus.Price__c = tourSaleStatus.Price__c / oldGuestsNumber * newGuestsNumber;
            update tourSaleStatus;
        } catch (Exception ex) {
            System.debug(LoggingLevel.ERROR, ex.getMessage());
        }
    }
}
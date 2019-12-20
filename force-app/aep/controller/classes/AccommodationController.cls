/***************************************************************************
* AccommodationController is used to get or search info about Accommodations
***************************************************************************/

public with sharing class AccommodationController {

    @AuraEnabled(cacheable=true)
    public static List<Accommodation__c> getAllAccommodations() {
        try {
            return AccommodationService.getAllAccommodations('Full');
        } catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Accommodation__c> searchAccommodationByWord(String searchWord) {
        try {
            return AccommodationService.searchByWord(searchWord, 'Full');
        } catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }
}
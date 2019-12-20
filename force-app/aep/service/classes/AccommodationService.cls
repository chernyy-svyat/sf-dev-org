/****************************************************************************
* This class contains methods for working with the Accommodation__c object
****************************************************************************/

public with sharing class AccommodationService {

    public static List<Accommodation__c> getAllAccommodations() {
        return getAllAccommodationsWithFieldset('');
    }

    public static List<Accommodation__c> getAllAccommodations(String fieldsetName) {
        return getAllAccommodationsWithFieldset(fieldsetName);
    }

    private static List<Accommodation__c> getAllAccommodationsWithFieldset(String fieldsetName) {
        AccommodationSelector acmSelector = new AccommodationSelector();
        if (String.isNotBlank(fieldsetName) && fieldsetName.equals('Full'))
            return acmSelector.selectAllWithFullFieldset();
        return acmSelector.selectAll();
    }

    public static List<Accommodation__c> searchByWord(String word, String fieldsetName) {
        if (String.isBlank(word))
            return getAllAccommodations(fieldsetName);
        AccommodationSelector acmSelector = new AccommodationSelector();
        return acmSelector.search(word, fieldsetName);
    }
}
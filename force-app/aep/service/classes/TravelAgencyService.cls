/*************************************************************************
* This class contains methods for working with the TravelAgency__c object
*************************************************************************/

public with sharing class TravelAgencyService {

    /**
     * This is an example of Level and Status dependency
    **/
    private final Map<String, String> levelStatusMapping = new Map<String, String> {
        'Level A' => 'Active',
        'Level B' => 'Active',
        'Level C' => 'Limited Access',
        'Level D' => 'Limited Access',
        'Level E' => 'Limited Access',
        'Level F' => 'Blocked'
    };

    public void setStatusByLevel(List<TravelAgency__c> newRecordsList) {
        try {
            for(TravelAgency__c ta : newRecordsList) {
                ta.ActivityStatus__c = levelStatusMapping.get(ta.Level__c);
            }
        } catch (Exception ex) {
            System.debug(LoggingLevel.ERROR, ex.getMessage());
        }
    }

    /**
     * This method checks Blocked status for futher calling revoke method
    **/
    public void checkBlockedTravelAgency(List<TravelAgency__c> newRecordsList) {
        Set<Id> taBlockedSet = new Set<Id>();
        try {
            for(TravelAgency__c ta : newRecordsList) {
                if (ta.ActivityStatus__c == 'Blocked')
                    taBlockedSet.add(ta.Id);
            }
            if (taBlockedSet.size() > 0)
                revokeTravelAgencyToken(taBlockedSet);
        } catch (Exception ex) {
            System.debug(LoggingLevel.ERROR, ex.getMessage());
        }
    }

    /**
     * This method starts revoking tokens for blocked Travel agencies
    **/
    public void revokeTravelAgencyToken(Set<Id> taIdSet) {
        if (taIdSet.size() > 0)
            System.enqueueJob(new OauthTokenRevokeQueueable(taIdSet));
    }

}
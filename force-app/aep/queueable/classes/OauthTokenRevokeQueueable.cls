/*******************************************************
* This Queueable class constains methods
* to start revoke access tokens job query
*******************************************************/

public class OauthTokenRevokeQueueable implements Queueable, Database.AllowsCallouts {

    public Set<Id> travelAgencyIds;
    public List<OauthToken> oauthTokens;

    /**
     * Constructor to set the travelAgencyIds
    **/
    public OauthTokenRevokeQueueable(Set<Id> travelAgencyIds) {
        this.travelAgencyIds = travelAgencyIds;
    }

    /**
     * Constructor to set the oauthTokens
    **/
    public OauthTokenRevokeQueueable(List<OauthToken> oauthTokens) {
        this.oauthTokens = oauthTokens;
    }


    public void execute(QueueableContext context) {
        if (Limits.getQueueableJobs() > 50) return; // TODO: Limit Handler

        // if no oauth tokens then travelAgency Ids are used
        if(this.oauthTokens == null || this.oauthTokens.isEmpty()) {
            if (this.travelAgencyIds.size() == 0) return; // TODO: Logging

            List<Account> accounts = new AccountSelector().selectByTravelAgencyIdSet(this.travelAgencyIds);
            Set<Id> accountIdSet = (new Map<Id, Account>(accounts)).keySet();

            List<User> users = new UserSelector().selectByAccountIdSet(accountIdSet);
            Set<Id> userIdSet = (new Map<Id, User>(users)).keySet();

            this.oauthTokens = new OauthTokenSelector().selectLastByUserIdSet(userIdSet);
        }
        Integer counter = 0;
        for (OauthToken token : this.oauthTokens) {
            OauthTokenService.revokeAccessToken(String.valueOf(token.DeleteToken));
            // Limit handler to start new job with next 100 oauth tokens
            if (++counter > 100) {
                List<OauthToken> slicedOauthTokens =
                    (List<OauthToken>)GENERAL_Utils.removeFirst(this.oauthTokens, 100);
                System.enqueueJob(new OauthTokenRevokeQueueable(slicedOauthTokens));
                break;
            }
        }
    }
}
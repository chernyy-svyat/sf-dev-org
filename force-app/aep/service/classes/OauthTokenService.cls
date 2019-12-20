/********************************************************************
* This class contains methods for working with the OauthToken object
********************************************************************/

public with sharing class OauthTokenService {
    public static  String revokeUri {
        // Getting the salesforce instance host and Setting the revoke endpoint
        get {return URL.getSalesforceBaseUrl().toExternalForm() + '/services/oauth2/revoke?token=';}
    }

    @future(callout=true)
    public static void revokeAccessToken(String deleteToken) {
        // Encoding token
        String encodedToken = EncodingUtil.URLENCODE(deleteToken,'UTF-8');
        // Adding the token parameter to the endpoint
        String revokeEndPoint = revokeUri + encodedToken;
        // Creating and sending request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(revokeEndPoint);
        request.setHeader('Content-Type','application/x-www-form-urlencoded');
        request.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(request);
        System.debug('Response ' + response);
    }
}
# Salesforce dev org

**Travis build:** [![Build Status](https://travis-ci.org/chernyy-svyat/sf-dev-org.svg?branch=develop)](https://travis-ci.org/chernyy-svyat/sf-dev-org)

This organization is an example of using an Apex Enterprise Patterns based on [FFLib Apex Common](https://github.com/apex-enterprise-patterns/fflib-apex-common "FFLib Apex Common")

##### Apex Enterprise Patterns
- _Selector:_
	- [AccommodationSelector](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/aep/selector/classes/AccommodationSelector.cls "AccommodationSelector")
	- [TourFlightSelector](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/aep/selector/classes/TourFlightSelector.cls "TourFlightSelector")
	- [Other Selectors](https://github.com/chernyy-svyat/sf-dev-org/tree/develop/force-app/aep/selector/classes "Other Selectors")
- _Service:_
	- [AccommodationService](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/aep/service/classes/AccommodationService.cls "AccommodationService")
	- [TravelAgencyService](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/aep/service/classes/TravelAgencyService.cls "TravelAgencyService")
	- [OauthTokenService](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/aep/service/classes/OauthTokenService.cls "OauthTokenService")
	- [Other Services](https://github.com/chernyy-svyat/sf-dev-org/tree/develop/force-app/aep/selector/classes "Other Services")
- _Domain:_
	- [TravelAgencyDomain](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/aep/domain/classes/TravelAgencyDomain.cls "TravelAgencyDomain")
	- [TourDomain](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/aep/domain/classes/TourDomain.cls "TourDomain")
	- [Other Domains](https://github.com/chernyy-svyat/sf-dev-org/tree/develop/force-app/aep/domain/classes "Other Domains")
- _Controller:_
	-  [AccommodationController](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/aep/controller/classes/AccommodationController.cls "AccommodationController")

##### Test patterns
- [Test SObject Creator](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/general-test/test-sobject-creator/classes/GENERAL_TestUserCreator.cls "Test SObject Creator")
- [Test Factory](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/general-test/test-factory/classes/GENERAL_TestAccountFactory.cls "Test Factory")
- [Test Example](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/test/classes/AccountSelectorTest.cls "Test Example")

##### Helper/Utils
- [Fieldset Helper](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/general/classes/GENERAL_FieldSetHelper.cls "Fieldset Helper")
- [Common Utils](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/general/classes/GENERAL_Utils.cls "Common Utils")

##### Other
- [Queueable Example](https://github.com/chernyy-svyat/sf-dev-org/blob/develop/force-app/aep/queueable/classes/OauthTokenRevokeQueueable.cls "Queueable Example")

##### LWC App Example
[LWC Source](https://github.com/chernyy-svyat/sf-dev-org/tree/develop/force-app/main/default/lwc "LWC Source")
![](https://i.imgur.com/rvEaVw9.png)
![](https://i.imgur.com/dgf5Gxv.png)

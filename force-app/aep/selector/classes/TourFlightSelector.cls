/******************************************************************************
* This class contains methods for generating query to the TourFlight__c object
******************************************************************************/

public class TourFlightSelector extends GENERAL_SObjectSelector {

    public SObjectType getSObjectType() {
        return TourFlight__c.SObjectType;
    }

    /**
     * Default fields of TourFlight__c object
    **/
    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField> {
            TourFlight__c.Id,
            TourFlight__c.Tour__c,
            TourFlight__c.Flight__c
        };
    }

    /**
     * This method selects TourFlight by its flight PNR
    **/
    public List<TourFlight__c> selectByFlightPNR(String pnr) {
        String flightRelationship = TourFlight__c.Flight__c.getDescribe().getRelationshipName();
        return Database.query(
            newQueryFactory()
                .setCondition(flightRelationship + '.PNR__c = :pnr')
                .ToSOQl()
            );
    }

    /**
     * This method selects TourFlights by their  flight Number
    **/
    public List<TourFlight__c> selectByFlightNumber(String flightNumber) {
        String flightRelationship = TourFlight__c.Flight__c.getDescribe().getRelationshipName();
        return Database.query(
            newQueryFactory()
                .setCondition(flightRelationship + '.FlightNumber__c = :flightNumber')
                .ToSOQl()
            );
    }

    /**
     * This method selects TourFlights by Tour ids
     * (subselect, need refactoring)
    **/
    public List<TourFlight__c> selectByTourId(Set<Id> idSet) {
        String flightRelationship = TourFlight__c.Flight__c.getDescribe().getRelationshipName();
        String tourRelationship = TourFlight__c.Tour__c.getDescribe().getRelationshipName();
        fflib_QueryFactory tourFlightQF = newQueryFactory()
            .setCondition('Tour__c in :idSet');

        Schema.FieldSet standardFlightFieldSet = GENERAL_FieldSetHelper.getFieldSet('Flight');
        Schema.FieldSet standardTourFieldSet = GENERAL_FieldSetHelper.getFieldSet('Tour');

        fflib_QueryFactory tourQF = new TourSelector()
            .addQueryFactorySubselect(tourFlightQF, tourRelationship)
            .selectFieldSet(standardTourFieldSet);

        fflib_QueryFactory flightQF = tourFlightQF.subSelectQuery(flightRelationship)
            .selectFieldSet(standardFlightFieldSet);

        return Database.query(tourFlightQF.ToSOQl());
    }
}
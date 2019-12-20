/***************************************************************************
* This class constains general methods to query SObject from other selectors
***************************************************************************/

public abstract class GENERAL_SObjectSelector extends fflib_SObjectSelector {

    /**
     * This property creates query using List of fields
    **/
    private String fieldSetName = null;

    public GENERAL_SObjectSelector() {}

    public GENERAL_SObjectSelector(String fieldSetName) {
        super(true);
        this.fieldSetName = fieldSetName;
    }

    /**
     * This method uses to get the sObject type in an inherited class
    **/
    public virtual SObjectType genGetSObjectType() {
        return null;
    }

    /**
     * This overrided method uses to set the FieldSet to the queryFactory
     * in the current selector class
    **/
    public override List<Schema.FieldSet> getSObjectFieldSetList()
    {
        if(!String.isBlank(this.fieldSetName))
            return new List<Schema.FieldSet> {
                GENERAL_FieldSetHelper.getFieldSet(
                    genGetSObjectType().getDescribe().getLabel(),
                    this.fieldSetName
                )
            };
        return null;
    }

    /**
     * This method creates query using List of fields
    **/
    public virtual fflib_QueryFactory createDynamicFieldQuery(List<String> fields) {
        fflib_QueryFactory query = newQueryFactory();
        for (String f : fields) query.selectField(f);
        return query;
    }

    /**
     * This method creates query using string of fields enumeration
    **/
    public virtual fflib_QueryFactory createDynamicFieldQuery(String stringFields) {
        fflib_QueryFactory query = newQueryFactory();
        List<String> fields = stringFields.trim().split(',');
        for (String f : fields) query.selectField(f);
        return query;
    }
}
/********************************************************************
* This class is for storing general Fieldset help methods
********************************************************************/

public class GENERAL_FieldSetHelper {

    public static List<String> defaultFieldSets = new List<String> {
        'Standard', 'Full'
    };

    public static Schema.FieldSet getFieldSet(String objectName) {
        return getFieldSet(objectName, 'Standard');
    }

    public static Schema.FieldSet getFieldSet(String objectName, String fieldSetTypeName) {
        Schema.FieldSet fieldSet;
        fieldSetTypeName = setFieldSetName(objectName, fieldSetTypeName);
        switch on objectName {
            when 'Flight' {
                fieldSet = Schema.SObjectType.Flight__c.fieldsets.getMap().get(fieldSetTypeName);
            }
            when 'Tour' {
                fieldSet = Schema.SObjectType.Tour__c.fieldsets.getMap().get(fieldSetTypeName);
            }
            when 'Accommodation' {
                fieldSet = Schema.SObjectType.Accommodation__c.fieldsets.getMap().get(fieldSetTypeName);
            }
        }
        return fieldSet;
    }

    public static String getFieldsString(String objectName, String fieldSetTypeName) {
        List<Schema.FieldSetMember> fieldSetMembers;
        List<String> fields = new List<String>();
        fieldSetTypeName = setFieldSetName(objectName, fieldSetTypeName);
        switch on objectName {
            when 'Flight' {
                fieldSetMembers = Schema.SObjectType.Flight__c.fieldsets.getMap().get(fieldSetTypeName).getFields();
            }
            when 'Tour' {
                fieldSetMembers = Schema.SObjectType.Tour__c.fieldsets.getMap().get(fieldSetTypeName).getFields();
            }
            when 'Accommodation' {
                fieldSetMembers = Schema.SObjectType.Accommodation__c.fieldsets.getMap().get(fieldSetTypeName).getFields();
            }
        }
        for(Schema.FieldSetMember fm : fieldSetMembers) {
            fields.add(fm.getFieldPath());
        }
        return String.join(fields, ',');
    }

    public static String setFieldSetName(String objectName, String fieldSetTypeName) {
        String fieldSetForReturn = 'Standard' + objectName;
        if (defaultFieldSets.contains(fieldSetTypeName)) fieldSetForReturn = fieldSetTypeName + objectName;
        return fieldSetForReturn;
    }

}
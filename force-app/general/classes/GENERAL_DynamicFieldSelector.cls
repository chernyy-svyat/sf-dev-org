/***********************************************************************************
* This interface contains methods to generating query SObject with specified fields
***********************************************************************************/

public interface GENERAL_DynamicFieldSelector {

    /**
     * This method selects a SObject by its id using List of fields
    **/
    List<SObject> selectById(Id id, List<String> fields);

    /**
     * This method selects a SObject by its id using string of fields enumeration
    **/
    List<SObject> selectById(Id id, String stringFields);
}
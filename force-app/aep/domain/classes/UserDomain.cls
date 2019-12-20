/********************************************************************
* This class is for facilitating actions occuring on the User object
********************************************************************/

public with sharing class UserDomain extends fflib_SObjectDomain {

    /**
     * Constructor to the UserDomain class
    **/
    public UserDomain(List<User> userList) {
        super((List<SObject>) userList);
    }

    /**
     * An inner class to the UserDomain class, supported here for test purposes
    **/
    public class Constructor implements IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new UserDomain(sObjectList);
        }
    }
}
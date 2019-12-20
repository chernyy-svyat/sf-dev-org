/********************************************************************
* This class is for generating test data for User object
********************************************************************/

@isTest
public without sharing class GENERAL_TestUserFactory {

    /**
     * This inner class is for changing the delault field values
     * Setter: withProfile (return this)
     * Getter: get (return User)
    **/
    public class Single {

        public User user;

        public Single withProfile(String value) {
            try {
                Id prolileId = [SELECT Id FROM Profile WHERE Name = :value LIMIT 1].Id;
                this.user.ProfileId = prolileId;
            } catch (Exception ex) {
                System.debug('Incorrect ProlileId value in method withProfile: ' + ex.getMessage());
            }
            return this;
        }

        // User.Account field is not writeable yet
        //
        /*
        public Single withAccount(Account value) {
            try {
                this.user.AccountId = value.Id;
            } catch (Exception ex) {
                System.debug('Incorrect Account value in method withAccount: ' + ex.getMessage());
            }
            return this;
        }*/

        public User get() {
            insert this.user;
            return this.user;
        }
    }

    /**
     * This method creates only one User instance
     * For futher use User instance it is necessary to call get() method
     * (createSingle().get())
    **/
    public static Single createSingle() {
        Single single = new Single();
        single.user = GENERAL_TestUserCreator.create(1)[0];
        return single;
    }

    /**
     * This method creates List<User> by input number
    **/
    public static List<User> createByNumber(Integer userNumber) {
        List<User> users = GENERAL_TestUserCreator.create(userNumber);
        insert users;
        return users;
    }
}
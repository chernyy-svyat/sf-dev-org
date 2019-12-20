/********************************************************************
* This class is for storing general help TEST methods
********************************************************************/

@isTest
public with sharing class GENERAL_TestUtils {

    public static String CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';

    public static String randomSelect(List<String> objList) {
        Integer index = (Integer) Math.floor((objList.size() - 1) * Math.random());
        return objList[index];
    }

    public static Integer randomSelect(List<Integer> objList) {
        Integer index = (Integer) Math.floor((objList.size() - 1) * Math.random());
        return objList[index];
    }

    public static String generateRandomString(Integer length) {
        String randomString = '';
        while (randomString.length() < length) {
            Integer index = Math.mod(Math.abs(Crypto.getRandomInteger()), CHARS.length());
            randomString += CHARS.substring(index, index + 1);
        }
        return randomString;
    }
}
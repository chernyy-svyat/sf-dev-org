/********************************************************************
* This class is for storing general help methods
********************************************************************/

public with sharing class GENERAL_Utils {

    /**
     * This method gets the slice of list from the startIndex to the endIndex
    **/
    public static List<Object> slice(List<Object> objectList, Integer startIndex, Integer endIndex)
    {
        if (startIndex < 0) startIndex += objectList.size();
        if (endIndex < 0) endIndex += objectList.size();
        List<Object> slicedList = objectList.clone();
        for (Integer i = 0; i < startIndex; i++) slicedList.remove(0);
        Integer elements = endIndex - startIndex;
        while (slicedList.size() > elements) slicedList.remove(elements);
        return slicedList;
    }

    /**
     * This method removes first n elements from the list
    **/
    public static List<Object> removeFirst(List<Object> objectList, Integer length)
    {
        if (length < 0) length = 0;
        List<Object> slicedList = objectList.clone();
        for (Integer i = 0; i < length; i++) slicedList.remove(0);
        return slicedList;
    }
}
public class FeedViewFieldsetHelper {
    // MANDATORY FIELDS FOR ALL FieldSet Queries -
    // Ensure that fields deemed mandatory (by me) are part of the query.
    // First looks to see whether that field actually exists and is it is not part of the fieldset
    // adds it to the query so that things don't blow up
    private static String ID_FIELD = 'Id';


	/**
	 *
	 * Returns a comma separated list of members within the FieldSetMember list passed in
	 * Typically used to create the SOQL query to pull stuff from whatever the object assiciated with the fieldset it
	 *
	 **/
    public static String parseFieldSetMembers(SObject theObject, List<Schema.FieldSetMember> fields) {
    	boolean includedIdField = false;

        String fieldList = '';    
        if (fields != null) {
            for(Schema.FieldSetMember curMemb : fields) {
                fieldList += curMemb.getFieldPath() + ',';

                if ( doesFieldExist(theObject, 'ID') && ID_FIELD.equalsIgnoreCase( curMemb.getFieldPath() ) ) {
                	includedIdField = true;
                }
            }

            if ( includedIdField == false ) {
            	System.debug('ID field was not included in the field set so am manually adding it in');
            	fieldList += ID_FIELD + ',';
            }

            fieldList = fieldList.removeEnd(',');                
        }               
        return fieldList;
    }

    /**
     *
     * Checks whether the passed in object contains the field within it's description
     *
     **/
    private static boolean doesFieldExist(SObject theObject, String fieldName) {    
        boolean objectContainsField = false;
        List<Schema.DescribeSObjectResult> describeSObjectResults;
        Map<String, Schema.SObjectField> fieldMap;

        describeSObjectResults = Schema.describeSObjects(new String[] {String.valueOf(theObject.getSObjectType())});
        fieldMap = describeSObjectResults[0].fields.getMap();

        if ( fieldMap.containsKey(fieldName) ) {
            objectContainsField = true;  
            System.debug('The ' + fieldName + ' field DOES exist for the object: ' +  theObject.getSObjectType());
        } else {
            System.debug('The ' + fieldName + ' field DOES NOT exist for the object: ' +  theObject.getSObjectType());
        }
        return objectContainsField;
    }



    /**
     *
     * Creates the basis of a SOQL query for the object and fieldset passed in and filters by the id passed in
     * @return String 'SELECT Id, Name FROM Service__c WHERE ID = ' passed in ID
     *
     **/
    public static String createBaseQueryString(SObject theObject, List<Schema.FieldSetMember> fields, ID id) {
    	String queryString = '';
    	queryString = createBaseQueryString(theObject, fields) + ' WHERE ID = \'' + id + '\'';

    	System.debug('FeedViewFieldsetHelper.createBaseQueryString(WITH ID) - generated SOQL query string is: ' + queryString);

    	return queryString;
    }

    /**
     *
     * Creates the basis of a SOQL query for the object and fieldset passed in
     * @return String 'SELECT Id, Name FROM Service__c'
     *
     **/
	public static String createBaseQueryString(SObject theObject, List<Schema.FieldSetMember> fields) {    
    	String queryString = '';
    	queryString = 'SELECT ' + parseFieldSetMembers(theObject, fields) + ' FROM ' + theObject.getSObjectType();
    	return queryString;
	}
}
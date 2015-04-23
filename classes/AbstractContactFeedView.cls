public abstract class AbstractContactFeedView {
	public Contact record {set;get;}

	/**
	 *
	 * Implementing class must call this constructor and pass the current controller
	 * All logic to dynamically create query based on defined fieldset is catered for
	 *
	 **/
	public AbstractContactFeedView(ApexPages.StandardController controller) {
        String queryString = FeedViewFieldsetHelper.createBaseQueryString(new Contact(), getFieldSetMembers(), ((Contact)controller.getRecord()).Id  );
        queryString += ' LIMIT 1';
        System.debug('AbstractContactFeedView query string: ' + queryString); 
        record = Database.query(queryString);
	}	

	/**
	 *
	 * For all components, all they need to do is implement this simple method....
	 *
	 **/
    public abstract List<Schema.FieldSetMember> getFieldSetMembers();	
}
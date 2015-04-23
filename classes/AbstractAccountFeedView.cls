public abstract class AbstractAccountFeedView {

	public Account record {set;get;}

	/**
	 *
	 * Implementing class must call this constructor and pass the current controller
	 * All logic to dynamically create query based on defined fieldset is catered for
	 *
	 **/
	public AbstractAccountFeedView(ApexPages.StandardController controller) {
        String queryString = FeedViewFieldsetHelper.createBaseQueryString(new Account(), getFieldSetMembers(), ((Account)controller.getRecord()).Id  );
        queryString += ' LIMIT 1';
        System.debug('AbstractAccountFeedView query string: ' + queryString); 
        record = Database.query(queryString);
	}	

	/**
	 *
	 * For all components, all they need to do is implement this simple method....
	 *
	 **/
    public abstract List<Schema.FieldSetMember> getFieldSetMembers();

}
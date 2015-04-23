public abstract class AbstractOpportunityFeedView {
	
	public Opportunity record {set;get;}

	/**
	 *
	 * Implementing class must call this constructor and pass the current controller
	 * All logic to dynamically create query based on defined fieldset is catered for
	 *
	 **/
	public AbstractOpportunityFeedView(ApexPages.StandardController controller) {
        String queryString = FeedViewFieldsetHelper.createBaseQueryString(new Opportunity(), getFieldSetMembers(), ((Opportunity)controller.getRecord()).Id  );
        queryString += ' LIMIT 1';
        System.debug('AbstractOpportunityFeedView query string: ' + queryString); 
        record = Database.query(queryString);
	}	

	/**
	 *
	 * For all components, all they need to do is implement this simple method....
	 *
	 **/
    public abstract List<Schema.FieldSetMember> getFieldSetMembers();

}
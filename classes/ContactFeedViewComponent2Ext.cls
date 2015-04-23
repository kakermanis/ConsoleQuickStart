public with sharing class ContactFeedViewComponent2Ext extends AbstractContactFeedView {
	public ContactFeedViewComponent2Ext(ApexPages.StandardController controller) {
		
		super(controller);

	}

	public override List<Schema.FieldSetMember> getFieldSetMembers() {
		return SObjectType.Contact.FieldSets.ContactFeedViewComponent2.getFields();		
	}

	public String getComponentName() {
		return FeedViewComponentConfigUtil.getConfiguration().Contact_Component_2_Section_Name__c;
	}
}
public with sharing class ContactFeedViewComponent1Ext extends AbstractContactFeedView {
	public ContactFeedViewComponent1Ext(ApexPages.StandardController controller) {
		super(controller);
	}

	public override List<Schema.FieldSetMember> getFieldSetMembers() {
		return SObjectType.Contact.FieldSets.ContactFeedViewComponent1.getFields();		
	}

	public String getComponentName() {
		return FeedViewComponentConfigUtil.getConfiguration().Contact_Component_1_Section_Name__c;
	}
}
public with sharing class AccountFeedViewComponent1Ext extends AbstractAccountFeedView {
	public AccountFeedViewComponent1Ext(ApexPages.StandardController controller) {
		super(controller);
	}

	public override List<Schema.FieldSetMember> getFieldSetMembers() {
		return SObjectType.Account.FieldSets.AccountFeedViewComponent1.getFields();		
	}

	public String getComponentName() {
		return FeedViewComponentConfigUtil.getConfiguration().Account_Component_1_Section_Name__c;
	}
}
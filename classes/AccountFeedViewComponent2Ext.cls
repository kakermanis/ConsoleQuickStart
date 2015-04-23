public with sharing class AccountFeedViewComponent2Ext extends AbstractAccountFeedView {
	public AccountFeedViewComponent2Ext(ApexPages.StandardController controller) {
		super(controller);
	}

	public override List<Schema.FieldSetMember> getFieldSetMembers() {
		return SObjectType.Account.FieldSets.AccountFeedViewComponent2.getFields();		
	}

	public String getComponentName() {
		return FeedViewComponentConfigUtil.getConfiguration().Account_Component_2_Section_Name__c;
	}
}
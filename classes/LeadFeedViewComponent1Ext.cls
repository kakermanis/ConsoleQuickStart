public with sharing class LeadFeedViewComponent1Ext extends AbstractLeadFeedView {
	public LeadFeedViewComponent1Ext(ApexPages.StandardController controller) {
		super(controller);
	}

	public override List<Schema.FieldSetMember> getFieldSetMembers() {
		return SObjectType.Lead.FieldSets.LeadFeedViewComponent1.getFields();		
	}

	public String getComponentName() {
		return FeedViewComponentConfigUtil.getConfiguration().Lead_Component_1_Section_Name__c;
	}
}
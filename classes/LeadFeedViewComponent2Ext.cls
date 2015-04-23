public with sharing class LeadFeedViewComponent2Ext extends AbstractLeadFeedView {
	public LeadFeedViewComponent2Ext(ApexPages.StandardController controller) {
		super(controller);
	}

	public override List<Schema.FieldSetMember> getFieldSetMembers() {
		return SObjectType.Lead.FieldSets.LeadFeedViewComponent2.getFields();		
	}

	public String getComponentName() {
		return FeedViewComponentConfigUtil.getConfiguration().Lead_Component_2_Section_Name__c;
	}
}
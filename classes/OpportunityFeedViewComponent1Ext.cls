public with sharing class OpportunityFeedViewComponent1Ext extends AbstractOpportunityFeedView {
	public OpportunityFeedViewComponent1Ext(ApexPages.StandardController controller) {
		
		super(controller);
	}

	public override List<Schema.FieldSetMember> getFieldSetMembers() {
		return SObjectType.Opportunity.FieldSets.OpportunityFeedViewComponent1.getFields();		
	}

	public String getComponentName() {
		return FeedViewComponentConfigUtil.getConfiguration().Opportunity_Component_1_Section_Name__c;
	}
}
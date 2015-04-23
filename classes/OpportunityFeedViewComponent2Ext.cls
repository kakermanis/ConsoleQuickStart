public with sharing class OpportunityFeedViewComponent2Ext extends AbstractOpportunityFeedView {
	public OpportunityFeedViewComponent2Ext(ApexPages.StandardController controller) {
		
		super(controller);
	}

	public override List<Schema.FieldSetMember> getFieldSetMembers() {
		return SObjectType.Opportunity.FieldSets.OpportunityFeedViewComponent2.getFields();		
	}

	public String getComponentName() {
		return FeedViewComponentConfigUtil.getConfiguration().Opportunity_Component_2_Section_Name__c;
	}
}
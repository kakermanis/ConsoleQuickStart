public with sharing class CaseFeedViewComponent1Ext extends AbstractCaseFeedView {
	public CaseFeedViewComponent1Ext(ApexPages.StandardController controller) {
		super(controller);
	}

	public override List<Schema.FieldSetMember> getFieldSetMembers() {
		return SObjectType.Case.FieldSets.CaseFeedViewComponent1.getFields();		
	}

	public String getComponentName() {
		return FeedViewComponentConfigUtil.getConfiguration().Case_Component_1_Section_Name__c;
	}
}
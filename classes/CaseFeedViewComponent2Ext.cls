public with sharing class CaseFeedViewComponent2Ext extends AbstractCaseFeedView {
	public CaseFeedViewComponent2Ext(ApexPages.StandardController controller) {
		super(controller);
	}

	public override List<Schema.FieldSetMember> getFieldSetMembers() {
		return SObjectType.Case.FieldSets.CaseFeedViewComponent2.getFields();		
	}

	public String getComponentName() {
		return FeedViewComponentConfigUtil.getConfiguration().Case_Component_2_Section_Name__c;
	}
}
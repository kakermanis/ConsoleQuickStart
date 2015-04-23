public class FeedViewComponentConfigUtil {
	public static FeedViewComponents__c feedViewConfiguration = null;

	public static FeedViewComponents__c getConfiguration() {
		if (feedViewConfiguration == null) {
			try {
					feedViewConfiguration = [SELECT Lead_Component_1_Section_Name__c, Lead_Component_2_Section_Name__c,
												Account_Component_1_Section_Name__c, Account_Component_2_Section_Name__c,
												Contact_Component_1_Section_Name__c, Contact_Component_2_Section_Name__c,
												Opportunity_Component_1_Section_Name__c, Opportunity_Component_2_Section_Name__c,
												Case_Component_1_Section_Name__c, Case_Component_2_Section_Name__c
											 FROM FeedViewComponents__c WHERE Name = 'Default'];
				} catch (Exception ex) {
					System.debug('Looks like there is not a config in place, create a default one and use that');
					feedViewConfiguration = new FeedViewComponents__c();
					feedViewConfiguration.Name = 'Default';
					insert feedViewConfiguration;
					feedViewConfiguration = [SELECT Lead_Component_1_Section_Name__c, Lead_Component_2_Section_Name__c,
												Account_Component_1_Section_Name__c, Account_Component_2_Section_Name__c,
												Contact_Component_1_Section_Name__c, Contact_Component_2_Section_Name__c,
												Opportunity_Component_1_Section_Name__c, Opportunity_Component_2_Section_Name__c,
												Case_Component_1_Section_Name__c, Case_Component_2_Section_Name__c
												 FROM FeedViewComponents__c WHERE Name = 'Default'];					
				}
		} 
		return feedViewConfiguration;		
	}
}
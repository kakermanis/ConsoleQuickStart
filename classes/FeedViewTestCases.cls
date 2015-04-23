@isTest
private class FeedViewTestCases {
	
	@isTest static void testLeads() {
		Lead testLead = new Lead(FirstName='Test', LastName='Lead',Company='TestCompany');
		insert testLead;

		ApexPages.StandardController stdController = createStandardController(testLead);

		LeadFeedViewComponent1Ext ext1 = new LeadFeedViewComponent1Ext(stdController);
		ext1.getFieldSetMembers();
		ext1.getComponentName();

		LeadFeedViewComponent2Ext ext2 = new LeadFeedViewComponent2Ext(stdController);
		ext2.getFieldSetMembers();
		ext2.getComponentName();
	}
	
	@isTest static void testContacts() {
		createTestAccountsAndContacts(1,1);
		Contact testContact = [SELECT id FROM contact WHERE firstName = 'Test0'];

		ApexPages.StandardController stdController = createStandardController(testContact);

		ContactFeedViewComponent1Ext ext1 = new ContactFeedViewComponent1Ext(stdController);
		ext1.getFieldSetMembers();
		ext1.getComponentName();

		ContactFeedViewComponent2Ext ext2 = new ContactFeedViewComponent2Ext(stdController);
		ext2.getFieldSetMembers();
		ext2.getComponentName();		
	}

	@isTest static void testAccounts() {
		createTestAccountsAndContacts(1,1);
		Account testAccount = [SELECT id FROM Account WHERE Name = 'TestAccount0'];

		ApexPages.StandardController stdController = createStandardController(testAccount);

		AccountFeedViewComponent1Ext ext1 = new AccountFeedViewComponent1Ext(stdController);
		ext1.getFieldSetMembers();
		ext1.getComponentName();

		AccountFeedViewComponent2Ext ext2 = new AccountFeedViewComponent2Ext(stdController);
		ext2.getFieldSetMembers();
		ext2.getComponentName();	
	}	

	@isTest static void testOpportunities() {
		createTestAccountsAndContacts(1,1);
		Account testAccount = [SELECT id FROM Account WHERE Name = 'TestAccount0'];
		Contact testContact = [SELECT id FROM contact WHERE firstName = 'Test0'];

		Opportunity testOppty = new Opportunity(Name='TestOppty', Amount=0.99, StageName='Discovery');
		testOppty.CloseDate = Date.today();
		testOppty.AccountId = testAccount.Id;

		insert testOppty;

		ApexPages.StandardController stdController = createStandardController(testOppty);

		OpportunityFeedViewComponent1Ext ext1 = new OpportunityFeedViewComponent1Ext(stdController);
		ext1.getFieldSetMembers();
		ext1.getComponentName();

		OpportunityFeedViewComponent2Ext ext2 = new OpportunityFeedViewComponent2Ext(stdController);
		ext2.getFieldSetMembers();
		ext2.getComponentName();
	}	

	@isTest static void testCases() {
		createTestAccountsAndContacts(1,1);
		Account testAccount = [SELECT id FROM Account WHERE Name = 'TestAccount0'];
		Contact testContact = [SELECT id FROM contact WHERE firstName = 'Test0'];
		Case testCase = new Case(Subject='Test Case');
		testCase.ContactId = testContact.Id;
		testCase.AccountId = testAccount.Id;
		insert testCase;

		ApexPages.StandardController stdController = createStandardController(testCase);

		CaseFeedViewComponent1Ext ext1 = new CaseFeedViewComponent1Ext(stdController);
		ext1.getFieldSetMembers();
		ext1.getComponentName();

		CaseFeedViewComponent2Ext ext2 = new CaseFeedViewComponent2Ext(stdController);
		ext2.getFieldSetMembers();
		ext2.getComponentName();		
	}	

	/**
	 *
	 *
	 *
	 **/
	private static ApexPages.StandardController createStandardController(SObject objectRecord) {
		return new ApexPages.StandardController(objectRecord);
	}
    
    private static void createCustomSetting() {
        FeedViewComponents__c config;
        
        try {
            config = [select Name from FeedViewComponents__c where name = 'Default'];
        } catch (Exception ex) {
            //If we're in here then there isn't a default config setup
			config = new FeedViewComponents__c(Name='Default');
            insert config;
        }
    }


	/**
	 *
	 *
	 *
	 **/
    private static void createTestAccountsAndContacts(Integer numAccts, Integer numContactsPerAcct) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            List<Contact> cons = new List<Contact>();
            // For each account just inserted, add contacts
            for (Integer k=numContactsPerAcct*j;k<numContactsPerAcct*(j+1);k++) {
                cons.add(new Contact(firstname='Test'+k,lastname='Test'+k,AccountId=acct.Id));
            }
            insert cons;
        }
    }	
}
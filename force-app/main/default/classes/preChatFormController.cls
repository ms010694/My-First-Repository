public class preChatFormController {
    
    public string userId{get;set;}
    public string userEmail{get;set;}
    public string userName{get;set;}
    public  Id recTypeId{get;set;}
    
    public preChatFormController(){
        system.debug('test test');
        /*recTypeId = Schema.SObjectType.case.getRecordTypeInfosByName().get('Desk.com Migrated Cases').getRecordTypeId();
        userId = System.currentPageReference().getParameters().get('userId');
        userEmail = System.currentPageReference().getParameters().get('userEmail');*/
        //userName = System.currentPageReference().getParameters().get('userName');
 //       recTypeId = Schema.SObjectType.case.getRecordTypeInfosByName().get('Desk.com Migrated Cases').getRecordTypeId();
userId = 'user1';
userEmail = 'user@gmail.com';
    }
    
    public void save(){
        list<contact> conList=[select id from contact where email=:userEmail];
        if(conList.size()>0 && userId!=Null && userEmail!=Null){
            
            Account acc = new Account();
            acc.Name = userId;
            insert acc;
            
            Contact con = new Contact();
            con.LastName = userId;
            con.Email = userEmail;
            con.AccountId = acc.Id;
            insert con;
            
            Case cs = new Case();
            cs.ContactId = con.id;
        }
    }
    
    
}
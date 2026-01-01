/**
 * @description       : 
 * @author            : Element
 * @group             : 
 * @last modified on  : 01-01-2026
 * @last modified by  : Element
**/
public class VulnerableClass {
    // SOQL Injection vulnerability (intentional for demo)
    public static List<Account> searchAccounts(String searchTerm) {
        String query = 'SELECT Id, Name FROM Account WHERE Name LIKE \'%' + searchTerm + '%\'';
        return Database.query(query);
    }
    
    // CRUD violation (intentional for demo)
    public static void createAccount(String accountName) {
        Account acc = new Account(Name = accountName);
        insert acc; // No CRUD check
    }
    
    // Sharing violation (intentional for demo)
    public static List<Account> getAllAccounts() {
        return [SELECT Id, Name FROM Account]; // Returns all records, bypasses sharing
    }
}
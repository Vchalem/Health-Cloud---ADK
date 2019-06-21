List<Case> cases = [SELECT Id from Case];
Database.delete(cases);

List<Contact> contacts = [SELECT Id from Contact];
Database.delete(contacts);

List<Account> accounts = [SELECT Id from Account];
Database.delete(accounts);
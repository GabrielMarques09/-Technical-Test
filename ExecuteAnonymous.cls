  List<Account> contas = new List<Account> {
    new Account (Name = 'Gabriel'),
    new Account (Name = 'Eduardo'),
    new Account (Name = 'Gabriela')
  };
        
	insert contas;

  List<Contact> contatos = new List<Contact> {
    new Contact(
		  FirstName = 'Joao',
      LastName  = 'Mateus',
      AccountId = contas[0].id),
    new Contact(
      FirstName = 'Maria',
			LastName  = 'Eduarda',
			AccountId = contas[1].id
        ),
		new Contact(
      FirstName = 'Felipe',
			LastName  =	'Araujo',
			AccountId = contas[2].id
        )
  };
    
  insert contatos;

	System.debug('Todos os contatos: '+ contatos);

	Account masterAcct = [SELECT Id, Name FROM Account WHERE Id =: contas[0].id LIMIT 1];
	masterAcct = [SELECT Id, Name FROM Account WHERE Id =: contas[0].id LIMIT 1];
	System.debug(masterAcct.Name);

	List<Id> mergeAcctIds = new List<Id>();
	mergeAcctIds.add(contas[1].Id);
	mergeAcctIds.add(contas[2].Id);

	List<Account> mergeAcct = [SELECT Id, Name FROM Account WHERE Id IN : mergeAcctIds];

	System.debug('Master ' + masterAcct + 'Merg '+ mergeAcctIds);

	try {
    merge masterAcct mergeAcctIds;
    Account[] result = [SELECT Id, Name FROM Account WHERE Id IN : mergeAcctIds];
		System.debug(result);
    Contact[] cont = [Select Id, Name From Contact WHERE AccountId  =: masterAcct.id ];
    System.debug('Cont: '+ cont);
    undelete mergeAcct;
    result = [SELECT Id, Name FROM Account WHERE Id IN : mergeAcctIds];
		System.debug('Contas recuperadas' + result);

    } catch (DmlException e) {
      System.debug('An unexpected error has occurred: ' + e.getMessage()); 
    }

	System.debug('MasterMErge' + masterAcct );
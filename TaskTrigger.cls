trigger TaskTrigger on Lead (after insert) {
    System.debug(Trigger.new);
    for(Lead lead : Trigger.New) {
        System.debug(lead.FormasDeContato__c);
        system.debug(lead.Id);
        String[] selectedOptions = lead.FormasDeContato__c.split(';');
        System.debug(selectedOptions);
        for (String option : selectedOptions) {
            system.debug('Opt '+ option);
		    system.debug('select opt' + selectedOptions);
            
            if(option == 'SMS' || option == 'Whatsapp') {
                Task task     = new Task();
                task.Subject  = option;
                task.WhoId 	  = lead.Id;
                task.Priority = 'Normal';
                task.Status   = 'Not Started';
                insert task;
            } 
       }
    }
}
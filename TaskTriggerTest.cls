@isTest
public class TaskTriggerTest {
	@isTest static void TestCreateLead(){
    try{
      List<Lead> lead = new List<Lead>{
        new Lead (FirstName = 'Gabriel', LastName   = 'Marques', FormasDeContato__c   = 'SMS', Company          = 'Aleat' ),
        new Lead (FirstName = 'Eduardo', LastName   = 'Alcantara', FormasDeContato__c = 'Whatsapp', Company     = 'Acme'),
        new Lead (FirstName = 'Gabriela', LastName  = 'Araujo', FormasDeContato__c    = 'Whatsapp;SMS', Company = 'TK'), 
        new Lead (FirstName = 'Gabriels', LastName  = 'Marques')
      };
      insert lead;

    } catch (DMLException e) {
        system.debug('Erro ao tentar inserir o Lead. Exception: '  + e.getLineNumber() + ':' + e.getStackTraceString());
    } catch (Exception e) {
        system.debug('Erro ao inesperado. Exception: '  + e.getLineNumber() + ':' + e.getStackTraceString());
    }
  }
}
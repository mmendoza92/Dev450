public with sharing class MantenimientoTriggerHandler {
   public static void updateFechas(List<Mantenimiento__c> mantenimientos)
   {
    
    


     List<Certification_Held__c> expirados= new  List<Certification_Held__c>();
     List<Certification_Held__c> updateExpirados= new  List<Certification_Held__c>();
   
    expirados= [SELECT ID,Name,	Fecha_Expiracion__c,Estado__c,Certified_Professional__r.Name FROM Certification_Held__c WHERE Estado__c = 'expiro'];


        for (Mantenimiento__c man : mantenimientos)
        {
            for(Certification_Held__c exp : expirados)
            {
                if(man.Certification_Held__c==exp.ID    )
                {
                    
                    exp.Date_Achieved__c=man.Fecha_nueva__c;
                    
                    if(man.Estado__c!='Mantenimeinto completo')
                    {
                        man.addError('debe cambiar el estado a "Mantenimiento completo"');
                    }else {
                        updateExpirados.add(exp);  
                    }
                    
                   
                

                }
                
            }

        }

        update updateExpirados;
     


   }
}


/*
// Describe the Account.Industry field
Schema.DescribeFieldResult fieldDescription = Course_Attendee__c.Status__c.getDescribe();
// Get picklist values from field description
List <Schema.PicklistEntry> entries = fieldDescription.getPicklistValues();
// Do something with entries
for (Schema.PicklistEntry entry : entries) {
system.debug('valores: ' + entry.getValue());
    
entry.getValue()
entry.getLabel()
entry.isActive()
entry.isDefaultValue()

}*/
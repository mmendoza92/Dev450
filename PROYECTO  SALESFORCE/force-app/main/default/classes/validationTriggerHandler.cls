public with sharing class validationTriggerHandler {
    


    public static void insertarHeld(List<Certification_Held__c> certificaciones)
    {

        Id certificadoCarga;
        Id contactoCarga;
        Boolean flag= false;

    


        List<Course_Attendee__c> atendePersonalizado = new List<Course_Attendee__c>();

        for(Certification_Held__c cer : certificaciones)
        {
            contactoCarga =cer.Certified_Professional__c;
            certificadoCarga=cer.Certification__c;
        
        
        }

       
        atendePersonalizado =[SELECT Id /*,Course_Delivery__r.Course__r.Certification__c,Course_Delivery__c,Course_Delivery__r.Name,Course_Delivery__r.Course__c,	Student__r.Name, Student__r.Id,Status__c 
	  */FROM Course_Attendee__c 
		WHERE Status__c = 'Completed'
		AND Student__c = :contactoCarga
        AND Course_Delivery__r.Course__r.Certification__c = :certificadoCarga];

        if(atendePersonalizado.size() > 0)
        {
            flag=true;
        }

        for(Certification_Held__c cer : certificaciones)
        {
           
        if(flag== false)
        {
            cer.addError('no tiene ningun curso aprobado para la certificacion elegida');   
           
        }
        
        }

    }

}
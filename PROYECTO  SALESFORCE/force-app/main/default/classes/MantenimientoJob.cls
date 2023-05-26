public with sharing class MantenimientoJob implements Schedulable {
    public void execute(SchedulableContext SC) {

        insertarMantenimientos();
 
     }


     public static void insertarMantenimientos()
     {
        //capturar todos los held, revisar cuales tienen expiro y crrar mantenimeinto.
        List<Certification_Held__c> expirados= new  List<Certification_Held__c>();
        List<Mantenimiento__c> mantenimientos=new List<Mantenimiento__c>();
        


        expirados=[SELECT ID,Name,	Fecha_Expiracion__c,Estado__c,Certified_Professional__r.Name FROM Certification_Held__c WHERE Estado__c = 'expiro'/* AND Fecha_Expiracion__c = TODAY*/ ];


       for(Certification_Held__c exp : expirados)
        {
           
                Mantenimiento__c man= new Mantenimiento__c();
                man.Certification_Held__c=exp.ID;                
                man.Contact__c=exp.Certified_Professional__c;
                mantenimientos.add(man);
           
        }

        insert mantenimientos;


     }
}
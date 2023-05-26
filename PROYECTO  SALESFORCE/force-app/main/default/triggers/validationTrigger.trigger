trigger validationTrigger on 	Certification_Held__c (before insert) {
    if (trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            validationTriggerHandler.insertarHeld(trigger.new);
        }
    }
}
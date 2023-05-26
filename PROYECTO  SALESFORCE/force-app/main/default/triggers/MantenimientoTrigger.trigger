    trigger MantenimientoTrigger on Mantenimiento__c (after update)
    {
        if (trigger.isAfter)
        {
            if(trigger.isUpdate)
            {
                MantenimientoTriggerHandler.updateFechas(trigger.new);
            }
        }
    }
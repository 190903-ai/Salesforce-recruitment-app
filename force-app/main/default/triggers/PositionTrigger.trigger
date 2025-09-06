//Default close date fora new position should be
//Critical - 7 days
//High - 15 days
//Medium - 30 days
//Low - 45 days 
trigger PositionTrigger on Position__c (before insert, before update) {
    List<Position__c> newPositions = Trigger.new;
    if(Trigger.isInsert){
    for(Position__c pos: newPositions){
        if(pos.priority__c.equals('Critical')){
            pos.Date_Closed__c = DateTime.now()+7;
        }else if(pos.priority__c.equals('High')){
            pos.Date_Closed__c = DateTime.now()+15;
        }else if(pos.priority__c.equals('Medium')){
            pos.Date_Closed__c = DateTime.now()+30;
        }else if(pos.priority__c.equals('Low')){
            pos.Date_Closed__c = DateTime.now()+45;
        }
    }
    }else if(Trigger.isBefore && Trigger.isUpdate){
        for(Position__c newPos : newPositions){
            Position__c oldPos = trigger.oldMap.get(newPos.Id);
            
            if(oldPos.Status__c.equals('Closed')){
                if(newPos.Date_Closed__c != oldPos.Date_Closed__c || newPos.date_Opened__c != oldPos.Date_Opened__c ||
                   newPos.Start_Date__c != oldPos.Start_Date__c || !newPos.department__c.equals(oldPos.Department__c) ||
                   !newPos.priority__c.equals(oldPos.Priority__c) || !newPos.pay_grade__c.equals(oldPos.Pay_Grade__c)){
                       
                       newPos.addError('Cannot Change Position Record For a Closed Position');
                   }
            } 
        }
    }
}  
//if a position is closed then HR should not change its close date, opened date, start date, department, priority and paygrade
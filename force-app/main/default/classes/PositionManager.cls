//class used for position sobject
public class PositionManager {
    public static Id AddPosition(String name, String jd){
        Position__c pos= new Position__c();
        pos.Name = name;
        pos.Job_Description__c=jd;
        
        insert pos;
        
        return pos.Id;
    }
    public static Id AddPosition(String name, String jd, String status, String subStatus){
        Position__c pos=new Position__c(status__c = status, sub_status__c = subStatus);
        pos.Name = name;
        pos.Job_Description__c=jd;
        insert pos;
        return pos.id;
    }
    
    public static Boolean changeStatus(Id recId, String status){
        Position__c pos=new Position__c(Id=recId);
        
        pos.Status__c = status;
        update pos;
        return true;
    }
    
    public static Boolean changeSubStatus(Id recId, String subStatus){
        Position__c pos=new Position__c(Id=recId);
        pos.Sub_Status__c =subStatus;
        update pos;
        
        return true;
    }
    public static boolean deletePositionById(Id recId){
        Position__c pos=new Position__c();
        pos.Id = recId;
        delete pos;
        return true;
    }
    
    public static Boolean undeleteById(Id recId){
        Position__c pos=new Position__c();
        pos.Id = recId;
        undelete pos;
        return true;
    }

    public static List<Position__c> getAllPositions(){
        return[Select name, date_opened__c, date_closed__c, Department__c, Status__c, Sub_status__c From Position__c];
    } 

    public static List<Position__c> getPositionsByDepartment(String deptName){
        return[Select name, date_opened__c, date_closed__c, Department__c, Status__c, Sub_status__c From Position__c
               where department__c =:deptName];
    }

    public static List<Position__c>getPositionsByStatus(String stat){
        return[Select name, date_opened__c, date_closed__c, Department__c, Status__c, Sub_status__c From Position__c 
               where Status__c=:stat];
    }
    public static List<Position__c> getPositionsBystatusAndDepartment(String stat, String deptName){
        return[Select name, date_opened__c, date_closed__c, Department__c, Status__c, Sub_status__c From Position__c 
               where Status__c=:stat AND department__c =:deptName];
    }

    public static List<Position__c> getPositionsByStatusAndSubstatus(String stat, String substat){
        return[Select name, date_opened__c, date_closed__c, Department__c, Status__c, Sub_status__c From Position__c
               where Status__c=:stat AND Sub_status__c=:substat];
    }
    public static List<Position__c> getPositionsByStatusOpenAndClosingin7Days(){
        DateTime advance7days = DateTime.now()+7;
        return[Select name, date_opened__c, date_closed__c, Department__c, Status__c, Sub_status__c From Position__c
               where Status__c in('New','Open') AND date_closed__c <= :advance7days];
    }


    public static List<Position__c> getClosedPositionsToday(){
        DateTime closedtoday = DateTime.now();
        return[Select  name, date_opened__c, date_closed__c, Department__c, Status__c, Sub_status__c From Position__c 
               where Status__c = 'Closed' AND date_closed__c = :closedtoday];
    }


    public static List<Position__c> getDepartmentwiseClosePositions(){
        return[Select  name, date_opened__c, date_closed__c, Department__c, Status__c, Sub_status__c From Position__c
               where Status__c ='Closed' order by Department__c];
    }
    
     public List<Position__c> getPositionByPriority(String Priority){
        return[Select name, Priority__c From Position__c
               where Priority__c = :Priority];
    }
    
    public List<Position__c> getPositionByDepartmentPriority(String deptName, String Priority){
        return[Select name, Priority__c From Position__c
               where Priority__c = :Priority and Department__c = :deptName];
    }
}
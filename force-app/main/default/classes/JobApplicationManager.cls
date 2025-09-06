public class JobApplicationManager {
	 public static Id AddJobApplication(String positionApplyingFor, String name){
        Job_Application__c ja= new Job_Application__c();
        
        ja.Position_Applying_For__c = positionApplyingFor;
        ja.Candidate_Name__c = name;
        
        insert ja;
        
        return ja.Id;
    }

    public static Boolean changeStatus(Id recId, String status){
        Job_Application__c ja =new Job_Application__c(Id=recId);
        
		ja.Status__c = status;
        update ja;
        return true;
    }
    
    public static boolean deletePositionById(Id recId){
        Job_Application__c ja =new Job_Application__c();
        ja.Id = recId;
        delete ja;
        return true;
    }
    
    public static Boolean undeleteById(Id recId){
        Job_Application__c ja =new Job_Application__c();
        ja.Id = recId;
        undelete ja;
        return true;
    }
    
    public static List<Job_Application__c> getAllJobApplications(){
        return[Select name, Candidate_Name__c, Position_Applying_For__c, Status__c From Job_Application__c];
    } 

    public static List<Job_Application__c> getJobApplicationsByCandidateName(String cname){
        return[Select name, Candidate_Name__c, Position_Applying_For__c, Status__c From Job_Application__c
               where Candidate_Name__c = :cname];
    }

    public static List<Job_Application__c>getJobApplicationsByPositionApplyingFor(String pos){
        return[Select name, Candidate_Name__c, Position_Applying_For__c, Status__c From Job_Application__c
               where Position_Applying_For__c = :pos];
    }
    public static List<Job_Application__c> getJobApplicationsByStatus(String status){
        return[Select name, Candidate_Name__c, Position_Applying_For__c, Status__c From Job_Application__c
               where Status__c = :status];
    }
    
    public static List<Job_Application__c> getJobApplicationsByStatusAndPosition(String status, String pos){
        return[Select name, Candidate_Name__c, Position_Applying_For__c, Status__c From Job_Application__c
               where Status__c = :status and Position_Applying_For__c = :pos];
    }
    
    //job applications offered 
    public static List<Job_Application__c> getJobApplicationsForOpenStatus(){
        return[Select name, Candidate_Name__c, Position_Applying_For__c, Status__c From Job_Application__c
               where Status__c = 'Offered'];
    }
    
    //position wise job applications
    public static List<Job_Application__c> getJobApplicationsForPositionwise(){
        return[Select name, Candidate_Name__c, Position_Applying_For__c, Status__c From Job_Application__c
               order by Position_Applying_For__c];
    }
    
    //statuswise job applications
    public static List<Job_Application__c> getJobApplicationsForStatuswise(){
        return[Select name, Candidate_Name__c, Position_Applying_For__c, Status__c From Job_Application__c
               order by Status__c];
    }
}
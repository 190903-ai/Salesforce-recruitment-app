public class ReviewManager {
	 public static Id AddReviewManager(String Iname, String jano){
        Review__c rev= new Review__c();
        
        rev.Interviewer_Name__c= Iname;
        rev.Job_Application_No__c = jano;
        
        insert rev;
        
        return rev.Id;
    }

    public static Boolean changeInterviewName(Id recId, String Iname){
        Review__c rev= new Review__c(Id=recId);
        
		rev.Interviewer_Name__c= Iname;
        update rev;
        return true;
    }
    
    public static boolean deleteReviewById(Id recId){
        Review__c rev= new Review__c();
        rev.Id = recId;
        delete rev;
        return true;
    }
    
    public static Boolean undeleteById(Id recId){
        Review__c rev= new Review__c();
        rev.Id = recId;
        undelete rev;
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
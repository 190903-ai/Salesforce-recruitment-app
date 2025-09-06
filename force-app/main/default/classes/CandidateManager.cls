public class CandidateManager {
    public static Id AddCandidate(String name, String email){
        Candidate__c cand= new Candidate__c();
        cand.Name = name;
        cand.Personal_Email__c = email;
        
        insert cand;
        return cand.Id;
    }
     public static boolean ChangeMobile(Id recId, String mobile){
        Candidate__c cand=new Candidate__c(Id=recId);
        cand.Mobile__c = mobile;
        update cand;
        return true;
    }
    
    public static boolean deleteCandidateById(Id recId){
        Candidate__c cand=new Candidate__c();
        cand.Id = recId;
        delete cand;
        return true;
    }
    
    public static Boolean undeleteById(Id recId){
        Candidate__c cand=new Candidate__c();
        cand.Id = recId;
        undelete cand;
        return true;
    }
    
    public static List<Candidate__c> getAllCandidates(){
        return[Select name, mobile__c, Linkedin_Url__c, Personal_Email__c From Candidate__c];
    } 

    public static List<Candidate__c> getCandidatesByMobile(String mobile){
        return[Select name, mobile__c, Linkedin_Url__c, Personal_Email__c From Candidate__c
               where mobile__c = :mobile];
    }

    public static List<Candidate__c>getCandidatesByLinkedIn(String linkedInURL){
        return[Select name, mobile__c, Linkedin_Url__c, Personal_Email__c From Candidate__c
               where Linkedin_Url__c = :linkedInURL];
    }
    public static List<Candidate__c> getCandidatesByMobileAndEmail(String mobile, String email){
        return[Select name, mobile__c, Linkedin_Url__c, Personal_Email__c From Candidate__c
               where mobile__c = :mobile AND Personal_Email__c = :email];
    }

    public static List<Candidate__c> getCandidatesByMobileAndLinkedIn(String mobile, String linkedInURL){
        return[Select name, mobile__c, Linkedin_Url__c, Personal_Email__c From Candidate__c
               where mobile__c = :mobile AND Linkedin_Url__c = :linkedInURL];
    }
    
    //candidates above 25 
    public static List<Candidate__c> getCandidatesByAge(){
        Date age = Date.today() - 25;
        return[Select name, mobile__c, Linkedin_Url__c, Personal_Email__c,	Birth_Date__c From Candidate__c
               where 	Birth_Date__c <= :age];
    }
}
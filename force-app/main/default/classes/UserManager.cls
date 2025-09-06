public class UserManager {
	
    @future
    public static void getAllUsers(){
        List<User> users= [select firstname, lastname, isActive from user];
        Integer cnt =0 ;
        for(User usr: users){
            if(usr.isActive){
                cnt++;
            }
        }
        system.debug('Total Active users - '+cnt);
    }
}
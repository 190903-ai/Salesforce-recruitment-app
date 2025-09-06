public class BankAccountService {
    public static Integer getCountByHigherBalance(BankAccount[] accs, double amt){
        Integer cnt=0;
        for(BankAccount acc: accs){
            if(acc.getBalance() > amt){
                cnt++;
            }
        }
        return cnt;
    }
    public static Integer getCountByLowerBalance(BankAccount[] accs, double amt){
        Integer cnt1=0;
        for(BankAccount acc: accs){
            if(acc.getBalance() < amt)
                cnt1++;
        }
        return cnt1;
    }
}
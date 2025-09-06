public class BankAccount{
    
    //Class data members
    private static Integer lastAccNo;
    
    //static block (It executes only once when the class is called)
    static{
        lastAccNo = 1;
    }
    
    //Instance data members
    private Integer accNo;
    private String customerName;
    private Double balance;
    
    //No-argument constructors
    public BankAccount(){
        customerName = ' ';
        balance = 0;
        accNo = 0;
    }
    
    //ctor with arguments
    public BankAccount(String name, double amt){
        accNo = lastAccNo++;
        customerName = name;
        balance = amt;
    }
    
    private void setAccNo(Integer no){
        accNo = no;
    }
    
    public void setCustomerName(String customerName){
        this.customerName = customerName;
    }
    
    private void setBalance(double amt){
        balance = amt;
    }
    
    private Integer getAccNo(){
        return accNo;
    }
    
    public String getCustomerName(){
         return customerName;
    }
    
    public Double getBalance(){
        return balance;
    }
    
    public void setLastAccNo(Integer no){
        lastAccNo = no;
    }
    
    public static Integer getLastAccNo(){
        return lastAccNo;
    }
    
}
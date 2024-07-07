
package model;

public class Order {

    private int oid;
    private String date;
    private double totalMoney;
    private int status;
    private Account account;
    
    public Order() {
    }

    public Order(int oid, String date, double totalMoney, int status, Account account) {
        this.oid = oid;
        this.date = date;
        this.totalMoney = totalMoney;
        this.status = status;
        this.account = account;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
    
    
   }


package com.ecom.shop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length=10, name="user_id")
    private int userId;
    
    @Column(length=100, name="user_Name")
    private String userName;
    
    @Column(length=100, name="user_Email")
    private String userEmail;
    
    @Column(length=100, name="user_Password")
    private String userPassword;
    
    @Column(length=10, name="user_Phone")
    private int userPhone;
    
    @Column(length=1600, name="user_Pic")
    private String userPic;
    
    @Column(length=1500, name="user_Address")
    private String userAddress;
    
    @Column(length=100, name="user_Type")
    private String userType="normal";

    public User(){
    }

    public User(String userName, String userEmail, String userPassword, int userPhone) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
    }

  
    
    public User(String user_name, String user_email, String user_password, int user_phone,String user_Type) {
        this.userName=user_name;
        this.userEmail = user_email;
        this.userPassword = user_password;
        this.userPhone = user_phone;
        this.userType= user_Type;
    }
    
    public User(int userId, String userName, String userEmail, String userPassword, int userPhone, String userPic, String userAddress,String user_Type) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType= user_Type;
    }

    public User(String userName, String userEmail, String userPassword, int userPhone, String userPic, String userAddress,String user_Type) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType= user_Type;
    }

    
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public int getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(int userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress + ", userType=" + userType + '}';
    }

    
    
    
    
    
}

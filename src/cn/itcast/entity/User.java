package cn.itcast.entity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
	/**
	 *  FS
	 *  用户表
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String name;

    private String dept;

    private String account;

    private String password;

    private String headImg;

    private Boolean gender;

    private String email;

    private String mobile;

    private Date birthday;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", dept=" + dept
				+ ", account=" + account + ", password=" + password
				+ ", headImg=" + headImg + ", gender=" + gender + ", email="
				+ email + ", mobile=" + mobile + ", birthday=" + birthday + "]";
	}
    
}
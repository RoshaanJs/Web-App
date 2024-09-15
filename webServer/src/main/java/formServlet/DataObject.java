package formServlet;

import java.util.Date;

public class DataObject {
	private int id;
    private String name;
    private String phone;
    private String email;
    private String password;
    private Date registrationDate;
    private String plan;
    private String expiryDate;

	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
	public DataObject(int id, String name, String phone, String email, String password, Date registrationDate,
			String plan,String expiryDate) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.registrationDate = registrationDate;
		this.plan = plan;
		this.expiryDate = expiryDate;
	}
	public DataObject() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}

package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator{
	
	PasswordAuthentication passAuth;
	String emailID = "amayun707@gmail.com";
	
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("amayun707", "aigkwfyosqdamvix");
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
}

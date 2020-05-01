package model.bean;

public class Mail {
	private String sendtoMail;
	private String Subject;
	private String mailBody;
	public String getSendtoMail() {
		return sendtoMail;
	}
	public void setSendtoMail(String sendtoMail) {
		this.sendtoMail = sendtoMail;
	}
	public String getSubject() {
		return Subject;
	}
	public void setSubject(String subject) {
		Subject = subject;
	}
	public String getMailBody() {
		return mailBody;
	}
	public void setMailBody(String mailBody) {
		this.mailBody = mailBody;
	}
	public Mail(String sendtoMail, String subject, String mailBody) {
		super();
		this.sendtoMail = sendtoMail;
		Subject = subject;
		this.mailBody = mailBody;
	}
	public Mail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

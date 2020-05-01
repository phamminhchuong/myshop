package Defines;

public class MailDefine {
	public static String createMailBody(String email, String token) {

		StringBuilder sb = new StringBuilder();
		sb.append("<h2>Hello " + email + "</h2><br>");
		sb.append("<p>Your reset password link is ");
		sb.append(" <a href=\"http://localhost:8080/web/auth/resetPassword?token=");
		sb.append(token);
		sb.append("\">click here</a></p>");
		sb.append("<br>");
		sb.append("<h4>Thank You !!</h4>");
		return sb.toString();

	}
	
	
	public static String createMailBodyToEmail(String email,String code) {

		StringBuilder sb = new StringBuilder();
		sb.append("<h2>Chào " + email + "</h2><br>");
		sb.append("<p style='color:red'>Sử dụng mã này để kích hoạt Email : " +code );
		sb.append("</p>");
		sb.append("<br>");
		sb.append("<h4>Thank You !!</h4>");
		return sb.toString();

	}
}

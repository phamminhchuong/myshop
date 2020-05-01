package Service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import model.bean.Mail;
@Service
public class MailService {
	 @Autowired
	private JavaMailSender javaMailSender;
	public boolean sendEmail(Mail mail,boolean isHtmlformat) {	
		 try {
			
	            MimeMessage msg = javaMailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(msg, true,"UTF-8");
	            helper.setTo(mail.getSendtoMail());
	            helper.setSubject(mail.getSubject());
	            if (isHtmlformat) {
	                helper.setText(mail.getMailBody(), true);
	            } else {
	                helper.setText(mail.getMailBody());
	            }
           
	            javaMailSender.send(msg);
	            return true;
	        }catch (Exception e){
	            return false;
	        }
	}
}

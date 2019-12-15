package mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contact/mailSend")

public class MailSendServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public MailSendServlet() {
		super();
	}
	
	protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.port", "587");
			
			Authenticator auth = new GoogleAuthentication();
			Session s = Session.getDefaultInstance(properties, auth);
			Message message = new MimeMessage(s);
			
			Address sender_address = new InternetAddress(sender);
			Address receiver_address = new InternetAddress(receiver);
			
			message.setHeader("content-type", "text/html;charset=UTF-8");
			message.setFrom(sender_address);
			message.addRecipient(Message.RecipientType.TO, receiver_address);
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=UTF-8");
			message.setSentDate(new java.util.Date());
			Transport.send(message);
			out.println("<script>alert('고객문의가 정상적으로 접수되었습니다'); location.href='http://localhost:8080/ToyWeb/main/main.jsp';</script>");
		}
		catch (Exception e){
			out.println("<script>alert('전송 실패');history.back();</script>");
			e.printStackTrace();
		}
	}
}

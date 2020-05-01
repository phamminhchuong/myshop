package util;

import java.io.IOException;

import org.apache.http.Consts;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.apache.http.util.EntityUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.bean.GooglePojo;


public class GoogleUtil {
	public static String GOOGLE_CLIENT_ID = "898148680750-3jqbdki12smq2enqghonup9mgkdf1l3p.apps.googleusercontent.com";
	  public static String GOOGLE_CLIENT_SECRET = "Vz2n-zvIRwzxGeTSyp1G1UQN";
	  public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/web/login-google";
	  public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
	  public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=";
	  public static String GOOGLE_GRANT_TYPE = "authorization_code";
	  
	  public String getToken(final String code) throws ClientProtocolException, IOException {
		    String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
		        .bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
		            .add("client_secret", GOOGLE_CLIENT_SECRET)
		            .add("redirect_uri", GOOGLE_REDIRECT_URI).add("code", code)
		            .add("grant_type", GOOGLE_GRANT_TYPE).build())
		        .execute().returnContent().asString();
		    ObjectMapper mapper = new ObjectMapper();
		    JsonNode node = mapper.readTree(response).get("access_token");
		    return node.textValue();
		  }

	  public GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		  
		    String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
		    //------------------
		    ResponseHandler<String> myHandler  = new ResponseHandler<String>() {
				public String handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
					// TODO Auto-generated method stub
					return EntityUtils.toString(response.getEntity(), Consts.UTF_8);
				}
			};	  
			//----------------------------------
		    String response = Request.Get(link).execute().handleResponse(myHandler);
		    byte[] bytes = response.getBytes("UTF-8");
		    ObjectMapper mapper = new ObjectMapper();
		    //JsonEncoding a = JsonEncoding.UTF8;
		    
		    GooglePojo googlePojo = mapper.readValue(bytes, GooglePojo.class);
		    System.out.println(response);
		    return googlePojo;
		  }
}

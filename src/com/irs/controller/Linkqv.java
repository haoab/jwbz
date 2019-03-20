package com.irs.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Authenticator;
import java.net.InetAddress;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.net.URLConnection;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.irs.util.ShiroUtils;
import com.sun.deploy.xml.XMLParser;





@Controller
@RequestMapping("/linkqv")
public class Linkqv {
	@RequestMapping("/getTicket")
	public String openURL(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		Subject subject = ShiroUtils.getSubject();
		String Url="";
//		if (session == null) {
//			// 转向登录页面
//			System.out.println("QlikView Ticket Getsession is null");
//			// writer.write("<script type='text/javascript'>function
//			// showalert(){alert('响应时间超出，请重新登录')}</script>");
//			return "redirect:"+request.getContextPath();
//			
//		}
		// UserBean session不存在
		 if (subject.getSession().getAttribute("username") == null) {
			System.out.println("QlikView Ticket GetUserBean is null");
			// 转向登录页面
			return "redirect:"+request.getContextPath();
			
		}
		// 可以得到用户的session信息
		else {
			/** ***********初始化参数准备********** */
			
			// 获取到QV文件名 
			String document = (String) request.getParameter("document").trim();
			// 获取UserBean（no）
			//UserBean userBean = (UserBean) session.getAttribute("UserBean");
			//String qq=userBean.getUserId();
			//System.out.println(qq);
			
			//定义documentcal
			String[] documentName=new String[100];
			for(int i=1;i<=100;i++){
				documentName[i-1]="documentname"+i;
			}
			// 获取系统用户名  定义数组
			
			String[] userNames={"name1","name2","name3","name4","name5"};  //name1...换成呷哺qmc里的登陆用户名
//			int a = (int)(Math.random()*4);
		    String username ;
		
			//System.out.println(userBean.getRemark());
				//System.out.println("document-------"+document.split("/")[1]);
				
		        //qvw文件名
				String filename=document.split("/")[1];

				int a = (int)(Math.random()*4);
				username = userNames[a];

			//userBean.getUserId();
			// 获取客户端机器名
			
			
			try{
				InetAddress inet = InetAddress.getLocalHost();
				String domain = inet.getHostName();
				System.out.println(document + "------" + username + "------------"
						+ domain);
				Properties systemSettings = System.getProperties();
			  //systemSettings.put("http.proxyHost", "biqx.xiabu.com");//localhost换成呷哺qlikview服务器IP
			  systemSettings.put("http.proxyHost", "192.168.32.129");
			  systemSettings.put("http.proxyPort", "80");
			
			
			Authenticator.setDefault(new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("Administrator", "wln@123"  //呷哺服务器密码
							.toCharArray());
				}
			});

			
			//String url = "http://biqx.xiabu.com/QvAJAXZfc/GetTicket.aspx?";  //localhost---》呷哺服务器IP
			String url = "http://192.168.32.129/QvAJAXZfc/GetTicket.aspx?";
			String charset = "GBK";

			URLConnection urlConnection = new URL(url).openConnection();
			urlConnection.setUseCaches(false);
			urlConnection.setDoOutput(true); // Triggers POST.
			urlConnection.setRequestProperty("accept-charset", charset);
			urlConnection.setRequestProperty("content-type",
					"application/x-www-form-urlencoded");

			OutputStreamWriter writer = null;
			try {
				writer = new OutputStreamWriter(
						urlConnection.getOutputStream(), charset);
				writer
						.write("<Global method=\"GetTicket\"><UserId>"
								+ username
								+ "</UserId><GroupList></GroupList><GroupListIsNames>true</GroupListIsNames></Global>");
			} finally {
				if (writer != null)
					try {
						writer.close();
					} catch (IOException logOrIgnore) {
					}
			}

			String resultXMLstr;
			
				resultXMLstr = convertStreamToString(urlConnection
						.getInputStream());
				XMLParser parser = new XMLParser(resultXMLstr);
				String ticket = parser.parse().getNested().getNested()
						.toString();
				// 最终跳转路径
				System.out.println("ticket:"+ticket);
				
				 Url= "http://192.168.32.129/QvAJAXZfc/opendoc.htm?userid="
						+"administrator"
						+ "&document="
						+ document
						+ ".qvw"+"&ticket=" + ticket;

				
				
				// System.out.println("end");
			
			
			}
			catch(Exception e){
				e.printStackTrace();
				}
			return "redirect:"+Url;
			}
		
		
		
		
	}
	public static String convertStreamToString(InputStream is) throws Exception {
		BufferedReader reader = new BufferedReader(new InputStreamReader(is));
		StringBuilder sb = new StringBuilder();
		String line = null;
		while ((line = reader.readLine()) != null) {
			sb.append(line + "\n");
		}
		is.close();
		return sb.toString();
	}
}

package com.irs.servlet;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.deploy.xml.XMLParser;
import com.sun.xml.internal.ws.encoding.XMLHTTPBindingCodec;

public class Linkqv extends HttpServlet {

	public Linkqv() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
     
		HttpSession session = request.getSession(false);
		if (session == null) {
			// 转向登录页面
			System.out.println("QlikView Ticket Getsession is null");
			// writer.write("<script type='text/javascript'>function
			// showalert(){alert('响应时间超出，请重新登录')}</script>");
			response.sendRedirect(request.getContextPath());
		}
		// UserBean session不存在
		else if (session.getAttribute("UserBean") == null) {
			System.out.println("QlikView Ticket GetUserBean is null");
			// 转向登录页面
			response.sendRedirect(request.getContextPath());
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
//			if(userBean.getRemark().equals("name")){
//				int a = (int)(Math.random()*4);
//				username = userNames[a];
//			}else 
				if(filename.equals("CWFX_JYKMZ")){
				
				//文件名为CWFX_JYKMZ（财务分析(基于科目帐)）时用的10个 documentcal,0~10取随机数（不包含10）
				int a = (int)(Math.random()*10);
				 username = documentName[a];
			}else if(filename.equals("DPFX")){
				//文件名为DPFX（点评分析）时用的5个 documentcal,10~15取随机数
				int a = (int)(10+Math.random()*5);
				 username = documentName[a];
				
			}else if(filename.equals("SWFX")){
				//文件名为SWFX（税务分析）时用的 3个documentcal,15~18取随机数
				int a = (int)(15+Math.random()*3);
				 username = documentName[a];
				
			}else if(filename.equals("CWFX_YJBGFX")){
				//文件名为CWFX_YJBGFX（业绩报告分析）时用的5个 documentcal,18~23取随机数
				int a = (int)(18+Math.random()*5);
				 username = documentName[a];
				
			}else if(filename.equals("YYFX")){
				//文件名为YYFX（营运分析）时用的5个 documentcal,23~28取随机数
				int a = (int)(23+Math.random()*5);
				 username = documentName[a];
				
			}else if(filename.equals("SCFX_XS")){
				//文件名为SCFX_XS（市场分析(销售)）时用的5个 documentcal,28~33取随机数
				int a = (int)(28+Math.random()*5);
				 username = documentName[a];
				
			}else if(filename.equals("SCFX_MXSJ")){
				//文件名为SCFX_MXSJ（市场分析(明细数据)）时用的5个 documentcal,33~38取随机数
				int a = (int)(33+Math.random()*5);
				 username = documentName[a];
				
			}else if(filename.equals("CGFX")){
				//文件名为CGFX（采购分析）时用的5个 documentcal,38~43取随机数
				int a = (int)(38+Math.random()*5);
				 username = documentName[a];
				
			}else if(filename.equals("CWFX_CPXS")){
				//文件名为CWFX_CPXS（财务分析）时用的5个 documentcal,43~48取随机数
				int a = (int)(43+Math.random()*5);
				 username = documentName[a];
				
			}else if(filename.equals("JCFX")){
				//文件名为JCFX（决策分析）时用的10个 documentcal,48~58取随机数
				int a = (int)(48+Math.random()*10);
				 username = documentName[a];
				
			}else if(filename.equals("WLFX")){
				//文件名为WLFX（物流分析）时用的5个 documentcal,58~63取随机数
				int a = (int)(58+Math.random()*5);
				 username = documentName[a];
				
			}else if(filename.equals("WLFX_KSXLTJB")){
				//文件名为WLFX_KSXLTJB（客诉系列统计表）时用的5个 documentcal,63~68取随机数
				int a = (int)(63+Math.random()*5);
				 username = documentName[a];
				
			}else if(filename.equals("CWFX_CB")){
				//文件名为CWFX_CB（财务分析（成本））时用的8个 documentcal,68~76取随机数
				int a = (int)(68+Math.random()*8);
				 username = documentName[a];	
			}
			else if(filename.equals("CTCGDJTJ")){
				//文件名为CTCGDJTJ（餐厅采购单价统计）时用的4个 documentcal,76~80取随机数
				int a = (int)(76+Math.random()*4);
				 username = documentName[a];	
			}
			else if(filename.equals("DZDPFX")){
				//文件名为DZDPFX（大众点评分析）时用的10个 documentcal,80~90取随机数
				int a = (int)(80+Math.random()*10);
				 username = documentName[a];	
			}
			else{
				
				int a = (int)(90+Math.random()*10);
				 username = documentName[a];
			}
			//userBean.getUserId();
			// 获取客户端机器名
			InetAddress inet = InetAddress.getLocalHost();
			String domain = inet.getHostName();
			System.out.println(document + "------" + username + "------------"
					+ domain);
			Properties systemSettings = System.getProperties();
			
			try{
				
			systemSettings.put("http.proxyHost", "biqx.xiabu.com");//localhost换成呷哺qlikview服务器IP
			//systemSettings.put("http.proxyHost", "localhost");
			systemSettings.put("http.proxyPort", "80");
			
			
			Authenticator.setDefault(new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("Administrator", "1qaz@WSX"  //呷哺服务器密码
							.toCharArray());
				}
			});

			
			String url = "http://biqx.xiabu.com/QvAJAXZfc/GetTicket.aspx?";  //localhost---》呷哺服务器IP
			//String url = "http://localhost/QvAJAXZfc/GetTicket.aspx?";
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
						.write("<Global method=\"GetTicket\"><UserId>portal\\"
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
			try {
				resultXMLstr = convertStreamToString(urlConnection
						.getInputStream());
				XMLParser parser = new XMLParser(resultXMLstr);
				String ticket = parser.parse().getNested().getNested()
						.toString();
				// 最终跳转路径
				System.out.println("ticket:"+ticket);
				
				String Url= "http://biqx.xiabu.com/QvAJAXZfc/opendoc.htm?userid="
						+"qq"
						+ "&document="
						+ document
						+ ".qvw"+"&ticket=" + ticket;

				System.out.println(Url);
				response.sendRedirect(Url);
				
				// System.out.println("end");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			}
			catch(Exception e){
				e.printStackTrace();
			}
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

	public void init() throws ServletException {

	}
}

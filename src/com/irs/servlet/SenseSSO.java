package com.irs.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SenseSSO extends HttpServlet{
	private static final long serialVersionUID = 1L;
	String appid = "";
	String sheet = "";

	public SenseSSO() {
		super();
	}
	
	public void verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = "dkm";
		String xrfkey = "J9sgmYWcMMWulyTp";
		String host = "OPSAPP";
		String IPhost = "172.16.100.61";
		appid=request.getParameter("appid");
		sheet=request.getParameter("sheet");
		String client=this.getClass().getClassLoader().getResource("client.jks").getPath();
		String root=this.getClass().getClassLoader().getResource("root.jks").getPath();
        System.out.println(client);
		try {
			//String certFolder = "E:\\211.88.37.33\\";
			String proxyCert = client;
			String proxyCertPass = "1234567";
			String rootCert = root;
			String rootCertPass = "1234567";
			/************** END Certificate Acquisition **************/

			/************** BEGIN Certificate configuration for use in connection **************/
			KeyStore ks = KeyStore.getInstance("JKS");
			ks.load(new FileInputStream(new File(proxyCert)), proxyCertPass.toCharArray());
			KeyManagerFactory kmf = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
			kmf.init(ks, proxyCertPass.toCharArray());
			SSLContext context = SSLContext.getInstance("SSL");
			KeyStore ksTrust = KeyStore.getInstance("JKS");
			ksTrust.load(new FileInputStream(rootCert), rootCertPass.toCharArray());
			TrustManagerFactory tmf = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
			tmf.init(ksTrust);
			context.init(kmf.getKeyManagers(), tmf.getTrustManagers(), null);
			SSLSocketFactory sslSocketFactory = context.getSocketFactory();
			/************** END Certificate configuration for use in connection **************/

			/************** BEGIN HTTPS Connection **************/
			// URL url = new URL("https://" + host + ":4243/qps/" + vproxy + "/ticket?xrfkey=" + xrfkey);
			URL url = new URL("https://" + IPhost + ":4243/qps/" + "ticket?xrfkey=" + xrfkey);
			HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
			connection.setHostnameVerifier(new SenseSSO().new TrustAnyHostnameVerifier());
			connection.setSSLSocketFactory(sslSocketFactory);
			connection.setRequestProperty("x-qlik-xrfkey", xrfkey);
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestProperty("Accept", "application/json");
			connection.setRequestMethod("POST");
			
			/************** BEGIN JSON Message to Qlik Sense Proxy API **************/
			String body = "{ 'UserId':'" + user + "','UserDirectory':'" + host + "',";
			body += "'Attributes': [],";
			body += "}";
			/************** END JSON Message to Qlik Sense Proxy API **************/
			OutputStreamWriter wr = new OutputStreamWriter(connection.getOutputStream());
			wr.write(body);
			wr.flush(); // Get the response from the QPS BufferedReader
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			StringBuilder builder = new StringBuilder();
			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				builder.append(inputLine);
			}
			in.close();
			String data = builder.toString();
			String[] str1 = data.split(",");
			String[] str2 = str1[3].split(":");
			String ticket = str2[1].replace("\"", "");
			String account = request.getParameter("account");
//			response.sendRedirect(request.getContextPath() + ssoURL + "?ticket=" + ticket);
//			response.sendRedirect("https://"+IPhost+"/hub/?QliktTicket=" + ticket);
			response.sendRedirect("http://"+IPhost+"\\:89/single/?appid="+appid+"&sheet="+sheet+"&select=clearall&qlikTicket="+ticket );
			
			/************** END HTTPS Connection **************/
		} catch (KeyStoreException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (CertificateException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnrecoverableKeyException e) {
			e.printStackTrace();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public class TrustAnyHostnameVerifier implements HostnameVerifier {
		public boolean verify(String hostname, SSLSession session) {
			return true;
		}
	}
}

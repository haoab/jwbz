package com.irs.controller;

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

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManagerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.irs.pojo.TbAdmin;

@Controller
@RequestMapping("linkHub/")
public class Llikhub {
	private static final long serialVersionUID = 1L;
	String ssoURL = "";
	@RequestMapping("/getTicket")
	public String openURL(HttpServletRequest request,HttpServletResponse response) {

		String user;
		String xrfkey;
		String host;
		String IPhost;
		String UserDirectory;
		String appid = request.getParameter("appid");
		String sheet = request.getParameter("sheet");
		try {
			// prop.load(filePath);
			user = "happy";// prop.getProperty("user");
			TbAdmin admin = (TbAdmin) SecurityUtils.getSubject().getPrincipal();
			System.out.println("===========" + admin.getUsername());
			xrfkey = "J9sgmYWcMMWulyTp";// prop.getProperty("xrfkey");
			host = "nan";// prop.getProperty("host");
			IPhost = "localhost";// prop.getProperty("IPhost");
			UserDirectory = "NAN";// prop.getProperty("UserDirectory");
			String certFolder = "D:\\Ticket\\nan\\";// prop.getProperty("certFolder");
			String proxyCert = certFolder + "client.jks";
			String proxyCertPass = "1234567";// prop.getProperty("proxyCertPass");
			String rootCert = certFolder + "root.jks";
			String rootCertPass = "1234567";// prop.getProperty("rootCertPass");
			System.out.println(user);
			/************** END Certificate Acquisition **************/
			/**************
			 * BEGIN Certificate configuration for use in connection
			 **************/
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
			/**************
			 * END Certificate configuration for use in connection
			 **************/
			/************** BEGIN HTTPS Connection **************/
			URL url = new URL("https://" + host + ":4243/qps/" + "ticket?xrfkey=" + xrfkey);
			HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
			connection.setSSLSocketFactory(sslSocketFactory);
			connection.setRequestProperty("x-qlik-xrfkey", xrfkey);
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestProperty("Accept", "application/json");
			connection.setRequestMethod("POST");
			/**************
			 * BEGIN JSON Message to Qlik Sense Proxy API
			 **************/
			String body = "{ 'UserId':'" + user + "','UserDirectory':'" + UserDirectory + "',";
			body += "'Attributes': [],";
			body += "}";
			/**************
			 * END JSON Message to Qlik Sense Proxy API
			 **************/
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
			// ssoURL="http://"+host+"/sense/app/"+appid+"/sheet/"+sheet+"/state/analysis?qlikTicket="+ticket;
			//ssoURL = "https://" + host + "/hub?qlikTicket="+ticket;
			ssoURL = "https://" + host + "/sense/app/dd48861e-1527-4774-bfb8-d0193550357e/sheet/d19767f7-293f-4382-9dfb-223644431cf1/state/edit?qlikTicket="+ticket;
			// https://win-4s3m3r5gvfe/single/?appid=216a76ef-fd7c-4069-9b6a-02af97af3dd7&sheet=0ee40b11-f432-4f4b-a324-5137f257fc64&theme=xuqyTheme&opt=currsel
			System.out.println(ssoURL);

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
		return "redirect:"+ssoURL;
	}
}

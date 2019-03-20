package com.irs.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.ResourceBundle;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.core.helpers.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.irs.util.GlobalUtil;
import com.irs.util.RandomUtils;
import com.irs.util.ResourceUtil;
import com.irs.util.ResponseResultLayui;
import com.irs.util.ResultUtil;
import com.irs.util.StringUtils;
/**
 * 文件上传controller11
 * @author Administrator
 *
 */
@Controller
@RequestMapping("file")
public class FileController {
	protected final Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/upload", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
	@ResponseBody
	public ResultUtil uploadFile(MultipartFile file, HttpServletRequest req) {
		if (file == null) {
			return ResultUtil.error("鏂囦欢涓嶈兘涓虹┖锛�");
		}
		String fileSub = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."))
				.toLowerCase();
		if (".jpg".equals(fileSub) || ".jpeg".equals(fileSub) || ".png".equals(fileSub) || ".gif".equals(fileSub)) {
			Random d = new Random();
			String img = UUID.randomUUID().toString().replace("-", "") + d.nextInt(10000) + "" + fileSub;
			try {
				// uploadFile.transferTo(new
				// File(req.getServletContext().getRealPath("WEB-INF/upload"),img));
				file.transferTo(new File(GlobalUtil.getValue("upfile.path"), img));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			Map<String, String> map = new HashMap<>();
			map.put("src", GlobalUtil.getValue("upfile.code") + img);
			return ResultUtil.ok(map);
		} else {
			return ResultUtil.error("鏂囦欢鏍煎紡涓嶆敮鎸�,璇烽噸鏂伴�夋嫨锛�");
		}
	}

	/**
	 * 鏈湴鍥剧墖鍥炴樉
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/showPic")
	@ResponseBody
	public String showPic(String fileName, HttpServletResponse response) {
		// String fileName="4d857472b93b4b9bb04d65f1506b2a329707.jpeg";
		FileInputStream fis = null;
		OutputStream os = null;
		try {
			// 鍥剧墖鐨勬湰鍦板叏璺緞
			fis = new FileInputStream("d:/upload/" + fileName);
			os = response.getOutputStream();
			int count = 0;
			byte[] buffer = new byte[1024 * 8];
			while ((count = fis.read(buffer)) != -1) {
				os.write(buffer, 0, count);
				os.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			fis.close();
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "ok";
	}

	/**
	 * 澶勭悊鏂囦欢涓嬭浇
	 * 
	 * @param request
	 * @param response
	 * @param fileName
	 */
	@RequestMapping(value = "/downLoad")
	@ResponseBody
	public void downLoadList(HttpServletRequest request, HttpServletResponse response, String fileName) {
		downloadFile(new File("d:/upload", fileName), response, false);
	}

	/**
	 * 鏂囦欢涓嬭浇
	 * 
	 * @param file
	 * @param response
	 * @param isDelete
	 */
	public void downloadFile(File file, HttpServletResponse response, boolean isDelete) {
		try {
			// 浠ユ祦鐨勫舰寮忎笅杞芥枃浠躲��
			BufferedInputStream fis = new BufferedInputStream(new FileInputStream(file.getPath()));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// 娓呯┖response
			response.reset();
			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition",
					"attachment;filename=" + new String(file.getName().getBytes("UTF-8"), "ISO-8859-1"));
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
			if (isDelete) {
				file.delete(); // 鏄惁灏嗙敓鎴愮殑鏈嶅姟鍣ㄧ鏂囦欢鍒犻櫎
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * 涓婁紶鍥剧墖
	 * 
	 * @param file
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/images")
	public Map<String, Object> images(MultipartFile upfile, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> params = new HashMap<String, Object>();
		try {
			String basePath = ResourceUtil.getValueByProNameAndKey("resource/global", "jwbz.uploading.url");
			String visitUrl = ResourceUtil.getValueByProNameAndKey("resource/global", "jwbz.visit.url");
			if (basePath == null || "".equals(basePath)) {
				basePath = "d:/lyz/static"; // 涓巔roperties鏂囦欢涓璴yz.uploading.url鐩稿悓锛屾湭璇诲彇鍒版枃浠舵暟鎹椂涓篵asePath璧嬮粯璁ゅ��
			}
			if (visitUrl == null || "".equals(visitUrl)) {
				visitUrl = "/upload/"; // 涓巔roperties鏂囦欢涓璴yz.visit.url鐩稿悓锛屾湭璇诲彇鍒版枃浠舵暟鎹椂涓簐isitUrl璧嬮粯璁ゅ��
			}
			String ext = StringUtils.getExt(upfile.getOriginalFilename());
			String fileName = String.valueOf(System.currentTimeMillis()).concat("_").concat(RandomUtils.getRandom(6))
					.concat(".").concat(ext);
			StringBuilder sb = new StringBuilder();
			// 鎷兼帴淇濆瓨璺緞
			sb.append(basePath).append("/").append(fileName);
			visitUrl = visitUrl.concat(fileName);
			File f = new File(sb.toString());
			if (!f.exists()) {
				f.getParentFile().mkdirs();
			}
			OutputStream out = new FileOutputStream(f);
			FileCopyUtils.copy(upfile.getInputStream(), out);
			params.put("state", "SUCCESS");
			params.put("url", visitUrl);
			params.put("size", upfile.getSize());
			params.put("original", fileName);
			params.put("type", upfile.getContentType());
		} catch (Exception e) {
			params.put("state", "ERROR");
		}
		return params;
	}

	/**
	 * 瀵屾枃鏈紪杈戝櫒涓笂浼犲浘鐗囧姛鑳�
	 * 
	 * @param list
	 * @return
	 */
	@RequestMapping(value = "/editorUpload")
	@ResponseBody
	public Map<String, Object> editorUpload(@RequestParam("fileN") List<MultipartFile> list) {

		Integer errno = 0;
		List<String> urls = new ArrayList<>();
		Map<String, Object> map = new HashMap<>(2);

		if (list.size() == 0) {
			errno = 1;
		}

		for (MultipartFile file : list) {
			// 姝ゅ璋冪敤鑷繁鐨勪笂浼犳枃浠舵柟娉�
			String url = savaImages(file);

			if (Strings.isNotEmpty(url)) {
				logger.debug("瀵屾枃鏈紪杈戝櫒涓婁紶鍥剧墖鎴愬姛锛屾枃浠跺悕锛歿}锛寀rl锛歿}", file.getOriginalFilename(), url);
				urls.add(url);
			} else {
				logger.debug("瀵屾枃鏈紪杈戝櫒涓婁紶鍥剧墖澶辫触锛屾枃浠跺悕锛歿}", file.getOriginalFilename());
				errno = 2;
			}
		}

		map.put("errno", errno);
		map.put("data", urls);
		return map;
	}

	/**
	 * 淇濆瓨鍥剧墖
	 * 
	 * @param file
	 * @return
	 */
	public String savaImages(MultipartFile file) {

		if (file.isEmpty()) {
			return "";
		}
		Date date = new Date();
		String y = new SimpleDateFormat("yyyy").format(date);
		String m = new SimpleDateFormat("MM").format(date);
		String d = new SimpleDateFormat("dd").format(date);
		String datePath = y + "/" + m + "/" + d;// 寰楀埌褰撳墠骞�/鏈�/鏃ヤ笁绾х洰褰�
		ResourceBundle resource = ResourceBundle.getBundle("resource/global");
		String key = resource.getString("upfile.path");// 鑾峰彇閰嶇疆鏂囦欢涓繚瀛樺浘鐗囩殑璺緞
		// 鑾峰彇key瀵瑰簲鐨剉alue鍊�
		String path = key + "/" + datePath;
		// 鍚庣紑
		String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));// 鍙栭櫎鍚庣紑,.jpg,.png绛�
		String fileName = new Date().getTime() + suffix;
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();// 鍒涘缓鏂囦欢
		}
		// 淇濆瓨
		try {
			file.transferTo(targetFile); // 澶嶅埗鎺ユ敹鐨勫浘鐗囨枃浠�
		} catch (Exception e) {
			e.printStackTrace();
		}
		String fileUrl = resource.getString("upfile.url") + datePath + "/" + fileName;
		return fileUrl;
	}

	/**
	 * 保存附件
	 * 
	 * @return
	 */
	@RequestMapping(value = "/savaAttachment")
	@ResponseBody
	public ResponseResultLayui<HashMap<String, String>> savaAttachment(MultipartFile file) {
		ResponseResultLayui<HashMap<String, String>> rr = new ResponseResultLayui<HashMap<String, String>>();

		if (file.isEmpty()) {
			rr.setCode(21);
			rr.setMsg("请选择文件");
			return rr;
		}
		Date date = new Date();
		String y = new SimpleDateFormat("yyyy").format(date);
		String m = new SimpleDateFormat("MM").format(date);
		String d = new SimpleDateFormat("dd").format(date);
		String datePath = y + "/" + m + "/" + d;// 
		ResourceBundle resource = ResourceBundle.getBundle("resource/global");
		String key = resource.getString("upfile.path");// 
		String path = key + "/" + datePath;
		// 
		String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String fileName = new Date().getTime() + suffix;
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();// 
		}
		// 
		try {
			file.transferTo(targetFile); // 
		} catch (Exception e) {
			e.printStackTrace();
		}
		String fileUrl =  datePath + "/" + fileName;

		rr.setCode(0);
		rr.setMsg("上传成功");
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("src", fileUrl);
		data.put("fileName", fileName);

		rr.setData(data);

		return rr;

	}

}

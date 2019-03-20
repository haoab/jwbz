package com.irs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irs.pojo.News;
import com.irs.pojo.TbVisit;
import com.irs.service.IFrontService;
import com.irs.service.IVisitService;
import com.irs.service.impl.VisitServiceImpl;
import com.irs.util.DateUtil;
import com.irs.util.ResultUtil;

@Controller
@RequestMapping("front")
public class FrontController {

	@Resource
	IVisitService visitServiceImpl;
	
	@Resource
	private IFrontService frontServiceImpl;

	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		saveVisit(request);
		setVisit(request);
		return "front/index";
	}

	@RequestMapping("/detail/{id}")
	public String detail(HttpServletRequest request,@PathVariable("id")Long id) {
		
		News news=frontServiceImpl.selOneNews(id);
		request.setAttribute("typename", frontServiceImpl.selNewsTypeNameById(news.getTypeid()));
		request.setAttribute("typeid", news.getTypeid());
		saveVisit(request);
		setVisit(request);
		request.setAttribute("news", news);
		return "front/detail";
	}
	@RequestMapping("/main")
	public String main(HttpServletRequest request) {
		//saveVisit(request);
		//setVisit(request);
		return "front/main";
	}


	@RequestMapping("/list/{typeid}")
	public String list(HttpServletRequest request,@PathVariable("typeid")Integer id) {
		String typename=frontServiceImpl.selNewsTypeNameById(id);
		System.out.println("=================="+typename);
		System.out.println(id);

		Integer typeid=id;
		request.setAttribute("typename", typename);
		request.setAttribute("typeid", typeid);

		//saveVisit(request);
		//setVisit(request);
		return "front/list";
	}
	
	/**
	 * 设置访问数据
	 * 
	 * @param request
	 */
	public void setVisit(HttpServletRequest request) {
		request.setAttribute("visitTimes", visitServiceImpl.getvisitTimes());
		request.setAttribute("visitTimesToday", visitServiceImpl.getvisitTimesToday());
		request.setAttribute("visitTimesToMonth", visitServiceImpl.getvisitTimesToMonth());
	}

	/**
	 * 保存访问数据
	 * 
	 * @param request
	 */
	public void saveVisit(HttpServletRequest request) {

		HttpSession session = request.getSession();

		if (session.isNew()) {
			String date = DateUtil.getDate(DateUtil.DateFormat1);
			TbVisit visit = new TbVisit();
			visit.setIp(request.getRemoteAddr());
			visit.setTime(date);
			visit.setUrl(request.getRequestURL().toString());
			visitServiceImpl.insertOneVisit(visit);
		}
	}
	
	@RequestMapping("/selAllNews")
	@ResponseBody
	public ResultUtil selAllNews(Integer page, Integer limit, News news){
		news.setVerify(0);
		return frontServiceImpl.selAllNewsByConditions(page, limit, news);
	}
	
	@RequestMapping("/selAllNewsCount")
	@ResponseBody
	public ResultUtil selAllNewsCount(News news){
		news.setVerify(0);
		return frontServiceImpl.selAllNewsCount( news);
	}
}

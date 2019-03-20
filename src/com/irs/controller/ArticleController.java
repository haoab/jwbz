package com.irs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irs.annotation.SysLog;
import com.irs.pojo.News;
import com.irs.pojo.NewsType;
import com.irs.pojo.TbAdmin;
import com.irs.service.IFrontService;
import com.irs.service.impl.FrontServiceImpl;
import com.irs.util.ResultUtil;

@Controller
@RequestMapping("art")
public class ArticleController {

	public ArticleController() {
	}
	
	/**
	 * 显示添加文章页面
	 * @return
	 */
	@RequestMapping("/showAddArticle")
	public String showAddArticle(){
		return "page/article/addArticle";
	}
	/**
	 * 显示审核
	 * @return
	 */
	@RequestMapping("/showVerifyArticle")
	@RequiresPermissions("sys:art:verify")
	public String showVerifyArticle(HttpServletRequest request,Long id){
		request.setAttribute("id", id);
		return "page/article/verifyArticle";
	}
	/**
	 * 显示编辑
	 * @return
	 */
	@RequestMapping("/showEditArticle")
	@RequiresPermissions("sys:art:edit")
	public String showEditArticle(HttpServletRequest request,Long id){
		request.setAttribute("news", frontServiceImpl.selOneNews(id));
		return "page/article/editArticle";
	}
	
	
	/**
	 * 显示预览
	 * @return
	 */
	@RequestMapping("/showDetailArticle")
	@RequiresPermissions("sys:art:view")
	public String showDetailArticle(HttpServletRequest request,Long id){
		request.setAttribute("news", frontServiceImpl.selOneNews(id));
		return "page/article/detailArticle";
	}
	
	/**
	 * 审核
	 * @return
	 */
	@RequestMapping("/verifyArticle")
	@RequiresPermissions("sys:art:verify")
	@ResponseBody
	public ResultUtil verifyArticle(HttpServletRequest request,Long id,Integer verify){
		ResultUtil resultUtil=new ResultUtil(0);
		News news=new News();
		news.setId(id);
		news.setVerify(verify);
		frontServiceImpl.saveVerify(news);
		return resultUtil;
	}
	/**
	 * 批量审核
	 * @param id
	 * @return
	 */
	@RequestMapping("/verifyArticleByIds")
	@RequiresPermissions("sys:art:verify")
	@ResponseBody
	public ResultUtil verifyArticleByIds(String id){
		ResultUtil resultUtil=new ResultUtil(0);
		frontServiceImpl.saveVerufyByIds(id);
		return resultUtil;
	}
	
	@Resource
	private IFrontService frontServiceImpl;
	/**
	 * 添加文章
	 * @param news
	 * @return
	 */
	@RequestMapping("/insNews")
	@ResponseBody
	public ResultUtil insNews(News news){
		TbAdmin admin = (TbAdmin)SecurityUtils.getSubject().getPrincipal();
		System.out.println(admin);
		news.setUserid(String.valueOf(admin.getId()));
		news.setUsername(admin.getUsername());
		news.setUserfullname(admin.getFullname());
		news.setVerify(1);//1是待审核  0是已审核  2是未通过
		int result=frontServiceImpl.insOneNews(news);
		ResultUtil resultUtil;
		if (result==0) {
			resultUtil=new ResultUtil(0);
		}else {
			resultUtil= new ResultUtil(1);
		}
		return resultUtil;
	}
	
	
	/**
	 * 更改文章
	 * @param news
	 * @return
	 */
	@RequestMapping("/updNews")
	@ResponseBody
	public ResultUtil updNews(News news){
	/*	TbAdmin admin = (TbAdmin)SecurityUtils.getSubject().getPrincipal();
		System.out.println(admin);
		news.setUserid(String.valueOf(admin.getId()));
		news.setUsername(admin.getUsername());
		news.setUserfullname(admin.getFullname());*/
		news.setVerify(1);//1是待审核  0是已审核  2是未通过
		int result=frontServiceImpl.updOneNews(news);
		ResultUtil resultUtil;
		if (result==0) {
			resultUtil=new ResultUtil(0);
		}else {
			resultUtil= new ResultUtil(1);
		}
		return resultUtil;
	}
		
	@RequestMapping("/selAllNewsTypes")
	@ResponseBody
	public List<NewsType> selAllNewsTypes(){
		return frontServiceImpl.selAllNewsTypes();
	}
	
	@RequestMapping("/showNewsList")
	public String showNewsList(){
		return "page/article/listArticle";
	}
	
	@RequestMapping("/selAllNews")
	@ResponseBody
	public ResultUtil selAllNews(Integer page, Integer limit, News news){
		
		return frontServiceImpl.selAllNewsByConditions(page, limit, news);
	}

	/**
	 * 删除新闻
	 * @param id
	 * @return
	 */
	@RequestMapping("/delNewsById/{id}")
	@RequiresPermissions("sys:art:delete")
	@ResponseBody
	public ResultUtil delNewsById(@PathVariable("id") String id){
		return frontServiceImpl.delNewsById(id);
	}

}

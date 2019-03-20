package com.irs.service;

import java.util.List;

import com.irs.pojo.News;
import com.irs.pojo.NewsType;
import com.irs.util.ResultUtil;

public interface IFrontService {

	/**
	 * 添加新闻
	 * @return
	 */
	public int insOneNews(News news);
	
	/**
	 * 更改新闻
	 * @return
	 */
	public int updOneNews(News news);
	
	/**
	 * 获取新闻
	 * @return
	 */
	public News selOneNews(Long  id);
	/**
	 * 获取所有新闻类别
	 * @return
	 */
	public List<NewsType> selAllNewsTypes();
	
	/**
	 * 获取新闻列表
	 */
	
	public ResultUtil selAllNewsByConditions(Integer page,Integer limit,News news);
	
	/**
	 * 获取新闻类别名称
	 * @param id
	 * @return
	 */
	public String selNewsTypeNameById(Integer id);
	
	/**
	 * 根据id删除
	 */
	public ResultUtil delNewsById(String idsString );
	
	/**
	 * 审核
	 */
	public void saveVerify(News news);
	
	/**
	 * 批量审核
	 */
	
	public void saveVerufyByIds(String id);

	public ResultUtil selAllNewsCount(News news);
	
	
	
	
}

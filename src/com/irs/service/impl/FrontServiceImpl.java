package com.irs.service.impl;

import java.io.Console;
import java.util.List;
import java.util.ResourceBundle;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.irs.mapper.NewsMapper;
import com.irs.mapper.NewsTypeMapper;
import com.irs.pojo.News;
import com.irs.pojo.NewsExample;
import com.irs.pojo.NewsType;
import com.irs.service.IFrontService;
import com.irs.util.ResultUtil;
@Service
public class FrontServiceImpl implements IFrontService{

	
	@Resource
	private NewsMapper newsMapper;
	
	@Resource
	private NewsTypeMapper  newsTypeMapper;
	
	@Override
	public int insOneNews(News news) {
		NewsExample example=new NewsExample();
		example.createCriteria().andTitleEqualTo(news.getTitle());
		if (newsMapper.selectByExample(example).size()>0) {
			return 1;//文章重名
		}
		newsMapper.insertSelective(news);
		return 0;
	}


	@Override
	public List<NewsType> selAllNewsTypes() {
		return newsTypeMapper.selectByExample(null);
	}


	@Override
	public ResultUtil selAllNewsByConditions(Integer page, Integer limit, News news) {
		PageHelper.startPage(page, limit);
		NewsExample example=new NewsExample();
		example.setOrderByClause("pubtime desc,title");
		NewsExample.Criteria criteria=example.createCriteria();
		
		if(news.getTitle()!=null&&!"".equals(news.getTitle())){
			criteria.andTitleLike("%"+news.getTitle()+"%");
		}
		if(news.getTypeid()!=null&&!"".equals(news.getTypeid())){
			criteria.andTypeidEqualTo(news.getTypeid());
		}
		if(news.getPubtime()!=null&&!"".equals(news.getPubtime())){
			criteria.andPubtimeGreaterThanOrEqualTo(news.getPubtime());
		}
		if(news.getVerify()!=null&&!"".equals(news.getVerify())){
			criteria.andVerifyEqualTo(news.getVerify());
		}
		List<News> list=newsMapper.selectByExample(example);
		ResourceBundle resource = ResourceBundle.getBundle("resource/global");
		String key = resource.getString("upfile.url");
		for (News n : list) {
			if (n.getTypeid()!=null) {
				n.setTypeName(selNewsTypeNameById(n.getTypeid()));
			}
			//System.out.println("---------------------"+n.getFileurl()+"++++-----");

			if (!"".equals(n.getFileurl())) {
				n.setFileurl(key+n.getFileurl());
			}
			if (!"".equals(n.getImgurl())) {
				n.setImgurl(key+n.getImgurl());
			}
			
			//System.out.println("---------------------"+n.getFileurl());
		}
		PageInfo<News> pageInfo=new PageInfo<News>(list);
		ResultUtil resultUtil=new ResultUtil();
		resultUtil.setCode(0);
		resultUtil.setCount(pageInfo.getTotal());
		resultUtil.setData(pageInfo.getList());
		return resultUtil;
	}


	@Override
	public String selNewsTypeNameById(Integer id) {
		return newsTypeMapper.selectByPrimaryKey(id).getName();
	}


	@Override
	public ResultUtil delNewsById(String idsString) {
			String[] strs = idsString.split(",");
			if(strs!=null&&strs.length>0){
				for (String id : strs) {
					newsMapper.deleteByPrimaryKey(Long.valueOf(id));
				}
			}
		
		
		ResultUtil resultUtil=new ResultUtil(0);
		return resultUtil;
	}


	@Override
	public void saveVerify(News news) {
		newsMapper.updateByPrimaryKeySelective(news);
	}


	@Override
	public void saveVerufyByIds(String id) {
		String[] strs = id.split(",");
		if(strs!=null&&strs.length>0){
			for (String i : strs) {
				News news=new News();
				news.setId(Long.valueOf(i));
				news.setVerify(0);
				newsMapper.updateByPrimaryKeySelective(news);
			}
		}		
	}


	@Override
	public News selOneNews(Long id) {
		
		ResourceBundle resource = ResourceBundle.getBundle("resource/global");
		String key = resource.getString("upfile.url");
		News news=newsMapper.selectByPrimaryKey(id);
		if (!"".equals(news.getFileurl())) {
			news.setFileurl(key+news.getFileurl());
		}
		if(!"".equals(news.getImgurl())){
			news.setImgurl(key+news.getImgurl());
		}
		return news;
	}


	@Override
	public int updOneNews(News news) {
		
		NewsExample example=new NewsExample();
		example.createCriteria().andTitleEqualTo(news.getTitle());
		List<News> list=newsMapper.selectByExample(example);
		if (list.size()>0) {
			for (News n : list) {
				if (n.getId()!=news.getId()) {
					return 1;//文章重名 
				}
			}
		}
		ResourceBundle resource = ResourceBundle.getBundle("resource/global");
		String key = resource.getString("upfile.url");
		if (!"".equals(news.getFileurl())) {								
			System.out.println( news.getFileurl());
			if (news.getFileurl().contains(key)) {
				news.setFileurl(news.getFileurl().substring(key.length(), news.getFileurl().length()));
			}
			System.out.println("结果"+news.getFileurl());
		}
		if(!"".equals(news.getImgurl())){
			if (news.getImgurl().contains(key)) {
				news.setImgurl(news.getImgurl().substring(key.length(), news.getImgurl().length()));
			}
			System.out.println("+++++++++++++++++++++"+news.getImgurl());

		}
		System.out.println("结果"+news);
		return newsMapper.updateByPrimaryKeySelective(news)-1;
	}


	@Override
	public ResultUtil selAllNewsCount(News news) {
		NewsExample example=new NewsExample();
		example.setOrderByClause("pubtime desc,title");
		NewsExample.Criteria criteria=example.createCriteria();
		if(news.getTypeid()!=null&&!"".equals(news.getTypeid())){
			criteria.andTypeidEqualTo(news.getTypeid());
		}
		if(news.getVerify()!=null&&!"".equals(news.getVerify())){
			criteria.andVerifyEqualTo(news.getVerify());
		}
		ResultUtil resultUtil=new ResultUtil();
		resultUtil.setCode(0);
		resultUtil.setData(newsMapper.countByExample(example));
		return resultUtil;
	}

}

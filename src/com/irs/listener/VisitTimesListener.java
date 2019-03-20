package com.irs.listener;


import javax.servlet.ServletContext;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.irs.mapper.TbVisitMapper;
import com.irs.pojo.TbVisit;
import com.irs.pojo.TbVisitExample;
import com.irs.util.DateUtil;
/**
 * 
 *@describe  
 *@date 2018年9月21日 上午11:45:59
 *@author wangliang
 *
 */
public class VisitTimesListener implements ServletRequestListener {
	private Log log = LogFactory.getLog(getClass());
	private ApplicationContext applicationContext = null;

	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {

	}

	@Override
	public void requestInitialized(ServletRequestEvent arg0) {
		HttpServletRequest request = (HttpServletRequest) arg0
				.getServletRequest();
		HttpSession session = request.getSession();
		ServletContext servletContext = session.getServletContext();
		
		
		
		TbVisit visit = null;
		TbVisitMapper tbVisitMapper = null;
		//servletContext中初始化的applicationContext的名字为"org.springframework.web.context.WebApplicationContext.ROOT"
		//也可以通过WebApplicationContextUtils来获取到
//		applicationContext = (ApplicationContext) servletContext
//				.getAttribute("org.springframework.web.context.WebApplicationContext.ROOT");
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);  
		String date=DateUtil.getDate(DateUtil.DateFormat1);	
		
		try {
			tbVisitMapper = (TbVisitMapper) applicationContext
					.getBean("tbVisitMapper");			
			
			if (request.getRequestURL().toString().indexOf("/jwbz/front/")>0) {
				log.debug("-------访问的请求是前端页面，则统计--------");
				if (session.isNew()) {			
					log.debug(applicationContext.getBean("tbVisitMapper"));					
					visit = new TbVisit();
					// 先判断当前ip当天是否已经访问过,如果没有则保存当前访问记录
					/*TbVisitExample e=new TbVisitExample();
					e.createCriteria().andIpLike(request.getRemoteAddr());
					e.createCriteria().andTimeLike(date.substring(0, 10)+'%');
					if (tbVisitMapper.selectByExample(e).size()>0) {
						log.debug("-----今天这地址访问过我们-----");
					}else {
						visit.setIp(request.getRemoteAddr());
						visit.setTime(date);
						visit.setUrl(request.getRequestURL().toString());
						tbVisitMapper.insertSelective(visit);
					}*/
					visit.setIp(request.getRemoteAddr());
					visit.setTime(date);
					visit.setUrl(request.getRequestURL().toString());
					tbVisitMapper.insertSelective(visit);
				
					
				}
			}else{
				
				return;
			}
			
			// 显示今天的访问次数
			
			Integer visitTimes = tbVisitMapper.countByExample(null);
			TbVisitExample example=new TbVisitExample();
			example.createCriteria().andTimeLike(date.substring(0, 10)+'%');
			Integer visitTimesToday= tbVisitMapper.countByExample(example);
			TbVisitExample example1=new TbVisitExample();
			example1.createCriteria().andTimeLike(date.substring(0, 7)+'%');
			Integer visitTimesToMonth= tbVisitMapper.countByExample(example1);
			
			
			arg0.getServletContext().setAttribute("visitTimes", visitTimes);
			arg0.getServletContext().setAttribute("visitTimesToday", visitTimesToday);
			arg0.getServletContext().setAttribute("visitTimesToMonth", visitTimesToMonth);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

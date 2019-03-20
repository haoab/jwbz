package com.irs.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.irs.mapper.TbVisitMapper;
import com.irs.pojo.TbVisit;
import com.irs.pojo.TbVisitExample;
import com.irs.service.IVisitService;
import com.irs.util.DateUtil;

@Service
public class VisitServiceImpl implements IVisitService {
	@Resource
	TbVisitMapper tbVisitMapper;

	@Override
	public void insertOneVisit(TbVisit t) {
		tbVisitMapper.insertSelective(t);
	}
	String date = DateUtil.getDate(DateUtil.DateFormat1);
	@Override
	public Integer getvisitTimes() {
		// 显示今天的访问次数
		Integer visitTimes = tbVisitMapper.countByExample(null);
		return visitTimes;
	}

	@Override
	public Integer getvisitTimesToday() {
		TbVisitExample example = new TbVisitExample();
		example.createCriteria().andTimeLike(date.substring(0, 10) + '%');
		Integer visitTimesToday = tbVisitMapper.countByExample(example);
		return visitTimesToday;
	}
	@Override
	public Integer getvisitTimesToMonth() {
		TbVisitExample example1 = new TbVisitExample();
		example1.createCriteria().andTimeLike(date.substring(0, 7) + '%');
		Integer visitTimesToMonth = tbVisitMapper.countByExample(example1);
		return visitTimesToMonth;
	}

}

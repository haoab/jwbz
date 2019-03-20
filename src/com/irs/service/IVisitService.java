package com.irs.service;

import com.irs.pojo.TbVisit;

public interface IVisitService {

	void insertOneVisit(TbVisit t);
	
	Integer getvisitTimes();
		
	Integer getvisitTimesToday();
	
	Integer getvisitTimesToMonth();
}

package com.medical.service;


import java.util.List;
import org.bson.Document;
import com.medical.domain.MedicalVO;
import com.medical.domain.SidoVO;



public interface Medical_service {

	// 약국 목록을 mongodb에 저장
	public List<Document> listAll(MedicalVO m) throws Exception; 
	
	// 시도 코드 저장
	public void insert_sido(SidoVO sido) throws Exception;
	
	// 시군 코드 저장
	public void insert_sigun(SidoVO sigun) throws Exception;
	


}

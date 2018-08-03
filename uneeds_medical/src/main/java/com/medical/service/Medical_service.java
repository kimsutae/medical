package com.medical.service;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.bson.Document;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.medical.domain.MedicalVO;
import com.medical.persistence.MongoDAO;
import com.mongodb.client.FindIterable;

@Service
public class Medical_service {
	@Inject
	private MongoDAO dao;
	
	// 약국 목록을 mongodb에 저장
	public List<Document> listAll(MedicalVO m) throws Exception {
		FindIterable<Document> docs = dao.insertMedicals(m);
		// FindIterable을 iterator로 변환
		Iterator<Document> it = docs.iterator();
		// iterator를 List<Document> 변환
		List<Document> list = Lists.newArrayList(it);
		return list;
	}
	
	// 시도 코드 저장
	
	
	// 시군 코드 저장
	
	
	// 동 코드 저장
	

}

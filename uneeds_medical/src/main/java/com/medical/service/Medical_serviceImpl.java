package com.medical.service;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.bson.Document;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.medical.domain.MedicalVO;
import com.medical.domain.SidoVO;
import com.medical.persistence.InsertDAO;
import com.medical.persistence.MongoDAO;
import com.mongodb.client.FindIterable;


@Repository
public class Medical_serviceImpl implements Medical_service {

	@Inject
	private SqlSession mysqlSession;
	@Inject
	private MongoDAO dao;
	
	@Inject
	private InsertDAO dao2;

	@Override
	public List<Document> listAll(MedicalVO m) throws Exception {
		FindIterable<Document> docs = dao.insertMedicals(m);
		// FindIterable을 iterator로 변환
		Iterator<Document> it = docs.iterator();
		// iterator를 List<Document> 변환
		List<Document> list = Lists.newArrayList(it);
		return list;
	}

	@Override
	public void insert_sido(SidoVO sido) throws Exception {
		dao2.insertData(sido);
	}

	@Override
	public void insert_sigun(SidoVO sigun) throws Exception {
		 dao2.insertData(sigun);
		
	}


}

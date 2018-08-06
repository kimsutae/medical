package com.medical.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.medical.domain.SidoVO;


@Repository
public class InsertDAOImpl implements InsertDAO {

	@Inject
	private SqlSession mysqlSession; 
	
	private static final String namespace = "com.medical.mapper.medicalMapper";
	
	@Override
	public void insertData(SidoVO vo) {
		mysqlSession.insert(namespace + ".sidoinsert", vo);	
		
	}

	@Override
	public List<SidoVO> selectSido() {
		List<SidoVO> list = mysqlSession.selectList(namespace + ".selectSido");
		return null;
	}
	
}

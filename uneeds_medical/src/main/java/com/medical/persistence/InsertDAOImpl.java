package com.medical.persistence;

<<<<<<< HEAD

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.medical.domain.KindsVO;
import com.medical.domain.SidoVO;
import com.medical.domain.SigunVO;
import com.medical.domain.ThemaVO;

@Repository
public class InsertDAOImpl implements InsertDAO {

	@Inject
	private SqlSession mysqlSession; 
	
	private static final String namespace = "com.medical.mappers.medicalMapper";
	

	@Override
	public void insertSido(SidoVO vo) {
		mysqlSession.insert(namespace + ".insertSido", vo);	
		
	}


	@Override
	public void insertSigun(SigunVO vvo) {
		 mysqlSession.insert(namespace+".insertSigun",vvo);
		
	}


	@Override
	public void insertKinds(KindsVO ko) {
		mysqlSession.insert(namespace+".insertKinds",ko);
	}


	@Override
	public void insertThema(ThemaVO to) {
		mysqlSession.insert(namespace+".insertThema",to);
		
	}
	
}
=======
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.medical.domain.KindsVO;
import com.medical.domain.SidoVO;
import com.medical.domain.SigunVO;
import com.medical.domain.ThemaVO;


@Repository
public class InsertDAOImpl implements InsertDAO {

	@Inject
	private SqlSession mysqlSession; 
	
	private static final String namespace = "com.medical.mappers.medicalMapper";
	
	@Override
	public void insertSido(SidoVO vo) {
		mysqlSession.insert(namespace + ".insertSido", vo);	
		
	}

	@Override
	public void insertSigun(SigunVO vvo) {
		mysqlSession.insert(namespace + ".insertSigun", vvo);	
		
	}

	@Override
	public void insertKinds(KindsVO ko) {
		mysqlSession.insert(namespace + ".insertKinds", ko);	
		
	}

	@Override
	public void insertThema(ThemaVO to) {
		mysqlSession.insert(namespace + ".insertThema", to);
		
	}

}
>>>>>>> branch 'master' of https://github.com/kimsutae/medical.git

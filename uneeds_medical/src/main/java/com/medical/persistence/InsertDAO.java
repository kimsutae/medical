package com.medical.persistence;


import com.medical.domain.KindsVO;
import com.medical.domain.SidoVO;
import com.medical.domain.SigunVO;
import com.medical.domain.ThemaVO;

public interface InsertDAO {
	public void insertSido(SidoVO vo);
	public void insertSigun(SigunVO vvo);
	public void insertKinds(KindsVO ko);
	public void insertThema(ThemaVO to);
	
}

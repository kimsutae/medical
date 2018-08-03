package com.medical.persistence;

import java.util.List;

import com.medical.domain.SidoVO;

public interface InsertDAO {
	public void insertData(SidoVO vo);
	public List<SidoVO> selectFood();

}

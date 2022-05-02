package com.second.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.second.demo.dto.accountVO;

@Mapper
public interface accountDao {

	accountVO getAccount(String busi_num);

	void deleteAccount(String busi_num);

	void insertAccount(accountVO accountVO);

	void updateAccount(accountVO accountVO);

}

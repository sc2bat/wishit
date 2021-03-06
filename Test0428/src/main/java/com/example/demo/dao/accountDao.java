package com.example.demo.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.accountVO;
import com.example.demo.dto.customVO;

@Mapper
public interface accountDao {

	accountVO getAccount(String busi_num);

	void deleteAccount(String busi_num);

	void insertAccount(accountVO accountVO);

	void updateAccount(accountVO accountVO);

}

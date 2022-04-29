package com.example.demo.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.customVO;

@Mapper
public interface customDao {

	ArrayList<customVO> getCustom(String busi_num);

	void insertCustom(customVO customVO);

	void updateCustom(customVO customVO);

	ArrayList<customVO> getCustomSearchResult(String busi_num_key, String custom_key);

	void deleteCustom(String busi_num);

}

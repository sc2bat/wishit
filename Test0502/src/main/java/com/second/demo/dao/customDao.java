package com.second.demo.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.second.demo.dto.countryVO;
import com.second.demo.dto.customVO;

@Mapper
public interface customDao {

	ArrayList<customVO> getCustom(String busi_num);

	void insertCustom(customVO customVO);

	void updateCustom(customVO customVO);

	ArrayList<customVO> getCustomSearchResult(String busi_num_key, String custom_key);

	void deleteCustom(String busi_num);

	ArrayList<countryVO> getCountry(String country_eng, String country_kor);

	customVO getCustomInfo(String busi_num);

}

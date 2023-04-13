package com.petshop.purchase.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.purchase.dto.ConfirmVO;
import com.petshop.purchase.dto.SalesQuantity;

import utils.Criteria;

@Repository
public class ConfirmDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<ConfirmVO> getConfirmAllList(Criteria criteria,String mid){
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("mid", mid);
		
		return mybatis.selectList("ConfirmMapping.getConfirmAllList",map);
	}
	public int getConfirmAllCount(String mid) {
		return mybatis.selectOne("ConfirmMapping.getConfirmAllCount",mid);
	}
	
	 public List<SalesQuantity> getProductSales(){
		   return mybatis.selectList("ConfirmMapping.listProductSales");
	   }
	 
	 
	 public void insertConfirm(ConfirmVO vo) {
		 mybatis.insert("ConfirmMapping.insertConfirm", vo);
	 }
	 
	 public int getLastConfirm(String mid) {
		 return mybatis.selectOne("ConfirmMapping.getLastConfirm", mid);
	 }
	 public void confirmUpdate(int cono) {
		 mybatis.update("ConfirmMapping.confirmUpdate", cono);
	 }
	 public List<ConfirmVO> getConfirmNowList(Criteria criteria,String mid){
		 HashMap<String, Object> map = new HashMap<>();
		 map.put("criteria", criteria);
			map.put("mid", mid);
			return mybatis.selectList("ConfirmMapping.getConfirmNowList", map);
	 }
	 public int getConfirmNowCount(String mid) {
		 return mybatis.selectOne("ConfirmMapping.getConfirmNowCount", mid);
	 }
	 public List<ConfirmVO> getConfirmPastList(Criteria criteria,String mid){
		 HashMap<String, Object> map = new HashMap<>();
		 map.put("criteria", criteria);
			map.put("mid", mid);
			return mybatis.selectList("ConfirmMapping.getConfirmPastList", map);
	 }
	 public int getConfirmPastCount(String mid) {
		 return mybatis.selectOne("ConfirmMapping.getConfirmPastCount", mid);
	 }
	 
	 public ConfirmVO getConfirm(int cono) {
		 return mybatis.selectOne("ConfirmMapping.getConfirm", cono);
	 }
	 
	 public void deleteConfirm(int cono) {
		 mybatis.delete("ConfirmMapping.deleteConfirm", cono);
	 }
	   

}

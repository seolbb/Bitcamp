package com.spring.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.common.JDBCUtil;
import com.spring.biz.user.UserVO;

// MyBatis 사용 방식으로 작성하고 UserServiceImpl 에 적용
@Repository
public class UserDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserDAOMybatis() {
		System.out.println(">> UserDAOMybatis() 객체 생성");
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("===> MyBatis로 getUser() 실행");
		return mybatis.selectOne("userDAO.getUser", vo);
	}
}

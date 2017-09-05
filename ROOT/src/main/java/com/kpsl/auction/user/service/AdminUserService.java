package com.kpsl.auction.user.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.user.vo.AdminUserSearchVo;
import com.kpsl.auction.user.vo.GradeVo;
import com.kpsl.auction.user.vo.UserDetailVo;

@Transactional
public interface AdminUserService {
	List<AdminUserSearchVo> getUserSearch(AdminUserSearchVo adminUserSearchVo);
}

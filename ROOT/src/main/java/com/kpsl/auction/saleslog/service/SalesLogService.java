package com.kpsl.auction.saleslog.service;

import org.springframework.transaction.annotation.Transactional;

import com.kpsl.auction.saleslog.vo.SalesLogVo;
@Transactional
public interface SalesLogService {

	int addIncomeSalesLog(SalesLogVo salesLogVo);
}

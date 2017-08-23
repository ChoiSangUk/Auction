package com.kpsl.auction.ad.vo;
// 광고 이미지저장을 위한 VO
public class AdImageVo {
	private String adImageCode;
	private String adApplyCode;
	private String adImageName;
	private String adImagePath;
	
	public String getAdImagePath() {
		return adImagePath;
	}
	public void setAdImagePath(String adImagePath) {
		this.adImagePath = adImagePath;
	}
	public String getAdImageCode() {
		return adImageCode;
	}
	public void setAdImageCode(String adImageCode) {
		this.adImageCode = adImageCode;
	}
	public String getAdApplyCode() {
		return adApplyCode;
	}
	public void setAdApplyCode(String adApplyCode) {
		this.adApplyCode = adApplyCode;
	}
	public String getAdImageName() {
		return adImageName;
	}
	public void setAdImageName(String adImageName) {
		this.adImageName = adImageName;
	}
}

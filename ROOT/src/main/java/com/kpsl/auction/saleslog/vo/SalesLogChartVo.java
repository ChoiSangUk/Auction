package com.kpsl.auction.saleslog.vo;

/*******************
 * 구글차트 사용을 위한 VO
 *******************/
public class SalesLogChartVo {

	private String chartDate;
	private long salesPrice;
	private long expensesPrice;
	
	public String getChartDate() {
		return chartDate;
	}
	public void setChartDate(String chartDate) {
		this.chartDate = chartDate;
	}
	public long getSalesPrice() {
		return salesPrice;
	}
	public void setSalesPrice(long salesPrice) {
		this.salesPrice = salesPrice;
	}
	public long getExpensesPrice() {
		return expensesPrice;
	}
	public void setExpensesPrice(long expensesPrice) {
		this.expensesPrice = expensesPrice;
	}	
}

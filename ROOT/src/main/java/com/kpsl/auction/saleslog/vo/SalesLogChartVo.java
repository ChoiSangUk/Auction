package com.kpsl.auction.saleslog.vo;

/*******************
 * 구글차트 사용을 위한 VO
 *******************/
public class SalesLogChartVo {

	private String chartDate;
	private int salesPrice;
	private int expensesPrice;
	
	public String getChartDate() {
		return chartDate;
	}
	public void setChartDate(String chartDate) {
		this.chartDate = chartDate;
	}
	public int getSalesPrice() {
		return salesPrice;
	}
	public void setSalesPrice(int salesPrice) {
		this.salesPrice = salesPrice;
	}
	public int getExpensesPrice() {
		return expensesPrice;
	}
	public void setExpensesPrice(int expensesPrice) {
		this.expensesPrice = expensesPrice;
	}	
}

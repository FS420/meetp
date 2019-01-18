package cn.itcast.util;

import java.util.List;

public class Contition {

	private int shopId; // 分页时，根据food表的shopId进行数据分页
	private String shopName; // 分页时，根据shop表的shopName进行数据分页
    private List<Integer> shopIdList ;    // 多个条件查询
    private int userId ;  //用户的id
    
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public List<Integer> getShopIdList() {
		return shopIdList;
	}

	public void setShopIdList(List<Integer> shopIdList) {
		this.shopIdList = shopIdList;
	}
	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

}

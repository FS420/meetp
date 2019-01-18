package cn.itcast.entity;

import java.util.List;

import cn.itcast.util.Contition;


/**
 * 
 * 分页类
 * @author FS
 *
 */
public class PageBean<T> {

	private int currentPage = 1;   // 默认是第一行
	private int pageCount = 4  ;   // 每页显示多少行
	private int totalCount     ;   // 总共的行数
	private int totalPage      ;   // 总共的页数
	private List<T> pageData   ;   // 分页查到的数据（多少行）
	private int index;             //从哪一行开始
	private int count;             //读取几行
	
	private Contition con      ;   // 封装查询的条件

	
	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Contition getCon() {
		return con;
	}

	public void setCon(Contition con) {
		this.con = con;
	}

	public int getCurrentPage() {

		return currentPage;
	}

	public void setCurrentPage(int currentPage) {

		this.currentPage = currentPage;
	}

	public int getPageCount() {

		return pageCount;
	}

	public void setPageCount(int pageCount) {

		this.pageCount = pageCount;

	}

	public int getTotalCount() {
		return totalCount;

	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

	}

	public int getTotalPage() { // 总的页数
		if (totalCount % pageCount == 0) {
			totalPage = totalCount / pageCount;
		} else {
			totalPage = totalCount / pageCount + 1;
		}
		return totalPage;

	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;

	}

	public List<T> getPageData() {
		return pageData;

	}

	public void setPageData(List<T> pageData) {
		this.pageData = pageData;

	}

}

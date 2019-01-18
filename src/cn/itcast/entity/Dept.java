package cn.itcast.entity;

import java.io.Serializable;


/* 有时候需要实现Serializable接口 */
public class Dept implements Serializable{

	/**
	 *  FS
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
    private String name;

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
	@Override
	public String toString() {
		return "Dept [id=" + id + ", name=" + name + "]";
	}
    
}
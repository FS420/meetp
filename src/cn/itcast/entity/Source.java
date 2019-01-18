package cn.itcast.entity;

public class Source {
    private String id;

    private String name;

    private String type;

    private Integer free;

    private Integer availabe;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getFree() {
        return free;
    }

    public void setFree(Integer free) {
        this.free = free;
    }

    public Integer getAvailabe() {
        return availabe;
    }

    public void setAvailabe(Integer availabe) {
        this.availabe = availabe;
    }

	@Override
	public String toString() {
		return "Source [id=" + id + ", name=" + name + ", type=" + type
				+ ", free=" + free + ", availabe=" + availabe + "]";
	}
}
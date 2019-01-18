package cn.itcast.entity;

public class Meetroom {
    private String id;

    private String roomname;

    private String roomplace;

    private Integer holdnumber;

    private Boolean isable;

    private String memo;

    private Integer ordernumber;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public String getRoomplace() {
        return roomplace;
    }

    public void setRoomplace(String roomplace) {
        this.roomplace = roomplace;
    }

    public Integer getHoldnumber() {
        return holdnumber;
    }

    public void setHoldnumber(Integer holdnumber) {
        this.holdnumber = holdnumber;
    }

    public Boolean getIsable() {
        return isable;
    }

    public void setIsable(Boolean isable) {
        this.isable = isable;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public Integer getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(Integer ordernumber) {
        this.ordernumber = ordernumber;
    }

	@Override
	public String toString() {
		return "Meetroom [id=" + id + ", roomname=" + roomname + ", roomplace="
				+ roomplace + ", holdnumber=" + holdnumber + ", isable="
				+ isable + ", memo=" + memo + ", ordernumber=" + ordernumber
				+ "]";
	}
    
}
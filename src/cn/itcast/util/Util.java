package cn.itcast.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Util {
	public static boolean compare(Date t1,Date t2){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		if(t1.after(t2))
			return true;
		else
			return false;
	}
}

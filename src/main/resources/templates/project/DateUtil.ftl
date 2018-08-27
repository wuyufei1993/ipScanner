package ${group}.system.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类<br>
 * 获取当前日期<br>
 * 获取当前星期<br>
 * 
 * @author antgan
 *
 */
public class DateUtil {
	/**
	 * 计算当前周
	 * 
	 * @param startDate
	 *            起始周
	 * @return
	 */
	public static String getCurrentWeek(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String week = "";
		try {
			System.out.println("date-- : " + date);
			if (date != null) {
				Date startDate = sdf.parse(date);
				int startDay = (int) (startDate.getTime() / 1000 / 60 / 60 / 24);
				int currentDay = (int) (new Date().getTime() / 1000 / 60 / 60 / 24);
				week = "" + ((currentDay - startDay - 1) / 7 + 1);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return week;
	}

	/**
	 * 获取星期几
	 * 
	 * @param date
	 * @return
	 */
	public static String getWeekOfDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
		String week = sdf.format(date);
		return week;
	}

	/**
	 * 日期date类型转字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}

	public static Date stringToDate(String date) {
		SimpleDateFormat sdf = null;
		if (date.length() > 16) {
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		} else {
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		}
		try {
			return sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static Date stringToDateLocal(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		try {
			return sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String dateToStringFormat(Date date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}

	/**
	 * 获取当前日期
	 * 
	 * @return date
	 */
	public static String getNowTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}

	/**
	 * 获取当前时间戳（10位）
	 * 
	 * @return date
	 */
	public static String getTimestamp() {
		return Long.toString(System.currentTimeMillis() / 1000);
	}

	/**
	 * 获取当前时间到某一时刻的时间差
	 * 
	 * @return
	 */
	public static long getDelay(String targetTime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date targetDate = null;
		try {
			targetDate = sdf.parse(targetTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return targetDate.getTime() - new Date().getTime();
	}
	
	/**
	 * 比较2个时间
	 * 
	 * @return
	 */
	public static int compareDate(Date d1, Date d2) {
		if (d1.getTime() > d2.getTime()) {
			return 1;
		} else if (d1.getTime() < d2.getTime()) {
			return -1;
		} else {// 相等
			return 0;
		}
	}
	/**
	 * 时间+5分钟
	 * @return
	 */
	public static String addTime(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date afterDate = new Date(date.getTime() + 300000);
		return sdf.format(afterDate);
	}
	
	public static Date beforeHours(String dateStr){
		Date date = stringToDate(dateStr);//获取当前时间    
		Calendar calendar = Calendar.getInstance();    
		calendar.setTime(date);    
		calendar.add(Calendar.HOUR, -1);//当前时间减去一小时，即一小时前的时间    
		return calendar.getTime();//获取一年前的时间，或者一个月前的时间    
	}

}
package cn.chenpeng.cmcckpida.date;

import java.text.SimpleDateFormat;
import java.util.Calendar;
/**
 * 本类是给应用提供一个时间区间，让系统自己判断该取哪个时间段的数据
 * 	原理：程序运行期间将获取一个本地日期，将本地日期转换为周内日期。例如，程序运行当天是周3。
 * 		定义一个结束日期，这个日期是由当天日期减去3得出。
 * 		定义一个开始日期，这个日期是由当天日期减去3再减去14得出。
 * 		我们取数据本身就是会在取数周期结束后开始取。而一般取数周期都是2周。
 * @author ChenPeng
 *
 */
public class DateHandle {
	/**
	 * 
	 * @return 返回值是‘yyyymmdd’格式的开始日期和结束日期加“_”的组合，例如“20181217_20181230”
	 */
	public static String dataHandle() {
		Calendar ca = Calendar.getInstance();
		int weekDay = ca.get(Calendar.DAY_OF_WEEK)==1?7:ca.get(Calendar.DAY_OF_WEEK)-1;
		ca.add(Calendar.DAY_OF_MONTH,0-weekDay);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		String end = df.format(ca.getTime());
		ca.add(Calendar.DAY_OF_MONTH,-14);
		String start = df.format(ca.getTime());
		return start+"_"+end;
	}
	
}

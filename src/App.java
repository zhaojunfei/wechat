import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class App {
	 public static void main(String[] args) {
	        Calendar calender = Calendar.getInstance();
	        calender.add(Calendar.MONTH, 1);
	        int count =  calender.getActualMaximum(Calendar.DAY_OF_MONTH);
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        for (int i = 0; i < count; i++)
	        {
		        Date dd  = calender.getTime();
		        String date = sdf.format(dd);
		        System.out.println(date +" " + getWeekOfDate(calender.getTime()));
		        calender.add(Calendar.DAY_OF_MONTH, 1);
	        }
	    }
	 public static String getWeekOfDate(Date date) {
	        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(date);

	        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
	        if (w < 0)
	            w = 0;

	        return weekDays[w];
	    }
}

package service;

import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusDao;
import model.Bus_Info;
import model.Line_Info;

public class BusSelect implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
			String select1 = request.getParameter("select1") == null ? "" : request.getParameter("select1");
			
			BusDao bd = BusDao.getInstance();
			
			
			// body을 busSelect으로 값을 넘기기
			String select2 = request.getParameter("select2");
			String datepicker = request.getParameter("datepicker");
			String grd = request.getParameter("grd");
			String adult = request.getParameter("adult");
			String child = request.getParameter("child");
			String selTime =  request.getParameter("time");
			request.setAttribute("select2", select2);
			request.setAttribute("datepicker", datepicker);
			request.setAttribute("grd", grd);
			request.setAttribute("adult", adult);
			request.setAttribute("child", child);
			//출발지
			List<Line_Info> list = bd.select();
			request.setAttribute("list", list);
			
			//도착지
			List<Line_Info> list2 = bd.select(select1);
			request.setAttribute("select1", select1);
			request.setAttribute("list2", list2);
			
			//버스등급
			List<Bus_Info> list3 = bd.selectBus();
			request.setAttribute("list3", list3);
			
			
			
			// 시간 값 지정  및 넘기기
			String time = "00,01,02,03,04,05,06,07,08,09,10,12,13,14,15,16,17,18,19,20,21,22,23,24";
			request.setAttribute("time", time);
			
			//버스데이터 불러오기
			
			List<Bus_Info> list4 = bd.selectBook(select1,select2,selTime,grd,datepicker);
					
					request.setAttribute("seltime", selTime ); // 데이터베이스에서 받은 값 넘기기 
					request.setAttribute("list4", list4);
			// 가격, 거리 , 시간 불러오기
			Line_Info li = bd.selectPrice(select1,select2);		
					request.setAttribute("li", li);

		    Calendar cal = Calendar.getInstance();
				    int year = cal.get(Calendar.YEAR);
				    int month =cal.get(Calendar.MONTH)+1; 
				    int day =cal.get(Calendar.DATE);
				    
				    request.setAttribute("year", year);
				    request.setAttribute("month", month);
				    request.setAttribute("day", day);
		return "bus/busSelect.jsp";
	}

}

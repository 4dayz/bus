package service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
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
			
			// body을 busSelect으로 값을 넘기기
		
			
			String select2 = request.getParameter("select2");
			String datepicker = request.getParameter("datepicker");
			String time = request.getParameter("time");
			String grd = request.getParameter("grd");
			String adult = request.getParameter("adult");
			String child = request.getParameter("child");
			
			request.setAttribute("select2", select2);
			request.setAttribute("datepicker", datepicker);
			request.setAttribute("time", time);
			request.setAttribute("grd", grd);
			request.setAttribute("adult", adult);
			request.setAttribute("child", child);
			
			//버스데이터 불러오기
			List<Bus_Info> list4 = bd.selectBook(select1,select2,time,grd);
					request.setAttribute("list4", list4);
		return "bus/busSelect.jsp";
	}

}

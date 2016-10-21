package service;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusDao;
import model.*;

public class SeatSelect implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String adult = request.getParameter("adult");
		String child = request.getParameter("child");
		String date =request.getParameter("date");	
		String time =request.getParameter("time");
		String select1 =request.getParameter("select1");
		String select2 =request.getParameter("select2");
		String grd = request.getParameter("grd");
		String bus_num = request.getParameter("bus_num");
		int total = Integer.parseInt(adult)+Integer.parseInt(child);
		
		BusDao bd = BusDao.getInstance();
		//출발지
		List<Line_Info> list = bd.select();
		request.setAttribute("list", list);
		
		//도착지
		List<Line_Info> list2 = bd.select(select1);
		request.setAttribute("select1", select1);
		request.setAttribute("list2", list2);
		
		//좌석 체크
		List<Reserve> checkSeat = bd.checkSeat(bus_num, date);
		request.setAttribute("checkSeat", checkSeat);

		//값 넘기기
		request.setAttribute("adult", adult);
		request.setAttribute("child", child);
		request.setAttribute("date", date);
		request.setAttribute("time", time);
		request.setAttribute("select2", select2);
		request.setAttribute("bus_num", bus_num);
		request.setAttribute("total", total);
		
		//버스 일반, 우등 좌석 선택
		request.setAttribute("grd", grd);
		return "bus/seatSelect.jsp";
	}

}

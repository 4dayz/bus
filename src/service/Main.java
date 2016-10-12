package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusDao;
import model.Bus_Info;
import model.Line_Info;

public class Main implements CommandProcess {

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
		
		
		
		return "main/body.jsp";
	}
	
}

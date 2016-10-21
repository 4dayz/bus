package service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusDao;

public class BookingList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String gSeat[] = request.getParameterValues("gSeat");
		String pSeat[] = request.getParameterValues("pSeat");
		String date = request.getParameter("date");
		String st = request.getParameter("st");
		String dt = request.getParameter("dt");
		String bus_num = request.getParameter("bus_num");
		int adult = Integer.parseInt(request.getParameter("adult"));
		int child = Integer.parseInt(request.getParameter("child"));
		String stdt = st+dt;
		BusDao bd = BusDao.getInstance();
		int result = 0;
			if(gSeat != null ){
				for (int i = 0; i < gSeat.length; i++) {
					
					if(i < adult ){
						
						 
						result = bd.busInsert(gSeat[i],"1",bus_num,date,stdt);
					} else {
						
						 result = bd.busInsert(gSeat[i],"2",bus_num,date,stdt);
				
					}
				}
			}else{
			
				for (int i = 0; i < pSeat.length; i++) {
					if(i < adult ){
						 result = bd.busInsert(pSeat[i],"1",bus_num,date,stdt);
					} else {
						 result = bd.busInsert(pSeat[i],"2",bus_num,date,stdt);
					}
				}
			}

	

		request.setAttribute("result", result);

		return "bus/bookingList.jsp";
	}



}

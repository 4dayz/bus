package model;

public class Reserve {
	private int r_num;	//예약번호	P.K	VARCHAR	15	
	private int m_num;	//회원번호	F.K	NUMBER	6	EX)100001
	private String bus_num;	//버스번호	F.K	VARCHAR	15	EX)서울33마1234
	private String line_num;	//운행번호		number	9	ex)010715
	private String start_day;	//출발일		date		
	private String person_level;	//사람레벨		varchar	1	ex)일반 1 아동 2
	private int seat_num;	//좌석번호		number	2	
	private String cal_yn;	//취소유무		VARCHAR	1	
	
	public int getR_num() {	return r_num;	}
	public void setR_num(int r_num) {this.r_num = r_num;	}
	public int getM_num() {	return m_num;	}
	public void setM_num(int m_num) {this.m_num = m_num;	}
	public String getBus_num() {return bus_num;	}
	public void setBus_num(String bus_num) {this.bus_num = bus_num;	}
	public String getLine_num() {return line_num;}
	public void setLine_num(String line_num) {this.line_num = line_num;	}
	public String getStart_day() {return start_day;	}
	public void setStart_day(String start_day) {this.start_day = start_day;	}
	public String getPerson_level() {return person_level;}
	public void setPerson_level(String person_level) {this.person_level = person_level;	}
	public int getSeat_num() {return seat_num;	}
	public void setSeat_num(int seat_num) {	this.seat_num = seat_num;}
	public String getCal_yn() {return cal_yn;}
	public void setCal_yn(String cal_yn) {this.cal_yn = cal_yn;	}
	
	
}

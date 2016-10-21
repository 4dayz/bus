package model;

public class Line_Info {
	private int line_num;
	private String st_code;
	private String st_name;
	private String dt_code;
	private String dt_name;
	private int hour;
	private int min;
	private int primeum;
	private int price;
	private int run_time;
	private int run_way;
	
	public int getLine_num() {return line_num;	}
	public void setLine_num(int line_num) {	this.line_num = line_num;	}
	public String getSt_code() {return st_code;	}
	public void setSt_code(String st_code) {this.st_code = st_code;	}
	public String getSt_name() {return st_name;	}
	public void setSt_name(String st_name) {this.st_name = st_name;	}
	public String getDt_code() {return dt_code;	}
	public void setDt_code(String dt_code) {this.dt_code = dt_code;	}
	public String getDt_name() {return dt_name;	}
	public void setDt_name(String dt_name) {this.dt_name = dt_name;	}
	public int getPrice() {	return price;}
	public void setPrice(int price) {this.price = price;}
	public int getRun_time() {return run_time;}
	public void setRun_time(int run_time) {	this.run_time = run_time;}
	public int getRun_way() {return run_way;}
	public void setRun_way(int run_way) {this.run_way = run_way;}
	public int getPrimeum() {return primeum;}
	public void setPrimeum(int primeum) {this.primeum = primeum;}
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	
	
}

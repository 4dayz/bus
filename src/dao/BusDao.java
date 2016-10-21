package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;

import model.Bus_Info;
import model.Line_Info;
import model.Reserve;

import javax.naming.*;
public class BusDao {
	//singleton
	private static BusDao instance = new BusDao();
	private BusDao() {}
	public static BusDao getInstance() {
		return instance;
	}
	
	// Connection pool
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) {
			System.out.println("1="+e.getMessage());
		}
		return conn;
	}
	//출발지 선택
	public List<Line_Info> select() {
		List<Line_Info> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sqlst ="select distinct st_code,st_name from line_info order by st_name desc";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlst);
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				Line_Info li = new Line_Info();
				li.setSt_code(rs.getString("st_code"));
				li.setSt_name(rs.getString("st_name"));
				list.add(li);
			}
		}catch (Exception e) {
			System.out.println("2="+e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
			}
		}
		
		return list;
	}
	
	// 도착지 선택
	public List<Line_Info> select(String select1) {
		
		List<Line_Info> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sqldt = "select dt_code,dt_name from line_info where st_code =? order by dt_name desc";		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqldt);
			pstmt.setString(1, select1);
			rs = pstmt.executeQuery();
			while (rs.next()){
				Line_Info li = new Line_Info();
				li.setSt_code(select1);
				li.setDt_code(rs.getString("dt_code"));
				li.setDt_name(rs.getString("dt_name"));
				list.add(li);
			}
		} catch (Exception e) {
			System.out.println("3= "+e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return list;
	}
	
	//버스 등급
	public List<Bus_Info> selectBus() {
		List<Bus_Info> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sqlgrd = "select  distinct grd_code,grd_name from bus_info order by grd_name desc";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlgrd);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Bus_Info bi = new Bus_Info();
				bi.setGrd_code(rs.getString("grd_code"));
				bi.setGrd_name(rs.getString("grd_name"));
				list.add(bi);
			}
			
			
		} catch (Exception e) {
			System.out.println("4= "+e.getMessage());
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return list;
	}
	
	//버스 데이터 불러오기 
	public List<Bus_Info> selectBook(String select1, String select2, String selTime, String grd, String datepicker) {
		List<Bus_Info> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 등급 나눠서 불러오기
		String sqlbo = "SELECT Substr( BI.START_TIME,1,2)|| ':'|| Substr( BI.START_TIME,3)as start_time , BI.GRD_NAME, BI.B_COMPANY ,"
				+ " BI.ALL_SEAT ,Bi.Grd_Code,Bi.Bus_num, BI.ALL_SEAT - (SELECT COUNT(RE.SEAT_NUM)"
				+ " FROM RESERVE RE WHERE RE.LINE_NUM = BI.LINE_NUM  AND RE.BUS_NUM = BI.BUS_NUM AND  Re.Start_Day = TO_DATE(translate(? ,'0123456789' || ? ,'0123456789')))"
				+ " AS REMAIN_SEAT FROM BUS_INFO BI , LINE_INFO LI"
				+ " WHERE LI.LINE_NUM = BI.LINE_NUM AND LI.ST_CODE = ? AND LI.DT_CODE = ?"
				+ " and Bi.Start_Time >= ? and Bi.Grd_Code =? order by start_time";
		// 전체 불러오기
		String sqlbo1 ="SELECT Substr( BI.START_TIME,1,2)|| ':'|| Substr( BI.START_TIME,3)as start_time , BI.GRD_NAME, BI.B_COMPANY ,"
				+ " BI.ALL_SEAT ,Bi.Grd_Code,Bi.Bus_num, BI.ALL_SEAT - (SELECT COUNT(RE.SEAT_NUM)"
				+ " FROM RESERVE RE WHERE RE.LINE_NUM = BI.LINE_NUM  AND RE.BUS_NUM = BI.BUS_NUM AND  Re.Start_Day = TO_DATE(translate(? ,'0123456789' || ? ,'0123456789')))"
				+ " AS REMAIN_SEAT FROM BUS_INFO BI , LINE_INFO LI"
				+ " WHERE LI.LINE_NUM = BI.LINE_NUM AND LI.ST_CODE = ? AND LI.DT_CODE = ?"
				+ " and Bi.Start_Time >= ? order by start_time";
		try {
			conn = getConnection();
			if(!grd.equals("")){
				pstmt = conn.prepareStatement(sqlbo);
				pstmt.setString(1, datepicker);
				pstmt.setString(2, datepicker);
				pstmt.setString(3, select1);
				pstmt.setString(4, select2);
				pstmt.setString(5, selTime);
				pstmt.setString(6, grd);
				rs = pstmt.executeQuery();

			} else {
				pstmt = conn.prepareStatement(sqlbo1);
				pstmt.setString(1, datepicker);
				pstmt.setString(2, datepicker);
				pstmt.setString(3, select1);
				pstmt.setString(4, select2);
				pstmt.setString(5, selTime);
				rs = pstmt.executeQuery();


			}
			
			while (rs.next() ) {
				
				Bus_Info bi = new Bus_Info();
				bi.setStart_time(rs.getString("start_time"));
				bi.setGrd_name(rs.getString("grd_name"));
				bi.setB_company(rs.getString("b_company"));
				bi.setAll_seat(rs.getString("remain_seat"));
				bi.setGrd_code(rs.getString("grd_code"));
				bi.setBus_num(rs.getString("bus_num"));
				list.add(bi);
				}
			
		
		} catch (Exception e) {
			System.out.println("5="+e.getMessage());
		
		}finally {
			try {
				if(rs != null) rs.close();	
				if(pstmt != null) pstmt.close();	
				if(conn != null) conn.close();	
			} catch (Exception e2) {
			}
		}
		
		
		return list;
	}
	
	//가격,시간 ,거리 불러오기
	public Line_Info selectPrice(String select1, String select2) {
		Line_Info li = new Line_Info();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sqlpri = "select distinct li.price,round(Li.Price*1.1,-2) as primeum,"
				+ "TRUNC(Li.Run_Time/60) as hour,  mod(Li.Run_Time,60) as min,Li.Run_Way "
				+ "from Line_Info li , Bus_Info bi where Li.Line_Num = Bi.Line_Num"
				+ " and Li.St_Code = ? and Li.Dt_Code = ?  ";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlpri);
			pstmt.setString(1, select1);
			pstmt.setString(2, select2);
			rs = pstmt.executeQuery();
			while(rs.next()){
				li.setPrice(rs.getInt("price"));
				li.setPrimeum(rs.getInt("primeum"));
				li.setRun_way(rs.getInt("run_way"));
				li.setHour(rs.getInt("hour"));
				li.setMin(rs.getInt("min"));
			}

		} catch (Exception e) {
			System.out.println("6 =" +e.getMessage());
		}finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (Exception e2) {
			}
		}
		
		
		return li;
	}
	// 데이터베이스 값 넣기 
	public int busInsert(String gSeat, String pGrd, String bus_num, String date, String stdt) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		int result =0;
		String sqlIn = "insert into Reserve (r_num,m_num,bus_num,line_num,start_day,person_level,seat_num,cal_yn) "
				+ " values(r_num.nextval,?,?,?,TO_DATE(translate(? ,'0123456789' || ? ,'0123456789') ,'YY/MM/DD'),?,?,'n') ";
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sqlIn);
			pstmt.setInt(1, 100002);
			pstmt.setString(2, bus_num);
			pstmt.setInt(3,Integer.parseInt(stdt));
			pstmt.setString(4, date);
			pstmt.setString(5, date);
			pstmt.setString(6, pGrd);
			
			if(gSeat == null ){
				//pstmt.setInt(7, Integer.parseInt(pSeat));
			}else {
				pstmt.setInt(7, Integer.parseInt(gSeat));
			}
			result =pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("7="+e.getMessage());
		}finally {
			try {
				if(pstmt != null){pstmt.close();}
				if(conn != null){conn.close();}
			} catch (Exception e) {
			}
		}
		
		
		return result;
	}
	
	// 좌석 체크 
	public List<Reserve> checkSeat(String bus_num, String date) {
		List<Reserve> list = new ArrayList<>();
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sqlchk =  "select RE.SEAT_NUM FROM Reserve RE, Bus_Info BI "
						+ "WHERE Re.Bus_Num= Bi.Bus_Num AND Re.Start_Day = TO_DATE(translate(? ,'0123456789' || ? ,'0123456789') ,'YY/MM/DD') AND Bi.Bus_Num= ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sqlchk);
			pstmt.setString(1, date);
			pstmt.setString(2, date);
			pstmt.setString(3, bus_num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Reserve re = new Reserve();
				re.setSeat_num(rs.getInt("seat_num"));
				list.add(re);
			}
			
		} catch (Exception e) {
			System.out.println("8="+e.getMessage());
		}finally {
			try {
				if( rs != null)rs.close();
				if( pstmt != null)pstmt.close();
				if( conn != null)conn.close();
				

			} catch (Exception e) {
							}
		}
		
		
		return list;
	}
	
	
	
	
	
}	
	


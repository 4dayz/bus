package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.swing.plaf.synth.SynthSeparatorUI;

import model.Bus_Info;
import model.Line_Info;

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
			System.out.println(e.getMessage());
		}
		return conn;
	}
	//출발지 선택
	public List<Line_Info> select() {
		List<Line_Info> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sqlst ="select  distinct st_code,st_name from line_info order by st_name desc";
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
			System.out.println(e.getMessage());
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
			System.out.println(e.getMessage());
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
			System.out.println(e.getMessage());
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
	public List<Bus_Info> selectBook(String select1, String select2, String time, String grd) {
		List<Bus_Info> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 등급 나눠서 불러오기
		String sqlbo = "SELECT Substr( BI.START_TIME,1,2)|| ':'|| Substr( BI.START_TIME,3)as start_time , BI.GRD_NAME, BI.B_COMPANY ,"
				+ " BI.ALL_SEAT , BI.ALL_SEAT - (SELECT COUNT(RE.SEAT_NUM)"
				+ " FROM RESERVE RE WHERE RE.LINE_NUM = BI.LINE_NUM  AND RE.BUS_NUM = BI.BUS_NUM)"
				+ " AS REMAIN_SEAT FROM BUS_INFO BI , LINE_INFO LI"
				+ " WHERE LI.LINE_NUM = BI.LINE_NUM AND LI.ST_CODE = ? AND LI.DT_CODE = ?"
				+ " and Bi.Start_Time >= ? and Bi.Grd_Code =? order by start_time";
		// 전체 불러오기
		String sqlbo1 ="SELECT Substr( BI.START_TIME,1,2)|| ':'|| Substr( BI.START_TIME,3)as start_time , BI.GRD_NAME, BI.B_COMPANY ,"
				+ " BI.ALL_SEAT , BI.ALL_SEAT - (SELECT COUNT(RE.SEAT_NUM)"
				+ " FROM RESERVE RE WHERE RE.LINE_NUM = BI.LINE_NUM  AND RE.BUS_NUM = BI.BUS_NUM)"
				+ " AS REMAIN_SEAT FROM BUS_INFO BI , LINE_INFO LI"
				+ " WHERE LI.LINE_NUM = BI.LINE_NUM AND LI.ST_CODE = ? AND LI.DT_CODE = ?"
				+ " and Bi.Start_Time >= ? order by start_time";
		try {
			conn = getConnection();
			if(!grd.equals("")){
				pstmt = conn.prepareStatement(sqlbo);
				pstmt.setString(1, select1);
				pstmt.setString(2, select2);
				pstmt.setString(3, time);
				pstmt.setString(4, grd);
				rs = pstmt.executeQuery();

			} else {
				pstmt = conn.prepareStatement(sqlbo1);
				pstmt.setString(1, select1);
				pstmt.setString(2, select2);
				pstmt.setString(3, time);
				rs = pstmt.executeQuery();


			}
			
			while (rs.next() ) {
				
				Bus_Info bi = new Bus_Info();
				bi.setStart_time(rs.getString("start_time"));
				bi.setGrd_name(rs.getString("grd_name"));
				bi.setB_company(rs.getString("b_company"));
				bi.setAll_seat(rs.getString("remain_seat"));
				list.add(bi);
				}
			
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		
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
	
	
	
	
}	
	


package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Loaibean;
import bean.Sachbean;

public class Loaidao {
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs ;
	
	public ArrayList<Loaibean> getloai(){
		   ArrayList<Loaibean> ds= new ArrayList<Loaibean>();
		   String sql ="SELECT maloai, tenloai FROM loai";
		   try {
				DungChung dc = new DungChung();
				dc.KetNoi();
				Connection cnn = dc.cnn;
				
				st = cnn.createStatement();
				rs = st.executeQuery(sql);
				while(rs.next()) {
					Loaibean loaibean = new Loaibean(rs.getString("maloai"), rs.getString("tenloai"));
					ds.add(loaibean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		   return ds;
	   }
	
	public int addLoai(Loaibean loai) {
		int result = 0;
		String sql = "insert into loai values(?,?)";
		try {
			DungChung dc = new DungChung();
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			pst.setString(1, loai.getMaloai());
			pst.setString(2, loai.getTenloai());
			
			result = pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int editLoai(Loaibean loai) {
		int result = 0;
		String sql = "update loai \r\n" + 
				"set tenloai = ?\r\n" + 
				"where maloai = ?";
		try {
			DungChung dc = new DungChung();
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			
			pst.setString(1, loai.getTenloai());
			pst.setString(2, loai.getMaloai());
			result = pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteLoai(String maloai) {
		int rs = 0;
		String sql = "delete from loai where maloai = ?";
		try {
			DungChung dc = new DungChung();
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			pst.setString(1, maloai);
			rs = pst.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}

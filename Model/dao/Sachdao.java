package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Sachbean;

public class Sachdao {
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ArrayList<Sachbean> getsach(){
		   ArrayList<Sachbean> ds= new ArrayList<Sachbean>();
		   String sql = "SELECT masach, tensach, soluong, gia, sotap, anh, NgayNhap, tacgia, maloai FROM sach";
		   try {
			   DungChung dc = new DungChung();
			   dc.KetNoi();
			   Connection cnn = dc.cnn;
			   
			   st = cnn.createStatement();
			   rs = st.executeQuery(sql);
			   while(rs.next()) {
				   Sachbean sachbean = new  Sachbean(rs.getString("masach"), rs.getString("tensach"), rs.getLong("soluong"), rs.getString("tacgia"), rs.getLong("gia"), rs.getString("sotap"), rs.getString("anh"), rs.getString("NgayNhap"), rs.getString("maloai"));
				   ds.add(sachbean);
			   }
			   rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		   return ds;
	   }
	
	public int addSach(Sachbean sach) {
		int result = 0;
		String sql = "insert into sach values(?,?,?,?,?,?,?,?,?)";
		try {
			DungChung dc = new DungChung();
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			pst.setString(1, sach.getMasach());
			pst.setString(2, sach.getTensach());
			pst.setLong(3, sach.getSoluong());
			pst.setLong(4, sach.getGia());
			pst.setString(5, sach.getMaloai());
			pst.setString(6, sach.getSotap());
			pst.setString(7, sach.getAnh());
			pst.setString(8, sach.getNgaynhap());
			pst.setString(9, sach.getTacgia());
			
			result = pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int editSach(Sachbean sach) {
		int result = 0;
		String sql = "update sach \r\n" + 
				"set tensach = ?, anh = ?, gia = ?, maloai = ?, NgayNhap = ?, soluong = ?, sotap = ?, tacgia = ?\r\n" + 
				"where masach = ?";
		try {
			DungChung dc = new DungChung();
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			
			pst.setString(1, sach.getTensach());
			pst.setLong(6, sach.getSoluong());
			pst.setLong(3, sach.getGia());
			pst.setString(4, sach.getMaloai());
			pst.setString(7, sach.getSotap());
			pst.setString(2, sach.getAnh());
			pst.setString(5, sach.getNgaynhap());
			pst.setString(8, sach.getTacgia());
			pst.setString(9, sach.getMasach());
			result = pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteSach(String masach) {
		int rs = 0;
		String sql = "delete from sach where masach = ?";
		try {
			DungChung dc = new DungChung();
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			pst.setString(1, masach);
			rs = pst.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}

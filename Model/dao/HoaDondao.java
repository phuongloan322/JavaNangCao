package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.HoaDonbean;

public class HoaDondao {
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	DungChung dc = new DungChung();
	
	public int AddHD (HoaDonbean hd) {
		int result = 0;
		String sql = "INSERT INTO HoaDon VALUES (?,?,?)";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			pst.setLong(1 , hd.getMakh());
			pst.setString(2 , hd.getNgayMua());
			pst.setBoolean(3 , hd.isDamua());
			
			result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public HoaDonbean getHD(long makh, String date) {
		HoaDonbean hoaDonbean = new HoaDonbean();
		String sql = "select * from HoaDon where makh = ? and NgayMua = ?";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			pst.setLong(1 , makh);
			pst.setString(2 , date);
			
			rs = pst.executeQuery();
			while(rs.next()) {
				hoaDonbean = new HoaDonbean(rs.getLong("MaHoaDon"), rs.getLong("makh"), rs.getString("NgayMua"), rs.getBoolean("damua"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hoaDonbean;
	}
	public HoaDonbean getHD(long maHoaDon) {
		HoaDonbean hoaDonbean = new HoaDonbean();
		String sql = "select * from HoaDon where MaHoaDon = ?";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			pst.setLong(1 , maHoaDon);
			
			rs = pst.executeQuery();
			while(rs.next()) {
				hoaDonbean = new HoaDonbean(rs.getLong("MaHoaDon"), rs.getLong("makh"), rs.getString("NgayMua"), rs.getBoolean("damua"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hoaDonbean;
	}
	
	public List<HoaDonbean> getHD() {
		List<HoaDonbean> ds = new ArrayList<HoaDonbean>();
		HoaDonbean hoaDonbean = new HoaDonbean();
		String sql = "select * from HoaDon";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			
			rs = pst.executeQuery();
			while(rs.next()) {
				hoaDonbean = new HoaDonbean(rs.getLong("MaHoaDon"), rs.getLong("makh"), rs.getString("NgayMua"), rs.getBoolean("damua"));
				ds.add(hoaDonbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
	
}

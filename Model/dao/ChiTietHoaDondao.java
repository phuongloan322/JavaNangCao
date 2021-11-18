package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.ChiTietHoaDon;
import bean.HoaDonbean;
import bo.HoaDonbo;

public class ChiTietHoaDondao {
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	DungChung dc = new DungChung();
	HoaDonbo hoaDonbo = new HoaDonbo();
	
	
	public int AddCTHD (ChiTietHoaDon cthd) {
		int result = 0;
		String sql = "INSERT INTO ChiTietHoaDon VALUES (?,?,?,?)";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			pst.setString(1 , cthd.getMaSach());
			pst.setInt(2 , cthd.getSoLuongMua());
			pst.setLong(3 , cthd.getHoaDonbean().getMaHoaDon());
			pst.setBoolean(4, cthd.isDamua());
			result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<ChiTietHoaDon> getChiTietHoaDon(long makh) {
		List<ChiTietHoaDon> ds = new ArrayList<ChiTietHoaDon>();
		String sql = "SELECT MaChiTietHD,MaSach,SoLuongMua, hd.MaHoaDon as MaHD, cthd.DaMua as tinhtrang FROM ChiTietHoaDon as cthd JOIN hoadon as hd on cthd.MaHoaDon = hd.MaHoaDon WHERE hd.makh = ? order by NgayMua desc";
		
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			pst = cnn.prepareStatement(sql);
			pst.setLong(1, makh);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				ChiTietHoaDon hd = new ChiTietHoaDon(
						rs.getLong("MaChiTietHD"), 
						rs.getString("MaSach"), 
						rs.getInt("SoLuongMua"), 
						hoaDonbo.getHD(rs.getLong("MaHD")),
						rs.getBoolean("tinhtrang"));
				ds.add(hd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
	
	
}
//hoaDonbo.getHD(rs.getLong("MaHoaDon")
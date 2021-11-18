package daoAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.ChiTietHoaDon;
import bean.HoaDonbean;
import beanAdmin.ChiTietDonHangbean;
import beanAdmin.DonHangbean;
import bo.ChiTietHoaDonbo;
import bo.HoaDonbo;
import dao.DungChung;

public class ChiTietDonHangdao {
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	DungChung dc = new DungChung();
	
	public List<DonHangbean> getHD() {
		List<DonHangbean> ds = new ArrayList<DonHangbean>();
		DonHangbean donhang = new DonHangbean();
		String sql = "select * from DonHang";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			
			rs = pst.executeQuery();
			while(rs.next()) {
				donhang = new DonHangbean(rs.getLong("MaHoaDon"), rs.getString("hoten"), rs.getString("NgayMua"), rs.getLong("TongSoLuong"), rs.getLong("TongGia"), rs.getLong("ThanhTien"), false);
				ds.add(donhang);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}

	public List<ChiTietDonHangbean> getAllChiTiet(long mahoadon) {
		List<ChiTietDonHangbean> ds = new ArrayList<ChiTietDonHangbean>();
		String sql = "select * from ChiTietDH where MaHoaDon = ?";
		
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			pst = cnn.prepareStatement(sql);
			pst.setLong(1, mahoadon);
			rs = pst.executeQuery();
			while(rs.next()) {
				ChiTietDonHangbean chitiet = new ChiTietDonHangbean(
						rs.getLong("MaChiTietHD"), 
						rs.getString("hoten"), 
						rs.getString("tensach"), 
						rs.getLong("gia"), 
						rs.getLong("SoLuongMua"), 
						rs.getLong("TongGia"), 
						rs.getString("NgayMua"), 
						rs.getBoolean("DaMua"),
						rs.getLong("MaHoaDon"),
						rs.getString("anh"),
						rs.getString("tacgia")
						);
				ds.add(chitiet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
	
	public int XacNhanDonHang(long machitiet) {
		int rs = 0;
		String sql = "update ChiTietHoaDon set DaMua = 1 where MaChiTietHD = ?";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			 pst = cnn.prepareStatement(sql);
			 pst.setLong(1, machitiet);
			 rs = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public ChiTietHoaDon getChiTietHoaDon(long machitiet) {
		ChiTietHoaDon cthd = null;
		HoaDonbo hdbo = new HoaDonbo();
		String sql = "select * from ChiTietHoaDon where MaChiTietHD = ?";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			pst = cnn.prepareStatement(sql);
			pst.setLong(1, machitiet);
			rs = pst.executeQuery();
			while(rs.next()) {
				cthd = new ChiTietHoaDon(
						rs.getLong("MaChiTietHD"), 
						rs.getString("MaSach"), 
						rs.getInt("SoLuongMua"), 
						new HoaDonbean(0, 0, null, false), false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cthd;
	}
	
	public int editCTHD(long machitiet, int soluongmua) {
		int result = 0;
		String sql = "update ChiTietHoaDon \r\n" + 
				"set SoLuongMua = ?\r\n" + 
				"where MaChiTietHD = ?";
		try {
			DungChung dc = new DungChung();
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			
			pst.setLong(1, soluongmua);
			pst.setLong(2, machitiet);
			result = pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteCTHD(long machitiet) {
		int rs = 0;
		String sql = "delete from ChiTietHoaDon where MaChiTietHD = ?";
		try {
			DungChung dc = new DungChung();
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			pst.setLong(1, machitiet);
			rs = pst.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	public int testXacNhan(String mahoadon) {
		int result = 0;
		String sql = "select count(*) as dem from ChiTietDonHang where MaHoaDon = ? and DaMua = 0";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			pst = cnn.prepareStatement(sql);
			pst.setString(1, mahoadon);
			rs = pst.executeQuery();
			while(rs.next()) {
				result = rs.getInt("dem");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}

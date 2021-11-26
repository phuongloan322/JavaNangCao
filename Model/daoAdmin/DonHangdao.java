package daoAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beanAdmin.DonHangbean;
import dao.DungChung;

public class DonHangdao {
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
	public List<DonHangbean> getDonHangDaXacNhan() {
		List<DonHangbean> ds = new ArrayList<DonHangbean>();
		DonHangbean donhang = new DonHangbean();
		String sql = "select * from DonHangDaXacNhan";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			
			rs = pst.executeQuery();
			while(rs.next()) {
				donhang = new DonHangbean(rs.getLong("MaHoaDon"), rs.getString("hoten"), rs.getString("NgayMua"), rs.getLong("TongSoLuong"), rs.getLong("TongGia"), rs.getLong("ThanhTien"), true);
				ds.add(donhang);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
	
	public int XacNhanDonHang(long mahoadon) {
		int rs = 0;
		String sql = "update hoadon set damua = 1 where MaHoaDon = ?\r\n" + 
					"update ChiTietHoaDon set DaMua = 1 where MaHoaDon = ?";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			 pst = cnn.prepareStatement(sql);
			 pst.setLong(1, mahoadon);
			 pst.setLong(2, mahoadon);
			 rs = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	public int deleteDonHang(long mahoadon) {
		int rs = 0;
		String sql = "delete from hoadon where MaHoaDon = ?\r\n" + 
					"delete from ChiTietHoaDon where MaHoaDon = ?";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			 pst = cnn.prepareStatement(sql);
			 pst.setLong(1, mahoadon);
			 pst.setLong(2, mahoadon);
			 rs = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}

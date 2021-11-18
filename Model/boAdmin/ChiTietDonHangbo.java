package boAdmin;

import java.util.List;

import bean.Accountbean;
import bean.ChiTietHoaDon;
import beanAdmin.ChiTietDonHangbean;
import dao.ChiTietHoaDondao;
import daoAdmin.ChiTietDonHangdao;

public class ChiTietDonHangbo {

	ChiTietDonHangdao chitiet = new ChiTietDonHangdao();
	
	public List<ChiTietDonHangbean> getAllDonHang(long mahoadon) {
		return chitiet.getAllChiTiet(mahoadon);
	}
	
	public int XacNhanDonHang(long machitiet) {
		return chitiet.XacNhanDonHang(machitiet);
	}
	public ChiTietHoaDon getChiTietHoaDon(long machitiet) {
		return chitiet.getChiTietHoaDon(machitiet);
	}
	public int editCTHD(long machitiet, int soluongmua) {
		return chitiet.editCTHD(machitiet, soluongmua);
	}
	public int deleteCTHD(long machitiet) {
		return chitiet.deleteCTHD(machitiet);
	}
	public int testXacNhan(String mahoadon) {
		return chitiet.testXacNhan(mahoadon);
	}
}

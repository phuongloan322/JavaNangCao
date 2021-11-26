package boAdmin;

import java.util.List;

import beanAdmin.DonHangbean;
import daoAdmin.DonHangdao;

public class DonHangbo {

	DonHangdao dhdao = new DonHangdao();
	
	public List<DonHangbean> getDonHang() {
		return dhdao.getHD();
	}
	public List<DonHangbean> getDonHangDaXacNhan() {
		return dhdao.getDonHangDaXacNhan();
	}
	public int XacNhanDonHang(long mahoadon) {
		return dhdao.XacNhanDonHang(mahoadon);
	}
	public int deleteDonHang(long mahoadon) {
		return dhdao.deleteDonHang(mahoadon);
	}
}

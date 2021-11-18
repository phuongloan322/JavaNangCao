package bo;

import java.util.List;

import bean.HoaDonbean;
import dao.HoaDondao;

public class HoaDonbo {
	HoaDondao hddao = new HoaDondao();
	
	public int AddHD(HoaDonbean hd) {
		return hddao.AddHD(hd);
	}
	public HoaDonbean getHD(long makh, String date) {
		return hddao.getHD(makh, date);
	}
	public HoaDonbean getHD(long maHoaDon) {
		return hddao.getHD(maHoaDon);
	}
	public List<HoaDonbean> getAllHoaDon() {
		return hddao.getHD();
	}
}

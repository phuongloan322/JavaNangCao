package bo;

import java.util.List;

import bean.Accountbean;
import bean.ChiTietHoaDon;
import dao.ChiTietHoaDondao;

public class ChiTietHoaDonbo {
	ChiTietHoaDondao cthdDao = new ChiTietHoaDondao();
	
	public int AddCTHD(ChiTietHoaDon cthd) {
		return cthdDao.AddCTHD(cthd);
	}
	
	public List<ChiTietHoaDon> getCTHD(Long makh) {
		return cthdDao.getChiTietHoaDon(makh);
	}
	
}

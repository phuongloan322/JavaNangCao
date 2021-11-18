package bo;

import java.util.ArrayList;

import bean.Cartbean;
import bean.Sachbean;
import dao.Sachdao;

public class Sachbo {
	Sachdao sdao = new  Sachdao();
	public ArrayList<Sachbean> getSach() {
		return sdao.getsach();
	}
	public ArrayList<Sachbean> TimMaLoai(String maloai) {
		ArrayList<Sachbean> ds = sdao.getsach();
		ArrayList<Sachbean> dstam = new ArrayList<Sachbean>();
		for(Sachbean s : ds) {
			if(s.getMaloai().toLowerCase().equals(maloai.toLowerCase())) {
				dstam.add(s);
			}
		}
		return dstam;
	}
	public ArrayList<Sachbean> TimChung(String key) {
		ArrayList<Sachbean> ds = sdao.getsach();
		ArrayList<Sachbean> dstam = new ArrayList<Sachbean>();
		for(Sachbean s : ds) {
			if(s.getTensach().toLowerCase().trim().contains(key.toLowerCase().trim()) 
					|| s.getTacgia().toLowerCase().trim().contains(key.toLowerCase().trim()) ) {
				dstam.add(s);
			}
		}
		return dstam;
	}
	public Long Demsach(String maloai) {
		long dem = 0;
		ArrayList<Sachbean> ds = sdao.getsach();
		for(Sachbean s : ds) {
			if(s.getMaloai().equals(maloai)) {
				dem++;
			}
		}
		return dem;
	}
	
	public Sachbean FindSach(String masach) {
		Sachbean sachbean = new Sachbean();
		ArrayList<Sachbean> ds = sdao.getsach();
		for(Sachbean s : ds) {
			if(s.getMasach().toLowerCase().equals(masach.toLowerCase())) {
				sachbean = new Sachbean(s.getMasach(), s.getTensach(), s.getSoluong(), s.getTacgia(), s.getGia(), s.getSotap(), s.getAnh(), s.getNgaynhap(), s.getMaloai());
			}
		}
		return sachbean;
	}
	
	public int addSach(Sachbean sach) {
		return sdao.addSach(sach);
	}
	public int deleteSach(String masach) {
		return sdao.deleteSach(masach);
	}
	public int editSach(Sachbean sach) {
		return sdao.editSach(sach);
	}
}

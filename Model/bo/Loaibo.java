package bo;

import java.util.ArrayList;

import bean.Loaibean;
import dao.Loaidao;

public class Loaibo {
	Loaidao ldao = new Loaidao();
	
	public ArrayList<Loaibean> getLoai() {
		return ldao.getloai();
	}
	public Loaibean FindLoai(String maloai) {
		Loaibean loaibean = null;
		ArrayList<Loaibean> ds = ldao.getloai();
		for(Loaibean loai : ds) {
			if(loai.getMaloai().equals(maloai))
				loaibean = new Loaibean(loai.getMaloai(), loai.getTenloai());
		}
		return loaibean;
	}
	public int addLoai(Loaibean loai) {
		return ldao.addLoai(loai);
	}
	public int editLoai(Loaibean loai) {
		return ldao.editLoai(loai);
	}
	public int deleteLoai(String maloai) {
		return ldao.deleteLoai(maloai);
	}
}

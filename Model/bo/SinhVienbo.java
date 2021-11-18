package bo;

import java.util.ArrayList;

import bean.SinhVienbean;
import dao.SinhViendao;

public class SinhVienbo {
	SinhViendao svdao = new SinhViendao();

	public ArrayList<SinhVienbean> getSV() {
		return svdao.getSV();
	}

	public ArrayList<SinhVienbean> TimChung(String key) {
		ArrayList<SinhVienbean> ds = svdao.getSV();
		ArrayList<SinhVienbean> tam = new ArrayList<SinhVienbean>();
		for (SinhVienbean sv : ds) {
			if (sv.getHoten().toLowerCase().trim().contains(key.toLowerCase().trim())
					|| sv.getDiachi().toLowerCase().trim().contains(key.toLowerCase().trim()))
				tam.add(sv);
		}
		return tam;
	}

	public ArrayList<SinhVienbean> Tim(String makhoa) {
		ArrayList<SinhVienbean> ds = svdao.getSV();
		ArrayList<SinhVienbean> tam = new ArrayList<SinhVienbean>();
		for (SinhVienbean sv : ds) {
			if (sv.getMakhoa().equals(makhoa))
				tam.add(sv);
		}
		return tam;
	}
}

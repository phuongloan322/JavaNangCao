package dao;

import java.util.ArrayList;
import java.util.List;

import bean.DonVibean;

public class DonVidao {
	public List<DonVibean> getDonVi() {
		List<DonVibean> ds = new ArrayList<DonVibean>();
		ds.add(new DonVibean("DV01","Nhân sự"));
		ds.add(new DonVibean("DV02", "Quản trị"));
		ds.add(new DonVibean("DV03", "Cán bộ"));
		ds.add(new DonVibean("DV04", "Tư vấn viên"));
		
		return ds;
	}
}

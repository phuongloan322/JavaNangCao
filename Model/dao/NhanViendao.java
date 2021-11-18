package dao;

import java.util.ArrayList;
import java.util.List;

import bean.NhanVienbean;

public class NhanViendao {
	
	public List<NhanVienbean> getNhanVien() {
		List<NhanVienbean> ds = new ArrayList<NhanVienbean>();
		ds.add(new NhanVienbean("NV01", "Trần Thị Phương Loan", "Huế", "anh1.jpg", "DV01"));
		ds.add(new NhanVienbean("NV02", "David Beckham", "Huế", "anh1.jpg", "DV04"));
		ds.add(new NhanVienbean("NV03", "Nguyễn Kim Chi", "Huế", "anh1.jpg", "DV02"));
		ds.add(new NhanVienbean("NV04", "Lê Võ Văn Khoa", "Huế", "anh1.jpg", "DV04"));
		ds.add(new NhanVienbean("NV05", "Hoàng Ngọc Bảo Phú", "Huế", "anh1.jpg", "DV02"));
		ds.add(new NhanVienbean("NV06", "Nguyễn Hoàng Việt", "Huế", "anh1.jpg", "DV03"));
		ds.add(new NhanVienbean("NV07", "Huỳnh Tấn Bảo", "Huế", "anh1.jpg", "DV03"));
		ds.add(new NhanVienbean("NV08", "Võ Văn Thành", "Huế", "anh1.jpg", "DV01"));
		ds.add(new NhanVienbean("NV09", "Trần Thanh Tâm", "Huế", "anh1.jpg", "DV04"));
		
		return ds;
	}
}

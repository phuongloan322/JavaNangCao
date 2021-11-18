package dao;

import java.util.ArrayList;

import bean.SinhVienbean;

public class SinhViendao {
	public ArrayList<SinhVienbean> getSV() {
		ArrayList<SinhVienbean> ds = new ArrayList<SinhVienbean>();
		ds.add(new SinhVienbean("sv1","Loan","Huế",3.5,"cntt"));
		ds.add(new SinhVienbean("sv2","Trần Thị Phương Loan","Huế",3.69,"cntt"));
		ds.add(new SinhVienbean("sv3","Lan Chi","Huế",3.19,"toan"));
		ds.add(new SinhVienbean("sv4","Hoàng Anh","Đà Nẵng",2.19,"hoa"));
		ds.add(new SinhVienbean("sv5","Nguyễn Phú","Hà Nội",1.19,"ly"));
		ds.add(new SinhVienbean("sv1","Lan Hoa","Huế",3.21,"toan"));
		
		return ds;
	}

}

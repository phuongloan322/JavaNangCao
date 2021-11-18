package dao;

import java.util.ArrayList;

import bean.Khoabean;

public class Khoadao {
	public ArrayList<Khoabean> getKhoa() {
		ArrayList<Khoabean> ds = new ArrayList<Khoabean>();
		ds.add(new Khoabean("cntt", "Công nghệ thông tin"));
		ds.add(new Khoabean("ly", "Khoa vật lý"));
		ds.add(new Khoabean("hoa","Khoa hóa học"));
		ds.add(new Khoabean("toan","Khoa toán học"));
		
		return ds;
	}
}

package bean;

public class Khoabean {
	private String makhoa;
	private String tenkhoa;
	
	public Khoabean() {
		super();
	}
	
	public Khoabean(String makhoa, String tenkhoa) {
		super();
		this.makhoa = makhoa;
		this.tenkhoa = tenkhoa;
	}

	public String getMakhoa() {
		return makhoa;
	}
	public void setMakhoa(String makhoa) {
		this.makhoa = makhoa;
	}
	public String getTenkhoa() {
		return tenkhoa;
	}
	public void setTenkhoa(String tenkhoa) {
		this.tenkhoa = tenkhoa;
	}

	@Override
	public String toString() {
		return "Khoa [makhoa=" + makhoa + ", tenkhoa=" + tenkhoa + "]";
	}
	
	
	 
}

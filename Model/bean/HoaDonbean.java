package bean;

public class HoaDonbean {
	private long MaHoaDon;
	private long makh;
	private String NgayMua;
	private boolean damua;
	
	
	public HoaDonbean() {
		super();
		// TODO Auto-generated constructor stub
	}


	public HoaDonbean(long maHoaDon, long makh, String ngayMua, boolean damua) {
		super();
		MaHoaDon = maHoaDon;
		this.makh = makh;
		NgayMua = ngayMua;
		this.damua = damua;
	}


	public long getMaHoaDon() {
		return MaHoaDon;
	}


	public void setMaHoaDon(long maHoaDon) {
		MaHoaDon = maHoaDon;
	}


	public long getMakh() {
		return makh;
	}


	public void setMakh(long makh) {
		this.makh = makh;
	}


	public String getNgayMua() {
		return NgayMua;
	}


	public void setNgayMua(String ngayMua) {
		NgayMua = ngayMua;
	}


	public boolean isDamua() {
		return damua;
	}


	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	
	
}

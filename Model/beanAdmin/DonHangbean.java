package beanAdmin;

public class DonHangbean {

	private long mahoadon;
	private String hoten;
	private String ngaymua;
	private long soluongmua;
	private long tongtien;
	private long thanhtien;
	private boolean damua;
	public DonHangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DonHangbean(long mahoadon, String hoten, String ngaymua, long soluongmua, long tongtien, long thanhtien,
			boolean damua) {
		super();
		this.mahoadon = mahoadon;
		this.hoten = hoten;
		this.ngaymua = ngaymua;
		this.soluongmua = soluongmua;
		this.tongtien = tongtien;
		this.thanhtien = thanhtien;
		this.damua = damua;
	}
	public long getMahoadon() {
		return mahoadon;
	}
	public void setMahoadon(long mahoadon) {
		this.mahoadon = mahoadon;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(String ngaymua) {
		this.ngaymua = ngaymua;
	}
	public long getSoluongmua() {
		return soluongmua;
	}
	public void setSoluongmua(long soluongmua) {
		this.soluongmua = soluongmua;
	}
	public long getTongtien() {
		return tongtien;
	}
	public void setTongtien(long tongtien) {
		this.tongtien = tongtien;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	
	
}

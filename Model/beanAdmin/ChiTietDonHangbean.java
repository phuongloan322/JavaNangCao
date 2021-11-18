package beanAdmin;

public class ChiTietDonHangbean {
	private long machitiet;
	private String hoten;
	private String tensach;
	private long gia;
	private long soluongmua;
	private long tongtien;
	private String ngaymua;
	private boolean damua;
	private long mahoadon;
	private String anh;
	private String tacgia;
	public ChiTietDonHangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChiTietDonHangbean(long machitiet, String hoten, String tensach, long gia, long soluongmua, long tongtien,
			String ngaymua, boolean damua, long mahoadon, String anh, String tacgia) {
		super();
		this.machitiet = machitiet;
		this.hoten = hoten;
		this.tensach = tensach;
		this.gia = gia;
		this.soluongmua = soluongmua;
		this.tongtien = tongtien;
		this.ngaymua = ngaymua;
		this.damua = damua;
		this.mahoadon = mahoadon;
		this.anh = anh;
		this.tacgia = tacgia;
	}
	public long getMachitiet() {
		return machitiet;
	}
	public void setMachitiet(long machitiet) {
		this.machitiet = machitiet;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
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
	public String getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(String ngaymua) {
		this.ngaymua = ngaymua;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	public long getMahoadon() {
		return mahoadon;
	}
	public void setMahoadon(long mahoadon) {
		this.mahoadon = mahoadon;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getTacgia() {
		return tacgia;
	}
	public void setTacgia(String tacgia) {
		this.tacgia = tacgia;
	}
	
}

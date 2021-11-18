package bean;

public class ChiTietHoaDon {
	private long MaChiTietHD;
	private String MaSach;
	private int SoLuongMua;
	private HoaDonbean hoaDonbean;
	private boolean damua;
	public ChiTietHoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChiTietHoaDon(long maChiTietHD, String maSach, int soLuongMua, HoaDonbean hoaDonbean, boolean damua) {
		super();
		MaChiTietHD = maChiTietHD;
		MaSach = maSach;
		SoLuongMua = soLuongMua;
		this.hoaDonbean = hoaDonbean;
		this.damua = damua;
	}
	public long getMaChiTietHD() {
		return MaChiTietHD;
	}
	public void setMaChiTietHD(long maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}
	public String getMaSach() {
		return MaSach;
	}
	public void setMaSach(String maSach) {
		MaSach = maSach;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public HoaDonbean getHoaDonbean() {
		return hoaDonbean;
	}
	public void setHoaDonbean(HoaDonbean hoaDonbean) {
		this.hoaDonbean = hoaDonbean;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	
}

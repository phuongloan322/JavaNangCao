package beanAdmin;

public class AccountAdminbean {
	private String username;
	private String matkhau;
	private boolean quyen;
	private String hoten;
	public AccountAdminbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AccountAdminbean(String username, String matkhau, boolean quyen, String hoten) {
		super();
		this.username = username;
		this.matkhau = matkhau;
		this.quyen = quyen;
		this.hoten = hoten;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	public boolean isQuyen() {
		return quyen;
	}
	public void setQuyen(boolean quyen) {
		this.quyen = quyen;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	
}

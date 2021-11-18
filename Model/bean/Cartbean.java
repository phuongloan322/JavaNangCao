package bean;

/**
 * @author Admin
 *
 */
public class Cartbean {
	private double id;
	private int soluong;
	private double tongtien;
	private Sachbean sachbean;
	public Cartbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cartbean(double id, int soluong, double tongtien, Sachbean sachbean) {
		super();
		this.id = id;
		this.soluong = soluong;
		this.tongtien = tongtien;
		this.sachbean = sachbean;
	}
	public double getId() {
		return id;
	}
	public void setId(double id) {
		this.id = id;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public double getTongtien() {
		return tongtien;
	}
	public void setTongtien(double tongtien) {
		this.tongtien = tongtien;
	}
	public Sachbean getSachbean() {
		return sachbean;
	}
	public void setSachbean(Sachbean sachbean) {
		this.sachbean = sachbean;
	}
	
	
}

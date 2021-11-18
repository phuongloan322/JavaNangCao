package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.Accountbean;

public class Accountdao {
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	DungChung dc = new DungChung();
	
	public List<Accountbean> getAccount() {
		List<Accountbean> ds = new ArrayList<Accountbean>();
		String sql = "SELECT makh, hoten, diachi, sodt, email, tendn, pass from KhachHang";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			st = cnn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Accountbean accountbean = new Accountbean(
						rs.getLong("makh"), 
						rs.getString("hoten"), 
						rs.getString("diachi"), 
						rs.getString("sodt"), 
						rs.getString("email"), 
						rs.getString("tendn"), 
						rs.getString("pass"));
				ds.add(accountbean);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
	
	public int AddAccount(Accountbean acc) {
		int result = 0;
		String sql = "INSERT INTO KhachHang VALUES (?,?,?,?,?,?)";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			pst.setString(1 , acc.getHoten());
			pst.setString(2 , acc.getDiachi());
			pst.setString(3 , acc.getSodt());
			pst.setString(4 , acc.getEmail());
			pst.setString(5 , acc.getUsername());
			pst.setString(6 , acc.getPassword());
			
			result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteAccount(long makh) {
		int rs = 0;
		String sql = "delete from KhachHang where makh = ?";
		try {
			DungChung dc = new DungChung();
			dc.KetNoi();
			Connection cnn = dc.cnn;
			
			pst = cnn.prepareStatement(sql);
			pst.setLong(1, makh);
			rs = pst.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}

package daoAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.Accountbean;
import beanAdmin.AccountAdminbean;
import dao.DungChung;

public class AccountAdmindao {
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;

	DungChung dc = new DungChung();

	public List<Accountbean> getAccountCustomer() throws Exception {
		List<Accountbean> ds = new ArrayList<Accountbean>();
		String sql = "SELECT makh, hoten, diachi, sodt, email, tendn, pass from KhachHang";
		dc.KetNoi();
		Connection cnn = dc.cnn;

		st = cnn.createStatement();
		rs = st.executeQuery(sql);
		while (rs.next()) {
			Accountbean accountbean = new Accountbean(rs.getLong("makh"), rs.getString("hoten"), rs.getString("diachi"),
					rs.getString("sodt"), rs.getString("email"), rs.getString("tendn"), rs.getString("pass"));
			ds.add(accountbean);
		}
		rs.close();
		return ds;
	}
	
	public List<AccountAdminbean> getAccount()  {
		List<AccountAdminbean> ds = new ArrayList<AccountAdminbean>();
		String sql = "SELECT * from DangNhap";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			st = cnn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				AccountAdminbean accountbean = new AccountAdminbean(rs.getString("TenDangNhap"), rs.getString("MatKhau"), rs.getBoolean("Quyen"), rs.getString("HoTen"));
				ds.add(accountbean);
			}
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return ds;
	}
	
	public int addAccount(AccountAdminbean account) {
		int rs = 0;
		String sql =  "insert into DangNhap values(?,?,?,?)";
		try {
			dc.KetNoi();
			Connection cnn = dc.cnn;
			pst = cnn.prepareStatement(sql);
			pst.setString(1, account.getUsername());
			pst.setString(2, account.getMatkhau());
			pst.setBoolean(3, account.isQuyen());
			pst.setString(4, account.getHoten());
			
			rs = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}

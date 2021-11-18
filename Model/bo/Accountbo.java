package bo;

import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import bean.Accountbean;
import bean.Loaibean;
import dao.Accountdao;

public class Accountbo {
	
	Accountdao accdao = new Accountdao();
	
	public List<Accountbean> getAccount() {
		return accdao.getAccount();
	}
	
	public List<Accountbean> TimAcc(String key) {
		List<Accountbean> ds = new ArrayList<Accountbean>();
		List<Accountbean> tam = accdao.getAccount();
		for(Accountbean acc : tam) {
			if(acc.getUsername().equals(key)) {
				ds.add(acc);
			}
		}
		return ds;
	}
	
	public Accountbean FindAccount(long makh) {
		Accountbean accbean = null;
		List<Accountbean> ds = accdao.getAccount();
		for(Accountbean acc : ds) {
			if(acc.getMakh().equals(makh))
				accbean = acc;
		}
		return accbean;
	}
	public boolean FindAcc(String username) {
		List<Accountbean> tam = accdao.getAccount();
		Accountbean account = null;
		for(Accountbean acc : tam) {
			if(acc.getUsername().equals(username))
				return true;
		}
		return false;
	}
	
	public Accountbean CheckAcc(String username, String password) {
		List<Accountbean> tam = accdao.getAccount();
		for(Accountbean acc : tam) {
			if(acc.getUsername().equals(username)) {
				if (acc != null) {
					if (BCrypt.checkpw(password, acc.getPassword())) {
						return acc;
					} else {
						return null;
					}
				}
			}
		}
		return null;
	}
	
	public int AddAccount(Accountbean acc) {
		acc.setPassword(BCrypt.hashpw(acc.getPassword(), BCrypt.gensalt(12)));
		return accdao.AddAccount(acc);
	}
	
	public int deleteAccount(long makh) {
		return accdao.deleteAccount(makh);
	}
}

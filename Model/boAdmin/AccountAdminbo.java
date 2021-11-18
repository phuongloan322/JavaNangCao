package boAdmin;

import java.util.List;

import bean.Accountbean;
import beanAdmin.AccountAdminbean;
import daoAdmin.AccountAdmindao;

public class AccountAdminbo {
	
	AccountAdmindao dao = new AccountAdmindao();
	
	public List<Accountbean> getAccountCustomer() throws Exception {
		return dao.getAccountCustomer();
	}
	
	public List<AccountAdminbean> getAccount() throws Exception {
		return dao.getAccount();
	}
	
	public AccountAdminbean CheckLogin(String username, String password) {
		AccountAdminbean account = null;
		List<AccountAdminbean> ds = dao.getAccount();
		for(AccountAdminbean acc : ds) {
			if(acc.getUsername().equals(username) && acc.getMatkhau().equals(password)) {
				account = acc;
			}
		}
		return account;
	}
	public int addAccount(AccountAdminbean account) {
		return dao.addAccount(account);
	}
}

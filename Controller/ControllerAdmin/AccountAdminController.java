package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beanAdmin.AccountAdminbean;
import boAdmin.AccountAdminbo;

/**
 * Servlet implementation class AccountAdminController
 */
@WebServlet("/admin/login")
public class AccountAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountAdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("adminInfor") == null) {
			
			RequestDispatcher rq = request.getRequestDispatcher("/viewAdmin/login.jsp");
			rq.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AccountAdminbo accbo = new AccountAdminbo();

		AccountAdminbean account;
		account = accbo.CheckLogin(username, password);
		
		if (account != null) {
			session.setAttribute("adminInfor", account);
			session.removeAttribute("msg");
			response.sendRedirect(request.getContextPath() + "/admin/index?msg=OK");
			return;
		} 
		else {
			session.setAttribute("msg", "Tên đăng nhập hoặc mật khẩu không chính xác!");
			response.sendRedirect(request.getContextPath() + "/admin/login?msg=ERROR");
			return;
		}
	}

}

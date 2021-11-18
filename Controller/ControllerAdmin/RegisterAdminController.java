package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beanAdmin.AccountAdminbean;
import boAdmin.AccountAdminbo;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/admin/register")
public class RegisterAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("/viewAdmin/register.jsp");
		rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		AccountAdminbo accbo = new AccountAdminbo();
		
		String hoten = request.getParameter("hoten");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		AccountAdminbean account = new AccountAdminbean(username, password, true, hoten);
		int rs = accbo.addAccount(account);
		if(rs > 0) {
			response.sendRedirect(request.getContextPath()+"/admin/login");
			return;
		}
		else {
			response.sendRedirect(request.getContextPath()+"/admin/register?msg=ERROR");
			return;
		}
	}

}

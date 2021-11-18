package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Accountbean;
import bo.Accountbo;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/Register.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		Accountbean acc = new Accountbean();
		String username = request.getParameter("username");
		String hoten = request.getParameter("hoten");
		String email = request.getParameter("email");
		String sodt = request.getParameter("sodt");
		String password = request.getParameter("password");
		String diachi = request.getParameter("diachi");
		acc = new Accountbean(hoten, diachi, sodt, email, username, password);
		
		Accountbo accountbo = new Accountbo();
		
		if(!accountbo.FindAcc(username)) {
			int add = accountbo.AddAccount(acc);
			if(add > 0) {
				response.sendRedirect(request.getContextPath()+"/login");
			}
			else response.sendRedirect(request.getContextPath()+"/Register?msg=ERR");
		}
		else {
			response.sendRedirect(request.getContextPath()+"/Register?msg=ERROR");
		}
		
	}

}

package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Accountbean;
import bo.Accountbo;


@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginInfor")==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect(request.getContextPath()+"/login");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setAttribute("error", " ");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Accountbo accbo = new Accountbo();
		Accountbean account = accbo.CheckAcc(username, password);
		
		if(account != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginInfor", account);
			response.sendRedirect(request.getContextPath()+"/Sach_index?msg=OK");
			//response.sendRedirect(request.getHeader("Referer")+"?msg=OK");
			return;
		}
		else {
			response.sendRedirect(request.getContextPath()+"/login?msg=ERROR");
			return;
		}
		
	}

}

package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Accountbean;
import bean.Loaibean;
import bean.Sachbean;
import bo.Accountbo;
import bo.Loaibo;
import bo.Sachbo;
import dao.Sachdao;

/**
 * Servlet implementation class QuanLyKhachHangController
 */
@WebServlet("/QuanLyKhachHang")
public class QuanLyKhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLyKhachHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("adminInfor") == null) {
			response.sendRedirect(request.getContextPath()+"/admin/login");
			return;
		}
		Accountbo accbo = new Accountbo();
		
		request.setAttribute("Acclist", accbo.getAccount());
		
		String kt = request.getParameter("kt");
		if(kt == null) {
				RequestDispatcher rq = request.getRequestDispatcher("/viewAdmin/QuanLyKhachHang.jsp");
				rq.forward(request, response);
		}
		else
			if(kt.equals("Add")) {
				String hoten = request.getParameter("hoten");
				String diachi = request.getParameter("diachi");
				String sodt = request.getParameter("sodt");
				String email = request.getParameter("email");
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				Accountbean accbean = new  Accountbean(hoten, diachi, sodt, email, username, password);
				
				if(!accbo.FindAcc(username)) {
					int add = accbo.AddAccount(accbean);
					if(add > 0) {
						response.sendRedirect(request.getContextPath()+"/QuanLyKhachHang?msg=OK");
					}
					else response.sendRedirect(request.getContextPath()+"/QuanLyKhachHang?msg=ERROR");
				}
				else {
					request.setAttribute("ExistsUsername", "Đã tồn tại Tên đăng nhập!");
					response.sendRedirect(request.getContextPath()+"/QuanLyKhachHang?msg=ERROR");
				}
			}
			else if(kt.equals("Delete")) {
				long makh = Long.parseLong(request.getParameter("itemDeleteKhachHang"));
				int rs = accbo.deleteAccount(makh);
				if(rs > 0) {
					response.sendRedirect(request.getContextPath()+"/QuanLyKhachHang?msg=OK");
					
				}
				else {
					
					response.sendRedirect(request.getContextPath()+"/QuanLyKhachHang?msg=ERROR");
					
				}
			}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		doGet(request, response);
		
	}

}

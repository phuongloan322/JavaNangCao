package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Accountbean;
import bean.ChiTietHoaDon;
import bo.ChiTietHoaDonbo;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/DetailOrder")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("loginInfor") != null) {
			
			ChiTietHoaDonbo cthdbo = new ChiTietHoaDonbo();
			Accountbean accLogin = (Accountbean) request.getSession().getAttribute("loginInfor");
			
			List<ChiTietHoaDon> ds = cthdbo.getCTHD(accLogin.getMakh());
			session.setAttribute("DetailOrder", ds);
			
			RequestDispatcher rd = request.getRequestDispatcher("/views/Order.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package Controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.Map;

import bean.Accountbean;
import bean.Cartbean;
import bean.ChiTietHoaDon;
import bean.HoaDonbean;
import bo.ChiTietHoaDonbo;
import bo.HoaDonbo;

@WebServlet("/checkout")
public class CheckOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckOutController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("loginInfor") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		if (session.getAttribute("loginInfor") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
		}
		else {
				
		Accountbean accLogin = (Accountbean) request.getSession().getAttribute("loginInfor");
		long makh = accLogin.getMakh();

		DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String ngayMua = f.format(now);

		String thanhtoan = request.getParameter("thanhtoan");
		boolean damua = Boolean.parseBoolean(thanhtoan);

		HoaDonbean hoaDonbean = new HoaDonbean(0, makh, ngayMua, damua);
		HoaDonbo hoaDonbo = new HoaDonbo();
		ChiTietHoaDonbo cthdbo = new ChiTietHoaDonbo();

		HashMap<String, Cartbean> cart = (HashMap<String, Cartbean>) session.getAttribute("Cart");

		if (cart != null) {
			if(hoaDonbo.AddHD(hoaDonbean) > 0) {
				hoaDonbean = hoaDonbo.getHD(makh, ngayMua);
				for (Map.Entry<String, Cartbean> entry : cart.entrySet()) {
					Cartbean itemCart = entry.getValue();
					int result = cthdbo.AddCTHD(
							new ChiTietHoaDon(0, itemCart.getSachbean().getMasach(), itemCart.getSoluong(), hoaDonbean, damua));
				}
				session.removeAttribute("Cart");
				response.sendRedirect(request.getContextPath() + "/DetailOrder?msg=OK");
			}
		}else {
			response.sendRedirect(request.getContextPath() + "/Cart?msg=ERROR");
		}
		
		}
	}

}

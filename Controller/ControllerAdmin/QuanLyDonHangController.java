package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.HoaDonbo;
import boAdmin.DonHangbo;

/**
 * Servlet implementation class QuanLyDonHangController
 */
@WebServlet("/QuanLyDonHang")
public class QuanLyDonHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLyDonHangController() {
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
		
		HoaDonbo hdbo = new HoaDonbo();
		DonHangbo dhbo = new DonHangbo();
		
		request.setAttribute("DonHanglist", dhbo.getDonHang());
		request.setAttribute("DonHangXacNhanlist", dhbo.getDonHangDaXacNhan());
		
		//Xác nhận đơn hàng
		
		String mahoadon = request.getParameter("xacnhan");
		String deleteHD = request.getParameter("delete");
		
		if(mahoadon != null) {
			
			int rs = dhbo.XacNhanDonHang(Long.parseLong(mahoadon));
			
			if(rs > 0) {
				response.sendRedirect(request.getContextPath()+"/QuanLyDonHang?msg=OK");
			}
			
			else {
				response.sendRedirect(request.getContextPath()+"/QuanLyDonHang?msg=ERROR");
			}
			
		}
		
		//Xóa đơn hàng
		
		
		else if(deleteHD != null) {
			
			int rs1 = dhbo.deleteDonHang(Long.parseLong(deleteHD));
			
			if(rs1 > 0) {
				response.sendRedirect(request.getContextPath()+"/QuanLyDonHang?msg=OK");
			}
			
			else {
				response.sendRedirect(request.getContextPath()+"/QuanLyDonHang?msg=OK");		//xem lại
			}
			
		}
		
		//Hiển thị đơn hàng
		
		else {
			RequestDispatcher rd = request.getRequestDispatcher("/viewAdmin/QuanLyDonHang.jsp");
			rd.forward(request, response);
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

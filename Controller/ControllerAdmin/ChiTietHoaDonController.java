package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boAdmin.ChiTietDonHangbo;
import boAdmin.DonHangbo;

/**
 * Servlet implementation class ChiTietHoaDonController
 */
@WebServlet("/ChiTietHoaDon")
public class ChiTietHoaDonController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChiTietHoaDonController() {
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
			response.sendRedirect(request.getContextPath()+"/admin/login");
			return;
		}
		ChiTietDonHangbo CTDH = new ChiTietDonHangbo();
		DonHangbo DHbo = new DonHangbo();

		String mahoadon = request.getParameter("mahoadon");
		String machitiet = request.getParameter("xacnhan");
		String kt = request.getParameter("kt");
		if(mahoadon != null) {
			long mahd = Long.parseLong(mahoadon);
			request.setAttribute("ChiTietDonHang", CTDH.getAllDonHang(mahd));
			
			RequestDispatcher rd = request.getRequestDispatcher("/viewAdmin/ChiTietHoaDon.jsp");
			rd.forward(request, response);
		}
		
		
		else if(machitiet != null) {
			int rs = CTDH.XacNhanDonHang(Long.parseLong(machitiet));
			String mahd = request.getParameter("mahd");
			if(CTDH.testXacNhan(mahd) == 0) {		//kt còn đơn cần xác nhận k
				int xacnhan = DHbo.XacNhanDonHang(Long.parseLong(mahd));
			}
			if(rs > 0) {
				response.sendRedirect(request.getHeader("Referer"));
			}
			
			else {
				response.sendRedirect(request.getHeader("Referer"));
			}
		}
		
		
		else if(kt != null) {
			
				if(kt.equals("Edit")) {
					
					int soluongmua = Integer.parseInt(request.getParameter("soluong"));
					long maCTHD = Long.parseLong(request.getParameter("machitiet"));
					
					int rs = CTDH.editCTHD(maCTHD, soluongmua);
					
					if(rs > 0) {
						response.sendRedirect(request.getHeader("Referer"));
					}
					
					else {
						response.sendRedirect(request.getHeader("Referer"));
					}
				}
				
				if(kt.equals("Delete")) {
					long maCTHD = Long.parseLong(request.getParameter("itemDeleteCTHD"));
					
					int rs = CTDH.deleteCTHD(maCTHD);
					
					if(rs > 0) {
						response.sendRedirect(request.getHeader("Referer"));
					}
					
					else {
						response.sendRedirect(request.getHeader("Referer"));
					}
				}
			
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("/viewAdmin/ChiTietHoaDon.jsp");
			rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

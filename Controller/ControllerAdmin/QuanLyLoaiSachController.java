package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Loaibean;
import bean.Sachbean;
import bo.Loaibo;
import bo.Sachbo;
import dao.Sachdao;

/**
 * Servlet implementation class QuanLyLoaiSachController
 */
@WebServlet("/QuanLyLoaiSach")
public class QuanLyLoaiSachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLyLoaiSachController() {
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
		
		Loaibo loaibo = new Loaibo();
		
		request.setAttribute("Loailist", loaibo.getLoai());
		
		String kt = request.getParameter("kt");
		if(kt == null) {
				RequestDispatcher rq = request.getRequestDispatcher("/viewAdmin/QuanLyLoaiSach.jsp");
				rq.forward(request, response);
		}
		else
			if(kt.equals("Add")) {
				String maloai = request.getParameter("maloai");
				String tenloai = request.getParameter("tenloai");
				
				Loaibean loai = new Loaibean(maloai, tenloai);
				
				int rs = loaibo.addLoai(loai);
				if(rs > 0) {
					response.sendRedirect(request.getContextPath()+"/QuanLyLoaiSach?msg=OK");
					
				}
				else {
					
					response.sendRedirect(request.getContextPath()+"/QuanLyLoaiSach?msg=ERROR");
					
				}
			}
			else if(kt.equals("Delete")) {
				String maloai = request.getParameter("itemDeleteLoai");
				int rs = loaibo.deleteLoai(maloai);
				if(rs > 0) {
					response.sendRedirect(request.getContextPath()+"/QuanLyLoaiSach?msg=OK");
					
				}
				else {
					
					response.sendRedirect(request.getContextPath()+"/QuanLyLoaiSach?msg=ERROR");
					
				}
			}
			else if(kt.equals("Edit")) {
				String maloai = request.getParameter("maloai");
				String tenloai = request.getParameter("tenloai");
				
				Loaibean loai = new Loaibean(maloai, tenloai);
				
				int rs = loaibo.editLoai(loai);
				if(rs > 0) {
					response.sendRedirect(request.getContextPath()+"/QuanLyLoaiSach?msg=OK");
					
				}
				else {
					
					response.sendRedirect(request.getContextPath()+"/QuanLyLoaiSach?msg=ERROR");
					
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

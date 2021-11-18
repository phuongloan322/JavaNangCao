package ControllerAdmin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.google.gson.Gson;

import bean.Accountbean;
import bean.ChiTietHoaDon;
import bean.Loaibean;
import bean.Sachbean;
import bo.Accountbo;
import bo.Loaibo;
import bo.Sachbo;
import boAdmin.ChiTietDonHangbo;

/**
 * Servlet implementation class FindById
 */
@WebServlet("/FindById")
public class FindById extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public FindById() {
		super();

		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    Gson data = new Gson();
	    
	    Sachbo sachbo = new Sachbo();
	    Loaibo loaibo = new Loaibo();
	    Accountbo accbo = new Accountbo();
	    ChiTietDonHangbo ctdhbo = new ChiTietDonHangbo();
	    
//Get Id Sach	    
		String item = request.getParameter("item");
		if(item != null) {
			Sachbean sachbean = sachbo.FindSach(item);
		    String sachInfor = data.toJson(sachbean); 
		    response.getWriter().write(sachInfor);
		}
		String itemDelete = request.getParameter("itemDelete");
		if(itemDelete != null) {
			Sachbean sachbean = sachbo.FindSach(itemDelete);
			String masach = sachbean.getMasach();
		    String masachJS = data.toJson(masach); 
		    response.getWriter().write(masachJS);
		}
//get Id Loai
		String itemLoai = request.getParameter("itemLoai");
		if(itemLoai != null) {
			Loaibean loaibean = loaibo.FindLoai(itemLoai);
		    String loaiInfor = data.toJson(loaibean); 
		    response.getWriter().write(loaiInfor);
		}
		String itemDeleteLoai = request.getParameter("itemDeleteLoai");
		if(itemDeleteLoai != null) {
			Loaibean loaibean = loaibo.FindLoai(itemDeleteLoai);
		    String maloaiJS = data.toJson(loaibean.getMaloai()); 
		    response.getWriter().write(maloaiJS);
		}
//get Id Khach hang	
		String makh = request.getParameter("itemDeleteKhachHang");
		if(makh != null) {
			Accountbean account = accbo.FindAccount(Long.parseLong(makh));
		    String makhJS = data.toJson(account.getMakh()); 
		    response.getWriter().write(makhJS);
		}
//get Id Chi tiết đơn hàng
		String machitiet = request.getParameter("itemchitiet");
		if(machitiet != null) {
			ChiTietHoaDon cthd = ctdhbo.getChiTietHoaDon(Long.parseLong(machitiet));
			String chitietInfor = data.toJson(cthd); 
		    response.getWriter().write(chitietInfor);
		}
		/*
		 * String itemDeleteCTHD = request.getParameter("itemDeleteCTHD");
		 * if(itemDeleteCTHD != null) { String maDelete = data.toJson(itemDeleteCTHD);
		 * response.getWriter().write(maDelete); }
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

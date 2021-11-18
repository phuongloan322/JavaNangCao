package ControllerAdmin;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.Sachbean;
import bo.Loaibo;
import bo.Sachbo;
import dao.Sachdao;

/**
 * Servlet implementation class QuanLySachController
 */
@WebServlet("/QuanLySach")
public class QuanLySachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "asset/image_sach";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLySachController() {
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
		Sachbo sachbo = new Sachbo();
		Loaibo loaibo = new Loaibo();
		
		request.setAttribute("Sachlist", sachbo.getSach());
		request.setAttribute("Loailist", loaibo.getLoai());
		
		String kt = request.getParameter("kt");
		if(kt == null) {
				RequestDispatcher rq = request.getRequestDispatcher("/viewAdmin/QuanLySach.jsp");
				rq.forward(request, response);
		}
		else
			if(kt.equals("Add")) {
				String anh = "";
				String masach = "";
				String tensach = "";
				String maloai = "";
				String soluong = "";
				String tacgia = "";
				String sotap = "";
				String gia = "";
				String ngaynhap = "";
				
				if(!ServletFileUpload.isMultipartContent(request)) {
					request.setAttribute("resultadd", (long)0);
					RequestDispatcher rd = request.getRequestDispatcher("/viewAdmin/QuanLySach.jsp");
					rd.forward(request, response);
				}
				
				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				String uploadPath = getServletContext().getRealPath("")
						+ File.separator + UPLOAD_DIRECTORY;		//đường dẫn đến thư mục asset/image_sach
				File uploadDir = new File(uploadPath);
				
				if(!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				
				try {
					List<FileItem> fileItems = upload.parseRequest(request);	//lấy về các đối tượng gửi lên
					if(fileItems != null && fileItems.size() > 0) {		
						for(FileItem item : fileItems) {		//duyệt các đối tượng gồm file và các control
							if(!item.isFormField()) {			//nếu k phải control => upfile lên
									
								String fileName = new File(item.getName()).getName();		//get tên file	vd: anh1.png
								String filePath = uploadPath + File.separator + fileName;	//get đường dẫn file 
								File storeFile = new File(filePath);						//tạo file
								item.write(storeFile);										//lưu file				
								
								anh = "image_sach/"+fileName;
							}
							else {
								String getitem = item.getFieldName();
								
								if(getitem.equals("masach")) {
									masach = item.getString();
								}
								if(getitem.equals("tensach")) {
									tensach = item.getString("UTF-8");
								}
								if(getitem.equals("maloai")) {
									maloai = item.getString();
								}
								if(getitem.equals("soluong")) {
									soluong = item.getString();
								}
								if(getitem.equals("tacgia")) {
									tacgia = item.getString("UTF-8");
								}
								if(getitem.equals("sotap")) {
									sotap = item.getString();
								}
								if(getitem.equals("gia")) {
									gia = item.getString();
								}
								if(getitem.equals("ngaynhap")) {
									String st = item.getString();
									ngaynhap = st.substring(0,10) + " " + st.substring(11);
								}
							}
						}
						
						Sachbean sach = new Sachbean(masach, tensach, Long.parseLong(soluong), tacgia, Long.parseLong(gia), sotap, anh, ngaynhap, maloai);
						
						int rs = sachbo.addSach(sach);
						if(rs > 0) {
							response.sendRedirect(request.getContextPath()+"/QuanLySach?msg=OK");
							
						}
						else {
							
							response.sendRedirect(request.getContextPath()+"/QuanLySach?msg=ERROR");
							
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
//				
			}
			else if(kt.equals("Delete")) {
				String masach = request.getParameter("itemDelete");
				int rs = sachbo.deleteSach(masach);
				if(rs > 0) {
					response.sendRedirect(request.getContextPath()+"/QuanLySach?msg=OK");
					
				}
				else {
					
					response.sendRedirect(request.getContextPath()+"/QuanLySach?msg=ERROR");
					
				}
			}
			else if(kt.equals("Edit")) {
				String masach = request.getParameter("masach");
				String tensach = request.getParameter("tensach");
				long soluong = Long.parseLong(request.getParameter("soluong"));
				String tacgia = request.getParameter("tacgia");
				long gia = Long.parseLong(request.getParameter("gia"));
				String sotap = request.getParameter("sotap");
				String anh = request.getParameter("anh");
				String maloai = request.getParameter("maloai");
				String st = request.getParameter("ngaynhap");
				String ngaynhap = st.substring(0,10) + " " + st.substring(11);
				Sachbean sach = new Sachbean(masach, tensach, soluong, tacgia, gia, sotap, anh, ngaynhap, maloai);
				
				int rs = sachbo.editSach(sach);
				if(rs > 0) {
					response.sendRedirect(request.getContextPath()+"/QuanLySach?msg=OK");
					
				}
				else {
					
					response.sendRedirect(request.getContextPath()+"/QuanLySach?msg=ERROR");
					
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

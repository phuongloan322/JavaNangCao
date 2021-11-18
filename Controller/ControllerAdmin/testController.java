package ControllerAdmin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class testController
 */
@WebServlet("/test")
public class testController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload();
		String dirUrl1 = request.getServletContext().getRealPath("") + File.separator + "image_sach";
		response.getWriter().print(dirUrl1);
		
		try {
			List<FileItem> fileItems = upload.parseRequest(request);
			for(FileItem fileitem : fileItems) {
				if(!fileitem.isFormField()) {
					
					String nameing = fileitem.getName();
					if(!nameing.equals("")) {
						String dirUrl = request.getServletContext().getRealPath("") + File.separator + "image_sach";
						File dir = new File(dirUrl);
						if(!dir.exists()) {
							dir.mkdir();
						}
						String fileImg = dirUrl + File.separator +nameing;
						File file = new File(fileImg);
						try {
							fileitem.write(file);
							System.out.println("UPLOAD THANH CONG...!");
							System.out.println("Đường dẫn file là: " + dirUrl);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
				else {
					String tentk = fileitem.getFieldName();
					if(tentk.equals("txthoten")) {
						response.getWriter().print(fileitem.getString());
					}
					else {
						response.getWriter().print(fileitem.getString());
					}
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher("/viewAdmin/test.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		doGet(request, response);
	}

}

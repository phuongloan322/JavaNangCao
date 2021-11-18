package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Loaibean;
import bean.Sachbean;
import bo.Loaibo;
import bo.Sachbo;

@WebServlet("/DetailSach")
public class DetailSachController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DetailSachController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Sachbo sachbo = new Sachbo();
		Loaibo loaibo = new Loaibo();
		String masach = request.getParameter("i");
		
		if(masach != null) {
			Sachbean sachbean = sachbo.FindSach(masach);
			Loaibean loaibean = loaibo.FindLoai(sachbean.getMaloai());
			request.setAttribute("itemSach", sachbean);
			request.setAttribute("itemLoai", loaibean);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views/DetailSach.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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


@WebServlet("/Sach")
public class SachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SachController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Sachbo sachbo = new Sachbo();
		Loaibo loaibo = new Loaibo();
		List<Sachbean> Sachlist = sachbo.getSach();
		String ml = request.getParameter("ml");
		String key = request.getParameter("txtsearch");
		
		if (ml != null)
			Sachlist = sachbo.TimMaLoai(ml);
		else if (key != null)
			Sachlist = sachbo.TimChung(key);
		
		request.setAttribute("Sachlist", Sachlist);
		
		if(ml != null) {
			Loaibean loaibean = loaibo.FindLoai(ml);
			request.setAttribute("itemLoai", loaibean);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/Sach.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}

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
import javax.servlet.http.HttpSession;

import bean.Sachbean;
import bo.Sachbo;


@WebServlet("/Sach_index")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public IndexController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Sachbo sachbo = new Sachbo();
		List<Sachbean> Sachlist = sachbo.getSach();
		String ml = request.getParameter("ml");
		String key = request.getParameter("txtsearch");
		
		if (ml != null)
			Sachlist = sachbo.TimMaLoai(ml);
		else if (key != null)
			Sachlist = sachbo.TimChung(key);
		request.setAttribute("Sachlist", Sachlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/Sach_index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}

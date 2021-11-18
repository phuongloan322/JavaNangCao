package Controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Cartbean;
import bean.Sachbean;
import bo.Cartbo;
import bo.Sachbo;

@WebServlet("/Cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CartController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cartbo cartbo = new Cartbo();
		Sachbo sachbo = new Sachbo();
		
		String AddCart = request.getParameter("AddCart");
		String EditCart = request.getParameter("EditCart");
		String DeleteCart = request.getParameter("DeleteCart");
		HashMap<String, Cartbean> cart = (HashMap<String, Cartbean>)session.getAttribute("Cart");
		
		String itemCart = request.getParameter("itemCart");
		
		if(AddCart != null) {
			
				Sachbean sach = sachbo.FindSach(itemCart);
				if(cart == null){
					cart = new HashMap<String, Cartbean>();
				}
				cart = cartbo.AddCart(itemCart, cart);
				session.setAttribute("Cart", cart);
				response.sendRedirect(request.getHeader("Referer"));
//				response.sendRedirect(request.getContextPath()+"/Sach_index");
			
		}
		else if(EditCart != null) {
			String masach = request.getParameter("masach");
			String quanty = request.getParameter("quanty");
			if(quanty != null && masach != null) {
				cart = cartbo.EditCart(masach, Integer.parseInt(quanty), cart);
				session.setAttribute("Cart", cart);
				response.sendRedirect(request.getContextPath()+"/Cart");
			}
		} 
		else if(DeleteCart != null) {
			String check[] = request.getParameterValues("check"); 
			String item = request.getParameter("item");
			
			if(check!=null) {
				for(String str : check) {
					cart = cartbo.DeleteCart(str, cart);
					session.setAttribute("Cart", cart);
				}
				response.sendRedirect(request.getContextPath()+"/Cart");
			} 
			if(item != null && !item.equals("all")){
				cart = cartbo.DeleteCart(item, cart);
				session.setAttribute("Cart", cart);
				response.sendRedirect(request.getContextPath()+"/Cart");
			}
			if(cart!=null && item!=null && item.equals("all")) {
				session.removeAttribute("Cart");
				response.sendRedirect(request.getContextPath()+"/Sach_index");
			}
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("/views/Cart.jsp");
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}

}

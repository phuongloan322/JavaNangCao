package bo;

import java.util.HashMap;
import java.util.Map;

import bean.Cartbean;
import bean.Sachbean;
import dao.Cartdao;

public class Cartbo {
	Sachbo sbo = new Sachbo();
	public HashMap<String, Cartbean> AddCart(String masach, HashMap<String, Cartbean> cart) {
		Cartbean itemCart = new Cartbean();
		Sachbean sach = sbo.FindSach(masach);
		if(sach!=null && cart.containsKey(masach)) {
			itemCart = cart.get(masach);
			itemCart.setSoluong(itemCart.getSoluong() + 1);
			itemCart.setTongtien(itemCart.getSoluong()*itemCart.getSachbean().getGia());
		}
		else
		{
			itemCart.setSachbean(sach);
			itemCart.setSoluong(1);
			itemCart.setTongtien(sach.getGia());
		}
		cart.put(masach, itemCart);
		return cart;
	}
	
	public int TotalQuanty(HashMap<String, Cartbean> cart) {
		int totalQuanty = 0;
		for(Map.Entry<String, Cartbean> itemCart : cart.entrySet()) {
			totalQuanty += itemCart.getValue().getSoluong();
		}
		return totalQuanty;
	}
	
	public long TotalPrice(HashMap<String, Cartbean> cart) {
		long totalPrice = 0;
		for(Map.Entry<String, Cartbean> itemCart : cart.entrySet()) {
			totalPrice += itemCart.getValue().getTongtien();
		}
		return totalPrice;
	}
	
	public HashMap<String, Cartbean> EditCart(String masach, int quanty, HashMap<String, Cartbean> cart) {
		if(cart == null) {
			return cart;
		}
		Cartbean itemCart = new Cartbean();
		if(cart.containsKey(masach)) {
			itemCart = cart.get(masach);
			int quantity = quanty + itemCart.getSoluong();
			itemCart.setSoluong(quantity);
			double totalPrice = quantity * itemCart.getSachbean().getGia();
			itemCart.setTongtien(totalPrice);
		}
		cart.put(masach, itemCart);
		return cart;
	}
	
	public HashMap<String, Cartbean> DeleteCart(String masach, HashMap<String, Cartbean> cart) {
		if(cart==null) {
			return cart;
		}
		if(cart.containsKey(masach)) {
			cart.remove(masach);
		}
		return cart;
	}
}

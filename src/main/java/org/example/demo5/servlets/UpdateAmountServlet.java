package org.example.demo5.servlets;

import org.example.demo5.db.DB;
import org.example.demo5.entity.Basket;
import org.example.demo5.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/update-amount")
public class UpdateAmountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        int productId = Integer.parseInt(req.getParameter("productId"));
        Product product1 = DB.PRODUCTS.stream().filter(product -> product.getId().equals(productId)).findFirst().orElseThrow();
        HttpSession session = req.getSession();
        Basket basket = (Basket)session.getAttribute("basket");

        Integer value = basket.getBasket().get(product1);

        if (action.equals("increase")){
            value++;
            basket.getBasket().put(product1,value);
        }else {
            if (value == 1){
                basket.getBasket().remove(product1);
            }else {
                value--;
                basket.getBasket().put(product1,value);
            }
        }
        session.setAttribute("basket",basket);
        resp.sendRedirect("/basket.jsp");
    }
}

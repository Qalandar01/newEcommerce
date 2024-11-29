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
import java.util.Objects;

@WebServlet("/basket/add")
public class AddToBasketServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        Product product1 = DB.PRODUCTS.stream().filter(product -> product.getId().equals(productId)).findFirst().orElseThrow();
        HttpSession session = req.getSession();
        Basket basket = (Basket)Objects.requireNonNullElse(session.getAttribute("basket"),new Basket());

        if (basket.getBasket().containsKey(product1)){
            basket.getBasket().remove(product1);
        }
        else {
            basket.getBasket().put(product1,1);
        }
        session.setAttribute("basket",basket);
        resp.sendRedirect("/home.jsp");

    }
}

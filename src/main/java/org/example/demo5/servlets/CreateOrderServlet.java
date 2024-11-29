package org.example.demo5.servlets;

import org.example.demo5.db.DB;
import org.example.demo5.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/basket/confirm")
public class CreateOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Order order = new Order();
        HttpSession session = req.getSession();
        User user =(User) session.getAttribute("user");
        if (user ==null){
            resp.sendRedirect("/login.jsp");
            return;
        }
        Basket basket = (Basket) session.getAttribute("basket");
        for (Map.Entry<Product, Integer> entry : basket.getBasket().entrySet()) {
            OrderItem orderItem = new OrderItem(
                    order.getId(), entry.getKey().getId(),
                    entry.getValue()
            );
            DB.ORDER_ITEMS.add(orderItem);
        }
        order.setUserId(user.getId());
        DB.ORDERS.add(order);
        basket.getBasket().clear();
        session.setAttribute("basket",basket);
        resp.sendRedirect("/home.jsp");
    }
}

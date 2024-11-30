package org.example.demo5.servlets;

import org.example.demo5.db.DB;
import org.example.demo5.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Optional<User> first = DB.USERS.stream().filter(user -> user.getUserName().equals(username) && user.getPassword().equals(password)).findFirst();
        if (first.isEmpty()) {
            resp.sendRedirect("/login.jsp");
            return;
        }
        User user = first.get();
        req.getSession().setAttribute("user",user);
        resp.sendRedirect("/home.jsp");

    }
}

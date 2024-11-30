package org.example.demo5.servlets;

import org.example.demo5.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/save")
public class UserUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("/home.jsp");
            return;
        }
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String password = req.getParameter("password");
        String username = req.getParameter("username");
        user.setUserName(username);
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setPassword(password);
        req.getSession().setAttribute("user",user);
        resp.sendRedirect("/home.jsp");
    }
}

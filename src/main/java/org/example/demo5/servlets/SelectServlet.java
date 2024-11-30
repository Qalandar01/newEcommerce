package org.example.demo5.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/select")
public class SelectServlet extends HttpServlet {
    public static Integer adminChoosenCatId = 0;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("categoryId");
        adminChoosenCatId = Integer.parseInt(id);
        resp.sendRedirect("/admin/admin.jsp");
    }
}

package org.example.demo5.filter;

import org.example.demo5.entity.Role;
import org.example.demo5.entity.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class Filter extends HttpFilter {
    List<String> openPages = new ArrayList<>(
            List.of("/home.jsp",
                    "/basket.jsp",
                    "/login.jsp",
                    "/register.jsp"
            )
    );
    List<String> userPages = new ArrayList<>(List.of(
            "/user"
    ));

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        if (openPages.contains(req.getRequestURI())) {
            chain.doFilter(req, res);
            return;
        }
        if (req.getRequestURI().contains("/admin")) {
            User user = (User) req.getSession().getAttribute("user");
            if (user == null) {
                res.sendRedirect("/login.jsp");
                return;
            }
            if (user.getRole().equals(Role.ADMIN)) {
                chain.doFilter(req, res);
                return;
            }
        }
        if (userPages.contains(req.getRequestURI())) {
            User user = (User) req.getSession().getAttribute("user");
            if (user == null) {
                res.sendRedirect("/login.jsp");
                return;
            }
            if (user.getRole().equals(Role.USER)) {
                chain.doFilter(req, res);
                return;
            }
        }

        chain.doFilter(req, res);
    }
}

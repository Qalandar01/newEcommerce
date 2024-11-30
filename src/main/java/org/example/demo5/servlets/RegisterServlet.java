package org.example.demo5.servlets;

import org.example.demo5.db.DB;
import org.example.demo5.entity.Role;
import org.example.demo5.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet("/user/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part profilePicture = req.getPart("profilePicture");
        byte[] bytes = profilePicture.getInputStream().readAllBytes();
        String firstname = req.getParameter("firstName");
        String lastname = req.getParameter("lastName");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String password1 = req.getParameter("confirmPassword");

        Path path = Files.write(Path.of("C:/Users/LENOVO/IdeaProjects/demo5/userPictures/" + firstname + ".jpg"), bytes);
        if (!password1.equals(password)){
            resp.sendRedirect("/register.jsp");
            return;
        }
        User user = new User(
                firstname,
                lastname,
                path.toString(),username,password, Role.USER
        );
        DB.USERS.add(user);
        resp.sendRedirect("/login.jsp");
    }
}

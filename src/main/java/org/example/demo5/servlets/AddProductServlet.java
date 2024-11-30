package org.example.demo5.servlets;

import org.example.demo5.db.DB;
import org.example.demo5.entity.Product;

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

import static org.example.demo5.servlets.SelectServlet.adminChoosenCatId;

@WebServlet("/product/add")
@MultipartConfig
public class AddProductServlet extends HttpServlet {
    String absolutePath = "C:/Users/LENOVO/IdeaProjects/ecommerce/productPhotos/";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Part productImage = req.getPart("productImage");

        byte[] bytes = productImage.getInputStream().readAllBytes();
        Path path = Files.write(Path.of(absolutePath +name+ ".jpg"), bytes);
        String photoUrl = path.toString();
        Integer price = Integer.parseInt(req.getParameter("price"));
        Product product = new Product(
                name,
                price,
                adminChoosenCatId,
                photoUrl
        );
        DB.PRODUCTS.add(product);
        resp.sendRedirect("/admin/adminChooseCat.jsp");
    }
}

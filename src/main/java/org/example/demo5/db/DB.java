package org.example.demo5.db;



import org.example.demo5.entity.*;

import java.util.ArrayList;
import java.util.List;

public interface DB {
    List<User> USERS = new ArrayList<>(
            List.of(
                    new User("Qalandar","Qalandarov","","+998914368678","asd", Role.ADMIN)
            )
    );
    List<Category> CATEGORIES = new ArrayList<>(
            List.of(
                    new Category("Drinks"),
                    new Category("Fruits"),
                    new Category("Foods")
            )
    );



        String absolutePath = "C:/Users/LENOVO/IdeaProjects/demo5/productPhotos/";
        List<Product> PRODUCTS = new ArrayList<>(List.of(
                new Product("Apple",12,2, absolutePath + "apple.jpg"),
                new Product("Grape",15,2, absolutePath + "grape.jpg"),
                new Product("Fanta",9,1, absolutePath + "fanta.jpg"),
                new Product("Moxito",13,1, absolutePath + "moxito.jpg"),
                new Product("Lagmon",23,3, absolutePath + "lagmon.jpg"),
                new Product("Kebab",28,3, absolutePath + "kebab.jpg")
        ));
    List<Order> ORDERS = new ArrayList<>();
    List<OrderItem> ORDER_ITEMS = new ArrayList<>();

}

package org.example.demo5.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class User {
    private Integer id = idGen++;
    private String firstName;
    private String lastName;
    private String photoUrl;
    private String userName;
    private String password;
    private Role role;
    private static Integer idGen = 1;

    public User(String firstName, String lastName, String photoUrl, String userName, String password, Role role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.photoUrl = photoUrl;
        this.userName = userName;
        this.password = password;
        this.role = role;
    }
}

package org.example.demo5.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private Integer id = idGen++;
    private LocalDateTime dateTime = LocalDateTime.now();
    private Status status = Status.NEW;
    private static Integer idGen = 1;
    private Integer userId;


}

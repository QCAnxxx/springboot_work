package cn.lemon.lib.entity;

import lombok.Data;

import javax.persistence.*;

@Table
@Entity
@Data
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    private String password;

    private long phone;

    private long age;

    private String sex;

    private long status;

}
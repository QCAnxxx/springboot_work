package cn.lemon.lib.entity;


import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

@Table
@Entity
@Data
public class Announcement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String content;

    private Timestamp release_time;
}

package cn.lemon.lib.utils;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.servlet.http.Cookie;

@Data
@AllArgsConstructor
public class WithControllerSimplify {
    private String url;
    private Cookie cookie;
}

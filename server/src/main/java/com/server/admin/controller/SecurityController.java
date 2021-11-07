package com.server.admin.controller;

import com.server.admin.model.Login;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SecurityController {


    @PostMapping("/login")
    public void login() {}
}

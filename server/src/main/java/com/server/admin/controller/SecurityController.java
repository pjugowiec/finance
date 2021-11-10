package com.server.admin.controller;

import com.server.admin.model.RegisterRequest;
import com.server.admin.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@AllArgsConstructor
public class SecurityController {

    private final UserService userService;

    @PostMapping("/login")
    public void login() {}

    @PostMapping("/register")
    public ResponseEntity<Void> register(@Valid @RequestBody RegisterRequest registerRequest) {
        userService.create(registerRequest);
        return ResponseEntity.accepted().build();
    }
}

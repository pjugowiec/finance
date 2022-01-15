package com.server.admin.controller;

import com.server.admin.model.ForgotPasswordCode;
import com.server.admin.model.RegisterRequest;
import com.server.admin.service.ForgottenPasswordService;
import com.server.admin.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.util.Locale;

import static com.server.shared.config.LangConfig.getLocale;

@RestController
@AllArgsConstructor
public class SecurityController {

    private final UserService userService;
    private final ForgottenPasswordService forgottenPasswordService;

    @PostMapping("/login")
    public void login() {}

    @PostMapping("/register")
    public ResponseEntity<Void> register(@Valid @RequestBody RegisterRequest registerRequest) {
        userService.create(registerRequest);
        return ResponseEntity.accepted().build();
    }

    @PostMapping("/password/forgot")
    public ResponseEntity<Void> forgotPassword(@RequestParam("email") final String email,
                                               @RequestHeader("lang") final String lang) {

        final Locale locale = getLocale(lang);
        forgottenPasswordService.generateSendCode(email, locale);
        return ResponseEntity.accepted().build();
    }

    @GetMapping("/password/forgot/validate")
    public ResponseEntity<Void> validateForgotPasswordCode(@RequestBody final ForgotPasswordCode forgotPasswordCode) {


        return ResponseEntity.accepted().build();
    }
}

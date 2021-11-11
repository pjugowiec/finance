package com.server.balance.controller;

import com.server.balance.model.Balance;
import com.server.balance.service.BalanceService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/balance")
@AllArgsConstructor
public class BalanceController {

    private final BalanceService balanceService;

    @PostMapping
    public ResponseEntity<Balance> addBalance(@Valid @RequestBody final Balance balance) {
        return ResponseEntity.ok(balanceService.addBalance(balance));
    }

}

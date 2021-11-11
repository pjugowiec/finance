package com.server.balance.controller;

import com.server.balance.model.Balance;
import com.server.balance.model.BalanceSummary;
import com.server.balance.service.BalanceService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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

    @GetMapping
    public ResponseEntity<BalanceSummary> getSummary(final HttpServletRequest request) {
        final String username = request.getUserPrincipal().getName();
        return ResponseEntity.ok(balanceService.getSummary(username));
    }

}

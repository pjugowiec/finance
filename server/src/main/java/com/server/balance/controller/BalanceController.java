package com.server.balance.controller;

import com.server.balance.model.Balance;
import com.server.balance.model.BalanceSummary;
import com.server.balance.model.Transaction;
import com.server.balance.model.TransactionRequest;
import com.server.balance.service.BalanceService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Collection;

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
        final String username = getUsernameFromRequest(request);
        return ResponseEntity.ok(balanceService.getSummary(username));
    }

    @GetMapping("/transactions")
    public ResponseEntity<Collection<Transaction>> getTransactions(@Valid @ModelAttribute TransactionRequest transactionRequest, final HttpServletRequest request) {
        final String username = getUsernameFromRequest(request);
        return ResponseEntity.ok(balanceService.getTranslations(transactionRequest, username));
    }

    @DeleteMapping("/transactions/{id}")
    public ResponseEntity<Void> deleteTransaction(@PathVariable("id")final Long id) {
        balanceService.deleteTransaction(id);
        return ResponseEntity.noContent().build();
    }

    private String getUsernameFromRequest(final HttpServletRequest request) {
        return request.getUserPrincipal().getName();
    }

}

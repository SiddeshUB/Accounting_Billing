package com.accounting.controller;

import com.accounting.service.LedgerService;   // <-- add this
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SetupController {

    private final LedgerService ledgerService;

    // constructor injection
    public SetupController(LedgerService ledgerService) {
        this.ledgerService = ledgerService;
    }

    @GetMapping({"/", "/dashboard"})
    public String dashboard(Model model) {
        model.addAttribute("entries", ledgerService.listAll());
        return "dashboard";
    }

}

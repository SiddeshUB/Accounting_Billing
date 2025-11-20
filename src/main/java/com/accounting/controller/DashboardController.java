package com.accounting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.accounting.model.Invoice;
import com.accounting.service.InvoiceService;

@Controller
public class DashboardController {

    @Autowired
    private InvoiceService invoiceService;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        List<Invoice> invoices = invoiceService.getAllInvoices();
        model.addAttribute("invoices", invoices);
        return "dashboard";   // dashboard.jsp
    }
}

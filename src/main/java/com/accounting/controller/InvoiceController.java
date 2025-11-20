package com.accounting.controller;

import com.accounting.model.Invoice;
import com.accounting.service.InvoiceService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class InvoiceController {

    private final InvoiceService invoiceService;

    public InvoiceController(InvoiceService invoiceService) {
        this.invoiceService = invoiceService;
    }

    // Show list of invoices
    @GetMapping("/invoices")
    public String listInvoices(Model model) {
        model.addAttribute("invoices", invoiceService.getAllInvoices());
        return "listInvoices";
    }

    // Show new invoice form
    @GetMapping("/invoice/new")
    public String newInvoice(Model model) {
        model.addAttribute("invoice", new Invoice());
        return "newInvoice";
    }

    // Save invoice
    @PostMapping("/invoice/save")
    public String saveInvoice(@ModelAttribute Invoice invoice) {
        invoiceService.saveInvoice(invoice);
        return "redirect:/invoices";
    }

    // Edit invoice
    @GetMapping("/invoice/edit/{id}")
    public String editInvoice(@PathVariable Long id, Model model) {
        Invoice invoice = invoiceService.getInvoiceById(id).orElse(null);
        model.addAttribute("invoice", invoice);
        return "editInvoice";
    }

    // Update invoice
    @PostMapping("/invoice/update")
    public String updateInvoice(@ModelAttribute Invoice invoice) {
        invoiceService.saveInvoice(invoice);
        return "redirect:/invoices";
    }

    // View single invoice
    @GetMapping("/invoice/view/{id}")
    public String viewInvoice(@PathVariable Long id, Model model) {
        Invoice invoice = invoiceService.getInvoiceById(id).orElse(null);
        model.addAttribute("invoice", invoice);
        return "viewInvoice";
    }

    // Delete invoice
    @GetMapping("/invoice/delete/{id}")
    public String deleteInvoice(@PathVariable Long id) {
        invoiceService.deleteInvoice(id);
        return "redirect:/invoices";
    }
}

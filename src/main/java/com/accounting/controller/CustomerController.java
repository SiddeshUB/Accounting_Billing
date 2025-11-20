package com.accounting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.accounting.model.Customer;
import com.accounting.service.CustomerService;

@Controller
@RequestMapping("/customers")
public class CustomerController {

    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping
    public String listCustomers(Model model) {
        System.out.println("➡ Loading customer list...");
        model.addAttribute("customers", customerService.getAllCustomers());
        return "customer-list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        System.out.println("➡ Opening Add Customer form...");
        model.addAttribute("customer", new Customer());
        return "customer-form";
    }

    @PostMapping("/save")
    public String saveCustomer(@ModelAttribute("customer") Customer customer) {
        System.out.println("➡ Saving customer: " + customer.getName());
        customerService.saveCustomer(customer);
        System.out.println("➡ Saved successfully! Redirecting...");
        return "redirect:/customers";
    }

    @GetMapping("/edit/{id}")
    public String editCustomer(@PathVariable Long id, Model model) {
        System.out.println("➡ Editing customer ID: " + id);
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("customer", customer);
        return "customer-form";
    }

    @GetMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable Long id) {
        System.out.println("➡ Deleting customer ID: " + id);
        customerService.deleteCustomer(id);
        return "redirect:/customers";
    }
}

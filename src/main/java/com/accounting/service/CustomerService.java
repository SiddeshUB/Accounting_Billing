package com.accounting.service;

import org.springframework.stereotype.Service;

import com.accounting.model.Customer;
import com.accounting.repository.CustomerRepository;

import java.util.List;

@Service
public class CustomerService {

    private final CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    // Save or update customer
    public Customer saveCustomer(Customer customer) {
        return customerRepository.save(customer);
    }

    // Get customer by id
    public Customer getCustomerById(Long id) {
        return customerRepository.findById(id).orElse(null);
    }

    // Get all customers
    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }

    // Delete customer
    public void deleteCustomer(Long id) {
        customerRepository.deleteById(id);
    }
}

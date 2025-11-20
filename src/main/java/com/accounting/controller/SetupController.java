package com.accounting.controller;

import com.accounting.model.PaymentVoucher;
import com.accounting.model.DiscountVoucher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SetupController {

	@GetMapping("/")
	public String dashboard() {
	    return "dashboard";
	}
}
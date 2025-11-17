package com.accounting.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import ch.qos.logback.core.model.Model;



@Controller
public class SetupController {
	
	@GetMapping("/")
	public  String setup(Model model) {
		return "/dashboard";
	}
}

package com.accounting.controller;

import com.accounting.model.DiscountVoucher;
import com.accounting.model.PaymentVoucher;
import com.accounting.service.DiscountVoucherService;
import com.accounting.service.PaymentVoucherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/vouchers")
public class VoucherController {

    private final PaymentVoucherService paymentService;
    private final DiscountVoucherService discountService;

    public VoucherController(PaymentVoucherService paymentService,
                             DiscountVoucherService discountService) {
        this.paymentService = paymentService;
        this.discountService = discountService;
    }

    // Payment voucher form page
    @GetMapping("/payment/new")
    public String showPaymentForm(Model model) {
        model.addAttribute("payment", new PaymentVoucher());
        model.addAttribute("payments", paymentService.listAll());
        return "payment-voucher"; // JSP name
    }

    @PostMapping("/payment")
    public String createPayment(@ModelAttribute PaymentVoucher payment) {
        paymentService.create(payment);
        return "redirect:/vouchers/payment/new";
    }

    // Discount voucher form page
 // inside com.accounting.controller.VoucherController

 // Discount voucher form
 @GetMapping("/discount/new")
 public String showDiscountForm(Model model) {
     model.addAttribute("discount", new DiscountVoucher());
     model.addAttribute("discounts", discountService.listAll());

     // <-- ADD THIS: load existing payment vouchers so user can link one
     model.addAttribute("payments", paymentService.listAll());

     return "discount-voucher";
 }


 @PostMapping("/discount")
 public String createDiscount(@ModelAttribute DiscountVoucher discount,
                              @RequestParam("paymentId") String paymentId,
                              Model model) {

     if (discountService.existsByCode(discount.getCode())) {
         model.addAttribute("error", "Voucher code already exists!");
         model.addAttribute("discount", discount);
         model.addAttribute("discounts", discountService.listAll());
         model.addAttribute("payments", paymentService.listAll());
         return "discount-voucher";
     }

     discount.setPaymentId(paymentId);
     discountService.create(discount);
     return "redirect:/vouchers/discount/new";
 }


}

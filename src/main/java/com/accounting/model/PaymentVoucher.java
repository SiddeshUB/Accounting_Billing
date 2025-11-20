package com.accounting.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "payment_voucher")
public class PaymentVoucher {

    @Id
    @Column(length = 36)
    private String id;

    @Column(unique = true, nullable = false)
    private String voucherNumber;

    @Column(nullable = false)
    private String payee;

    @Column(nullable = false)
    private double amount;

    @Column(nullable = false)
    private String paymentMethod;

    private String remarks;

    private LocalDate createdAt;

    public PaymentVoucher() {
        this.id = UUID.randomUUID().toString();
        this.createdAt = LocalDate.now();
    }

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getVoucherNumber() {
		return voucherNumber;
	}

	public void setVoucherNumber(String voucherNumber) {
		this.voucherNumber = voucherNumber;
	}

	public String getPayee() {
		return payee;
	}

	public void setPayee(String payee) {
		this.payee = payee;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public LocalDate getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDate createdAt) {
		this.createdAt = createdAt;
	}

    // getters / setters
    // (generate with IDE)
}

package com.accounting.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "discount_voucher")
public class DiscountVoucher {

    @Id
    @Column(length = 36)
    private String id;

    @Column(nullable = false, unique = true)
    private String code;

    @Column(nullable = false)
    private String type; // "PERCENTAGE" or "FIXED"

    @Column(nullable = false)
    private double value;

    private LocalDate validUntil;

    private boolean active = true;

    private LocalDate createdAt;
    private String paymentId;


    public DiscountVoucher() {
        this.id = UUID.randomUUID().toString();
        this.createdAt = LocalDate.now();
        
    }

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

	public LocalDate getValidUntil() {
		return validUntil;
	}

	public void setValidUntil(LocalDate validUntil) {
		this.validUntil = validUntil;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public LocalDate getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDate createdAt) {
		this.createdAt = createdAt;
	}

	public String getPaymentId() {
	    return paymentId;
	}

	public void setPaymentId(String paymentId) {
	    this.paymentId = paymentId;
	}

    // getters / setters
}

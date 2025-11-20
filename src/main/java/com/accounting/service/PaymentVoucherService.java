package com.accounting.service;

import com.accounting.model.PaymentVoucher;
import com.accounting.repository.PaymentVoucherRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class PaymentVoucherService {

    private final PaymentVoucherRepository repo;

    public PaymentVoucherService(PaymentVoucherRepository repo) {
        this.repo = repo;
    }

    public PaymentVoucher create(PaymentVoucher v) {
        // generate voucher number if not present
        if (v.getVoucherNumber() == null || v.getVoucherNumber().isBlank()) {
            String generated = "PV-" + System.currentTimeMillis();
            v.setVoucherNumber(generated);
        }
        return repo.save(v);
    }

    public List<PaymentVoucher> listAll() {
        return repo.findAll();
    }

    public Optional<PaymentVoucher> findById(String id) {
        return repo.findById(id);
    }
}

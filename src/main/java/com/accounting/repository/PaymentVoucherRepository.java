package com.accounting.repository;

import com.accounting.model.PaymentVoucher;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface PaymentVoucherRepository extends JpaRepository<PaymentVoucher, String> {
    Optional<PaymentVoucher> findByVoucherNumber(String voucherNumber);
}

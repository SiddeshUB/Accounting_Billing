package com.accounting.repository;

import com.accounting.model.DiscountVoucher;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface DiscountVoucherRepository extends JpaRepository<DiscountVoucher, String> {
    Optional<DiscountVoucher> findByCode(String code);
}

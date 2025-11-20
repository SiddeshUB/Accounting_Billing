package com.accounting.service;

import com.accounting.model.DiscountVoucher;
import com.accounting.repository.DiscountVoucherRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class DiscountVoucherService {

    private final DiscountVoucherRepository repo;

    public DiscountVoucherService(DiscountVoucherRepository repo) {
        this.repo = repo;
    }

    public DiscountVoucher create(DiscountVoucher v) {
        // ensure code uniqueness would be checked by DB - optionally check before save
        return repo.save(v);
    }

    public List<DiscountVoucher> listAll() {
        return repo.findAll();
    }

    public Optional<DiscountVoucher> findByCode(String code) {
        return repo.findByCode(code);
    }

	public boolean existsByCode(String code) {
		// TODO Auto-generated method stub
		return false;
	}
}

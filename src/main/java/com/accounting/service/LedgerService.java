// src/main/java/com/accounting/service/LedgerService.java
package com.accounting.service;

import com.accounting.model.LedgerEntry;
import com.accounting.repository.LedgerEntryRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
public class LedgerService {

    private final LedgerEntryRepository repository;

    public LedgerService(LedgerEntryRepository repository) {
        this.repository = repository;
    }

    public List<LedgerEntry> listAll() {
        // You can also order by date here if you want
        return repository.findAll();
    }

    public List<LedgerEntry> listByAccount(String accountName) {
        return repository.findByAccountNameOrderByEntryDateAscIdAsc(accountName);
    }

    @Transactional
    public LedgerEntry create(LedgerEntry entry) {
        if (entry.getDebitAmount() == null) {
            entry.setDebitAmount(BigDecimal.ZERO);
        }
        if (entry.getCreditAmount() == null) {
            entry.setCreditAmount(BigDecimal.ZERO);
        }

        // Tally-like: running balance per account = previous + debit - credit
        BigDecimal previousBalance = repository
                .findTopByAccountNameOrderByEntryDateDescIdDesc(entry.getAccountName())
                .map(LedgerEntry::getBalance)
                .orElse(BigDecimal.ZERO);

        BigDecimal newBalance = previousBalance
                .add(entry.getDebitAmount())
                .subtract(entry.getCreditAmount());

        entry.setBalance(newBalance);

        return repository.save(entry);
    }

	public void save(LedgerEntry e) {
		// TODO Auto-generated method stub
		
	}
}

// src/main/java/com/accounting/repository/LedgerEntryRepository.java
package com.accounting.repository;

import com.accounting.model.LedgerEntry;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface LedgerEntryRepository extends JpaRepository<LedgerEntry, Long> {

    // All entries for one account ordered by date & id
    List<LedgerEntry> findByAccountNameOrderByEntryDateAscIdAsc(String accountName);

    // Last entry for an account (to compute running balance)
    Optional<LedgerEntry> findTopByAccountNameOrderByEntryDateDescIdDesc(String accountName);
}

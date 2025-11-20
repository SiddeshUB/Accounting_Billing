package com.accounting.repository;

import com.accounting.model.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;
import java.time.LocalDate;
import java.util.List;

public interface InvoiceRepository extends JpaRepository<Invoice, Long> {

    List<Invoice> findByCustomer(String customer);

    List<Invoice> findByInvoiceDateBetween(LocalDate startDate, LocalDate endDate);

}

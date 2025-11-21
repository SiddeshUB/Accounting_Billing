// src/main/java/com/accounting/model/LedgerEntry.java
package com.accounting.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "ledger_entries")
public class LedgerEntry {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate entryDate;

    // e.g., CASH, BANK, SUNDRY_DEBTORS, etc.
    @Column(length = 100)
    private String accountName;

    // Receipt / Payment / Contra / Journal / Sales / Purchase
    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private VoucherType voucherType;

    // Cash / Bank
    @Enumerated(EnumType.STRING)
    @Column(length = 10)
    private InstrumentType instrumentType;

    // Banking details (optional)
    @Column(length = 100)
    private String bankName;

    @Column(length = 100)
    private String branch;

    @Column(length = 50)
    private String instrumentNumber; // Cheque no / UTR / Ref no

    @Column(precision = 15, scale = 2)
    private BigDecimal debitAmount = BigDecimal.ZERO;

    @Column(precision = 15, scale = 2)
    private BigDecimal creditAmount = BigDecimal.ZERO;

    // Running balance for this account (after this entry)
    @Column(precision = 15, scale = 2)
    private BigDecimal balance = BigDecimal.ZERO;

    @Column(length = 255)
    private String narration;

    public enum VoucherType {
        RECEIPT, PAYMENT, CONTRA, JOURNAL, SALES, PURCHASE
    }

    public enum InstrumentType {
        CASH, BANK
    }

    // Getters & setters …

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(LocalDate entryDate) {
        this.entryDate = entryDate;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public VoucherType getVoucherType() {
        return voucherType;
    }

    public void setVoucherType(VoucherType voucherType) {
        this.voucherType = voucherType;
    }

    public InstrumentType getInstrumentType() {
        return instrumentType;
    }

    public void setInstrumentType(InstrumentType instrumentType) {
        this.instrumentType = instrumentType;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getInstrumentNumber() {
        return instrumentNumber;
    }

    public void setInstrumentNumber(String instrumentNumber) {
        this.instrumentNumber = instrumentNumber;
    }

    public BigDecimal getDebitAmount() {
        return debitAmount;
    }

    public void setDebitAmount(BigDecimal debitAmount) {
        this.debitAmount = debitAmount;
    }

    public BigDecimal getCreditAmount() {
        return creditAmount;
    }

    public void setCreditAmount(BigDecimal creditAmount) {
        this.creditAmount = creditAmount;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public String getNarration() {
        return narration;
    }

    public void setNarration(String narration) {
        this.narration = narration;
    }
}

//// src/main/java/com/accounting/controller/LedgerController.java
//package com.accounting.controller;
//
//import com.accounting.model.LedgerEntry;
//import com.accounting.model.LedgerEntry.InstrumentType;
//import com.accounting.model.LedgerEntry.VoucherType;
//import com.accounting.service.LedgerService;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//@Controller
//@RequestMapping("/ledger")
//public class LedgerController {
//
//    private final LedgerService service;
//
//    public LedgerController(LedgerService service) {
//        this.service = service;
//    }
//
//    // List page – your main ledger section (table)
//    @GetMapping
//    public String list(Model model) {
//        model.addAttribute("entries", service.listAll());
//        return "ledger"; // /WEB-INF/views/ledger.jsp
//    }
//
//    // Form page – for iframe "Create Ledger Entry"
//    @GetMapping("/new")
//    public String showForm(Model model) {
//        LedgerEntry entry = new LedgerEntry();
//        model.addAttribute("entry", entry);
//        model.addAttribute("voucherTypes", VoucherType.values());
//        model.addAttribute("instrumentTypes", InstrumentType.values());
//        return "ledger-form"; // /WEB-INF/views/ledger-form.jsp
//    }
//
//    // Handle save
//    @PostMapping
//    public String create(
//            @RequestParam("entryDate") String entryDate,
//            @RequestParam("accountName") String accountName,
//            @RequestParam("voucherType") VoucherType voucherType,
//            @RequestParam("instrumentType") InstrumentType instrumentType,
//            @RequestParam(value = "bankName", required = false) String bankName,
//            @RequestParam(value = "branch", required = false) String branch,
//            @RequestParam(value = "instrumentNumber", required = false) String instrumentNumber,
//            @RequestParam(value = "debitAmount", required = false, defaultValue = "0") java.math.BigDecimal debitAmount,
//            @RequestParam(value = "creditAmount", required = false, defaultValue = "0") java.math.BigDecimal creditAmount,
//            @RequestParam(value = "narration", required = false) String narration
//    ) {
//        LedgerEntry entry = new LedgerEntry();
//        entry.setEntryDate(java.time.LocalDate.parse(entryDate));
//        entry.setAccountName(accountName);
//        entry.setVoucherType(voucherType);
//        entry.setInstrumentType(instrumentType);
//        entry.setBankName(bankName);
//        entry.setBranch(branch);
//        entry.setInstrumentNumber(instrumentNumber);
//        entry.setDebitAmount(debitAmount);
//        entry.setCreditAmount(creditAmount);
//        entry.setNarration(narration);
//
//        service.create(entry);
//
//        // Important: this redirect loads the ledger list again
//        return "redirect:/ledger";
//    }
//}
// src/main/java/com/accounting/controller/LedgerController.java
package com.accounting.controller;

import com.accounting.model.LedgerEntry;
import com.accounting.model.LedgerEntry.VoucherType;
import com.accounting.service.LedgerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/ledger")
public class LedgerController {

    private final LedgerService ledgerService;

    public LedgerController(LedgerService ledgerService) {
        this.ledgerService = ledgerService;
    }

    // LIST PAGE -> your ledger.jsp above
    @GetMapping
    public String list(Model model) {
        model.addAttribute("entries", ledgerService.listAll());
        return "ledger"; // -> /WEB-INF/views/ledger.jsp
    }

    // FORM PAGE (used by iframe)
    @GetMapping("/new")
    public String showForm(Model model) {
        model.addAttribute("voucherTypes", VoucherType.values());
        return "ledger-form"; // you must have ledger-form.jsp
    }

    // SAVE (called from ledger-form.jsp)
    @PostMapping
    public String create(
            @RequestParam("entryDate") String entryDate,
            @RequestParam("accountName") String accountName,
            @RequestParam("voucherType") VoucherType voucherType,
            @RequestParam(value = "debitAmount", defaultValue = "0") java.math.BigDecimal debitAmount,
            @RequestParam(value = "creditAmount", defaultValue = "0") java.math.BigDecimal creditAmount,
            @RequestParam(value = "narration", required = false) String narration
    ) {
        LedgerEntry e = new LedgerEntry();
        e.setEntryDate(java.time.LocalDate.parse(entryDate));
        e.setAccountName(accountName);
        e.setVoucherType(voucherType);
        e.setDebitAmount(debitAmount);
        e.setCreditAmount(creditAmount);
        e.setBalance(debitAmount.subtract(creditAmount)); // or your running logic
        e.setNarration(narration);

        ledgerService.save(e);
        return "redirect:/ledger";
    }
}


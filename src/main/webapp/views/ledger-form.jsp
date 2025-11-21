<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Ledger Entry</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 1rem; }
        .form-group { margin-bottom: .75rem; }
        .form-label { display:block; margin-bottom:.25rem; font-weight:bold; }
        .form-control, select, textarea {
            width:100%;
            padding:.4rem;
            border:1px solid #d0d0d0;
            border-radius:4px;
        }
        .btn { padding:.5rem 1rem; border:none; border-radius:4px; cursor:pointer; margin-right:.5rem; }
        .row { display:flex; gap:1rem; }
        .col-6 { flex:1; }
        .bank-section { border:1px dashed #d0d0d0; padding:.75rem; margin-top:.5rem; }
    </style>
    <script>
        function toggleBankSection() {
            const select = document.getElementById("instrumentType");
            const bankSection = document.getElementById("bankSection");
            if (select.value === "BANK") {
                bankSection.style.display = "block";
            } else {
                bankSection.style.display = "none";
            }
        }

        // call parent function to go back to list
        function cancelAndBack() {
            if (parent && parent.closeLedgerFormAndReload) {
                parent.closeLedgerFormAndReload();
            } else {
                window.location.href = "${pageContext.request.contextPath}/ledger";
            }
        }
    </script>
</head>
<body onload="toggleBankSection()">

<h2>Create Ledger Entry</h2>

<form method="post" action="${pageContext.request.contextPath}/ledger" target="_parent">
    <div class="row">
        <div class="form-group col-6">
            <label class="form-label">Date</label>
            <input type="date" name="entryDate" class="form-control"
       value="<%= java.time.LocalDate.now() %>" required>

        </div>

        <div class="form-group col-6">
            <label class="form-label">Voucher Type</label>
            <select name="voucherType" class="form-control">
                <c:forEach var="vt" items="${voucherTypes}">
                    <option value="${vt}">${vt}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="form-label">Account (Ledger)</label>
        <input type="text" name="accountName" class="form-control"
               placeholder="Cash, Bank A/C, Debtor, etc." required>
    </div>

    <div class="form-group">
        <label class="form-label">Instrument Type</label>
        <select name="instrumentType" id="instrumentType"
                class="form-control" onchange="toggleBankSection()">
            <c:forEach var="it" items="${instrumentTypes}">
                <option value="${it}">${it}</option>
            </c:forEach>
        </select>
    </div>

    <div id="bankSection" class="bank-section" style="display:none;">
        <div class="form-group">
            <label class="form-label">Bank Name</label>
            <input type="text" name="bankName" class="form-control"
                   placeholder="Bank name">
        </div>
        <div class="form-group">
            <label class="form-label">Branch</label>
            <input type="text" name="branch" class="form-control"
                   placeholder="Branch name">
        </div>
        <div class="form-group">
            <label class="form-label">Instrument No (Cheque / UTR / Ref)</label>
            <input type="text" name="instrumentNumber" class="form-control"
                   placeholder="Cheque number / UTR / Ref no">
        </div>
    </div>

    <div class="row">
        <div class="form-group col-6">
            <label class="form-label">Debit Amount</label>
            <input type="number" step="0.01" name="debitAmount" class="form-control"
                   placeholder="0.00">
        </div>
        <div class="form-group col-6">
            <label class="form-label">Credit Amount</label>
            <input type="number" step="0.01" name="creditAmount" class="form-control"
                   placeholder="0.00">
        </div>
    </div>

    <div class="form-group">
        <label class="form-label">Narration</label>
        <textarea name="narration" rows="3" class="form-control"
                  placeholder="Short description of transaction"></textarea>
    </div>

    <button type="submit" class="btn">Save</button>
    <button type="button" class="btn" onclick="cancelAndBack()">Cancel</button>
</form>

</body>
</html>

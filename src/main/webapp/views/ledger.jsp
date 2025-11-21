<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>General Ledger</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />

    <style>
        .content-section { padding: 1rem; }
        .section-title { font-size: 1.5rem; margin-bottom: 1rem; }
        .btn { padding: .5rem 1rem; cursor:pointer; border:none; border-radius:4px; }
        .data-table { width:100%; border-collapse:collapse; margin-top:1rem; }
        .data-table th, .data-table td { border:1px solid #d0d0d0; padding:.5rem; text-align:left; }
        .ledger-form-frame {
            width: 100%;
            height: 480px;
            border: 1px solid #d0d0d0;
            margin-top: 1rem;
            display: none; /* hidden initially */
        }
    </style>

    <script>
        function openLedgerForm() {
            const listDiv = document.getElementById("ledgerList");
            const frame = document.getElementById("ledgerFormFrame");
            frame.src = "${pageContext.request.contextPath}/ledger/new";
            frame.style.display = "block";
            listDiv.style.display = "none";
        }

        // used by child iframe to come back to list
        function closeLedgerFormAndReload() {
            window.location.href = "${pageContext.request.contextPath}/ledger";
        }
    </script>
</head>
<body>

<!-- Ledger Section (table + iframe for new) -->
<div id="ledger" class="content-section">
    <div id="ledgerList">
        <h2 class="section-title">General Ledger</h2>
        <button class="btn" type="button" onclick="openLedgerForm()">Create Ledger Entry</button>

        <table class="data-table">
            <thead>
            <tr>
                <th>Date</th>
                <th>Voucher Type</th>
                <th>Account</th>
                <th>Debit</th>
                <th>Credit</th>
                <th>Balance</th>
                <th>Narration</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="e" items="${entries}">
                <tr>
                    <td><c:out value="${e.entryDate}"/></td>
                    <td><c:out value="${e.voucherType}"/></td>
                    <td><c:out value="${e.accountName}"/></td>
                    <td><c:out value="${e.debitAmount}"/></td>
                    <td><c:out value="${e.creditAmount}"/></td>
                    <td><c:out value="${e.balance}"/></td>
                    <td><c:out value="${e.narration}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <iframe id="ledgerFormFrame" class="ledger-form-frame"></iframe>
</div>

</body>
</html>

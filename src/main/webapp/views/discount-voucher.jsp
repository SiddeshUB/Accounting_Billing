<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Discount Voucher</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    html, body {
      margin:0;
      padding:0;
      background: #fff;
      width: 100vw;
      min-width: 0;
      max-width: 100vw;
      height: 100vh;
      overflow-x: hidden;
    }
    .header { display:none; }
    .side-menu { display: none !important; }
    .content {
      margin: 0 !important;
      padding: 2rem !important;
      min-height: initial;
      background: #fff;
    }
    .section-title {
      font-size: 1.5rem;
      margin-bottom: 1.5rem;
      color: #1976d2;
      border-bottom: 2px solid #e3f2fd;
      padding-bottom: .5rem;
    }
    .form-group { margin-bottom:1.25rem; }
    .form-label { display:block; margin-bottom:.5rem; font-weight:500; }
    .form-control {
      width:100%; padding:.75rem; border:1px solid #e0e0e0;
      border-radius:4px; font-size:1rem;
    }
    .btn {
      padding:.75rem 1.5rem;
      background:#1976d2;
      color:#fff;
      border:none;
      border-radius:4px;
      cursor:pointer;
      font-size:1rem;
      margin-bottom: 1rem;
    }
    .btn:hover { background:#0d47a1; }
    .data-table {
      width:100%;
      border-collapse:collapse;
      margin-top:1rem;
    }
    .data-table th,.data-table td{
      padding:.75rem 1rem;text-align:left;
      border-bottom:1px solid #e0e0e0;
    }
    .data-table th{
      background:#e3f2fd;
      color:#1976d2;
      font-weight:600;
    }
    .info-row{display:flex;gap:1rem;align-items:center;margin-top:.5rem}
    .info-box{background:#fafafa;padding:.75rem 1rem;border:1px solid #e0e0e0;border-radius:6px}
    .close-btn {
      display: inline-block;
      padding: 6px 18px;
      background: #e0e0e0;
      color: #333;
      border: none;
      border-radius: 4px;
      margin-bottom: 1.25rem;
      cursor: pointer;
      float: right;
    }
    @media(max-width:700px){
      .content { padding: 0.75rem !important; }
      .data-table th, .data-table td { font-size:0.89em; }
      .section-title {font-size:1.15rem;}
      .info-row { flex-direction:column; gap:0.3rem;}
    }
  </style>
</head>
<body>
  <div class="content">
    <button class="close-btn" type="button" onclick="if(parent && parent.closeVoucherForm) parent.closeVoucherForm();">&times; Close</button>
    <h2 class="section-title">Discount Voucher</h2>

    <form id="discountForm" action="${pageContext.request.contextPath}/vouchers/discount" method="post">
      <div class="form-group">
        <label class="form-label">Link Payment Voucher</label>
        <select id="paymentSelect" name="paymentId" class="form-control" required>
          <option value="">-- Select payment voucher --</option>
          <c:forEach items="${payments}" var="p">
            <option value="${p.id}" data-amount="${p.amount}">${p.voucherNumber} — ${p.payee} — ₹${p.amount}</option>
          </c:forEach>
        </select>
      </div>

      <div class="info-row">
        <div>
          <label class="form-label">Payment Amount</label>
          <div id="paymentAmount" class="info-box">₹0.00</div>
        </div>
        <div>
          <label class="form-label">Discount Type</label>
          <select id="discountType" name="type" class="form-control">
            <option value="PERCENTAGE">Percentage</option>
            <option value="FIXED">Fixed Amount</option>
          </select>
        </div>
        <div>
          <label class="form-label">Discount Value</label>
          <input id="discountValue" name="value" type="number" step="0.01" min="0" class="form-control" value="0"/>
        </div>
      </div>

      <div class="info-row" style="margin-top:1rem;">
        <div>
          <label class="form-label">Calculated Discount</label>
          <div id="calculatedDiscount" class="info-box">₹0.00</div>
        </div>
        <div>
          <label class="form-label">Final Amount after Discount</label>
          <div id="finalAmount" class="info-box">₹0.00</div>
        </div>
      </div>

      <div style="margin-top:1rem;" class="form-group">
        <label class="form-label">Voucher Code</label>
        <input name="code" class="form-control" value="${discount.code}" placeholder="Enter voucher code" required />
      </div>

      <div class="form-group">
        <label class="form-label">Valid Until</label>
        <input name="validUntil" type="date" class="form-control" value="${discount.validUntil}" />
      </div>

      <div style="margin-top:1rem;">
        <button type="submit" class="btn">Create Voucher</button>
      </div>
    </form>

    <h3 style="margin-top:2rem">Existing Discount Vouchers</h3>
    <table class="data-table">
      <thead><tr><th>Code</th><th>Type</th><th>Value</th><th>Valid Until</th><th>Active</th><th>Linked Payment</th></tr></thead>
      <tbody>
        <c:forEach items="${discounts}" var="d">
          <tr>
            <td><c:out value="${d.code}"/></td>
            <td><c:out value="${d.type}"/></td>
            <td><c:out value="${d.value}"/></td>
            <td><c:out value="${d.validUntil}"/></td>
            <td><c:out value="${d.active}"/></td>
            <td>
              <c:out value="${d.paymentId != null ? d.paymentId : ''}" />
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty discounts}">
          <tr><td colspan="6" style="text-align:center;color:#666">No discount vouchers yet.</td></tr>
        </c:if>
      </tbody>
    </table>
  </div>
  <script>
    // format number as currency string with two decimals
    function formatCurrency(amount) {
      return '₹' + Number(amount || 0).toFixed(2);
    }
    function parseNumber(v) {
      const n = Number(v);
      return Number.isFinite(n) ? n : 0;
    }
    (function () {
      const paymentSelect = document.getElementById('paymentSelect');
      const paymentAmountBox = document.getElementById('paymentAmount');
      const discountTypeEl = document.getElementById('discountType');
      const discountValueEl = document.getElementById('discountValue');
      const calculatedDiscountEl = document.getElementById('calculatedDiscount');
      const finalAmountEl = document.getElementById('finalAmount');

      function updateAmounts() {
        const selectedOption = paymentSelect.selectedOptions[0];
        const originalAmount = selectedOption ? parseNumber(selectedOption.getAttribute('data-amount')) : 0;
        paymentAmountBox.textContent = formatCurrency(originalAmount);

        const discountType = discountTypeEl.value;
        const discountValue = parseNumber(discountValueEl.value);

        let discountAmt = 0;
        if (discountType === 'PERCENTAGE') {
          const pct = Math.max(0, Math.min(100, discountValue));
          discountAmt = (originalAmount * pct) / 100;
        } else {
          discountAmt = Math.max(0, Math.min(originalAmount, discountValue));
        }

        const finalAmt = Math.max(0, originalAmount - discountAmt);

        calculatedDiscountEl.textContent = formatCurrency(discountAmt);
        finalAmountEl.textContent = formatCurrency(finalAmt);
      }

      paymentSelect.addEventListener('change', updateAmounts);
      discountTypeEl.addEventListener('change', updateAmounts);
      discountValueEl.addEventListener('input', updateAmounts);
      updateAmounts();
    })();
  </script>
</body>
</html>
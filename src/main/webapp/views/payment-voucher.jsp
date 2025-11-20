<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Payment Voucher</title>
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
      .data-table th, .data-table td { font-size:0.92em; }
      .section-title {font-size:1.15rem;}
    }
  </style>
</head>
<body>
  <div class="content">
    <button class="close-btn" type="button" onclick="if(parent && parent.closeVoucherForm) parent.closeVoucherForm();">&times; Close</button>

    <h2 class="section-title">Payment Voucher</h2>

    <form action="${pageContext.request.contextPath}/vouchers/payment" method="post">
      <div class="form-group">
        <label class="form-label">Voucher Number</label>
        <input name="voucherNumber" class="form-control" value="${payment.voucherNumber}" />
      </div>

      <div class="form-group">
        <label class="form-label">Payee</label>
        <input name="payee" class="form-control" value="${payment.payee}" placeholder="Enter payee name" />
      </div>

      <div class="form-group">
        <label class="form-label">Amount (₹)</label>
        <input name="amount" type="number" step="0.01" class="form-control" value="${payment.amount}" placeholder="Enter amount" />
      </div>

      <div class="form-group">
        <label class="form-label">Payment Method</label>
        <select name="paymentMethod" class="form-control">
          <option value="Cash" <c:if test="${payment.paymentMethod == 'Cash'}">selected</c:if>>Cash</option>
          <option value="Bank Transfer" <c:if test="${payment.paymentMethod == 'Bank Transfer'}">selected</c:if>>Bank Transfer</option>
          <option value="Check" <c:if test="${payment.paymentMethod == 'Check'}">selected</c:if>>Check</option>
        </select>
      </div>

      <div class="form-group">
        <label class="form-label">Remarks</label>
        <input name="remarks" class="form-control" value="${payment.remarks}" />
      </div>

      <button type="submit" class="btn">Create Voucher</button>
    </form>

    <h3 style="margin-top:2rem">Existing Vouchers</h3>

    <table class="data-table">
      <thead>
        <tr>
          <th>Voucher#</th>
          <th>Payee</th>
          <th>Amount (₹)</th>
          <th>Method</th>
          <th>Date</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${payments}" var="p">
          <tr>
            <td><c:out value="${p.voucherNumber}"/></td>
            <td><c:out value="${p.payee}"/></td>
            <td>₹<c:out value="${p.amount}"/></td>
            <td><c:out value="${p.paymentMethod}"/></td>
            <td><c:out value="${p.createdAt}"/></td>
          </tr>
        </c:forEach>

        <c:if test="${empty payments}">
          <tr><td colspan="5" style="text-align:center;color:#666">No payment vouchers yet.</td></tr>
        </c:if>
      </tbody>
    </table>

  </div>
</body>
</html>

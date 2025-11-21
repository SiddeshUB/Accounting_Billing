<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accounting System</title>
    <style>
        :root {
            --primary-blue: #1976d2;
            --light-blue: #e3f2fd;
            --dark-blue: #0d47a1;
            --light-gray: #f5f5f5;
            --medium-gray: #e0e0e0;
            --dark-gray: #424242;
            --white: #ffffff;
        }
        * { margin:0; padding:0; box-sizing:border-box; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { background-color: var(--light-gray); color: var(--dark-gray); min-height:100vh; }
        .header {
            background-color: var(--primary-blue);
            color: var(--white);
            padding: 1rem 2rem;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 70px;
            display: flex;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            z-index: 1000;
        }
        .header h1 { font-size:1.8rem; font-weight: 600; }
        .side-menu {
            width: 250px;
            background-color: var(--white);
            box-shadow: 2px 0 5px rgba(0,0,0,0.05);
            padding-top: 90px;
            height: 100vh;
            position: fixed;
            overflow-y: auto;
            z-index: 900;
        }
        .menu-item {
            padding: 1rem 1.5rem;
            cursor: pointer;
            transition: all 0.3s ease;
            border-bottom: 1px solid var(--medium-gray);
            display: flex;
            align-items: center;
        }
        .menu-item:hover, .menu-item.active {
            background-color: var(--light-blue);
            color: var(--primary-blue);
        }
        .menu-item.active { border-left: 4px solid var(--primary-blue); }
        .menu-item i { margin-right: 10px; font-size: 1.2rem; }
        .content {
            margin-left: 250px;
            margin-top: 70px;
            padding: 2rem;
            min-height: calc(100vh - 70px);
            background: var(--light-gray);
        }
        .content-section {
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 2rem;
            display: none;
        }
        .content-section.active {
            display: block;
            animation: fadeIn 0.5s ease;
        }
        @keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
        .section-title {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            color: var(--primary-blue);
            border-bottom: 2px solid var(--light-blue);
            padding-bottom: 0.5rem;
        }
        .dashboard-stats {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        .stat-card {
            background-color: var(--light-blue);
            border-radius: 8px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        .stat-value {
            font-size: 2rem;
            font-weight: bold;
            color: var(--primary-blue);
            margin: 0.5rem 0;
        }
        .stat-label { color: var(--dark-gray); font-size: 0.9rem; }
        .data-table { width: 100%; border-collapse: collapse; margin-top: 1rem; }
        .data-table th, .data-table td {
            padding: 0.75rem 1rem;
            text-align: left;
            border-bottom: 1px solid var(--medium-gray);
        }
        .data-table th {
            background-color: var(--light-blue);
            color: var(--primary-blue);
            font-weight: 600;
        }
        .data-table tr:hover { background-color: var(--light-gray); }
        .form-group { margin-bottom: 1.5rem; }
        .form-label { display: block; margin-bottom: 0.5rem; font-weight: 500; }
        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
            font-size: 1rem;
        }
        .btn {
            padding: 0.75rem 1.5rem;
            background-color: var(--primary-blue);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s;
        }
        .btn:hover { background-color: var(--dark-blue); }

        /* Iframe styling for forms */
        .voucher-form-frame, .discount-form-frame {
            display: none;
            width: 100%;
            min-height: 700px;
            height: calc(100vh - 120px);
            border: none;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.10);
            margin-bottom: 2rem;
        }

        /* Ledger Iframe (for consistency) */
        .ledger-form-frame {
            display: none;
            width: 100%;
            min-height: 700px;
            height: calc(100vh - 120px);
            border: none;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.10);
            margin-bottom: 2rem;
        }

        @media (max-width:900px) {
            .side-menu { display:none; }
            .content { margin-left:0; padding:1rem;}
        }
        @media(max-width: 700px){
            .voucher-form-frame, .discount-form-frame, .ledger-form-frame {
              min-height:320px;
              height: calc(100vh - 80px);
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h1>Accounting</h1>
    </div>

    <!-- Side Menu -->
    <div class="side-menu">
        <div class="menu-item active" data-target="dashboard"><i>📊</i> Dashboard</div>
        <!-- Ledger uses data-target like before (no custom onclick) -->
        <div class="menu-item" data-target="ledger"><i>📒</i> Ledger</div>
        <div class="menu-item" data-target="invoices"><i>🧾</i> Invoices</div>
        <div class="menu-item" data-target="customers"><i>👥</i> Customers</div>
        <div class="menu-item" data-target="reports"><i>📈</i> Reports</div>
        <div class="menu-item" onclick="openPaymentVoucherForm()"><i>💳</i> Payment Voucher</div>
        <div class="menu-item" onclick="openDiscountVoucherForm()"><i>🎫</i> Discount Voucher</div>
        <div class="menu-item" data-target="settings"><i>⚙️</i> Settings</div>
        <div class="menu-item" data-target="logout"><i>🚪</i> Logout</div>
    </div>

    <!-- Content Area -->
    <div class="content">
        <!-- Dashboard Section -->
        <div id="dashboard" class="content-section active">
            <h2 class="section-title">Dashboard</h2>
            <div class="dashboard-stats">
                <div class="stat-card"><div class="stat-value">$12,450</div><div class="stat-label">Total Revenue</div></div>
                <div class="stat-card"><div class="stat-value">$8,230</div><div class="stat-label">Total Expenses</div></div>
                <div class="stat-card"><div class="stat-value">$4,220</div><div class="stat-label">Net Profit</div></div>
                <div class="stat-card"><div class="stat-value">24</div><div class="stat-label">Pending Invoices</div></div>
            </div>
            <div class="dashboard-actions" style="margin-bottom:2rem;">
                <button class="btn" type="button" onclick="openPaymentVoucherForm()">Create Payment Voucher</button>
                <button class="btn" type="button" onclick="openDiscountVoucherForm()">Create Discount Voucher</button>
            </div>
            <h3>Recent Transactions</h3>
            <table class="data-table">
                <thead>
                <tr>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Amount</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>2023-10-15</td>
                    <td>Invoice #INV-001</td>
                    <td>$1,200.00</td>
                    <td>Paid</td>
                </tr>
                <tr>
                    <td>2023-10-14</td>
                    <td>Office Supplies</td>
                    <td>$350.50</td>
                    <td>Pending</td>
                </tr>
                <tr>
                    <td>2023-10-12</td>
                    <td>Consulting Fee</td>
                    <td>$2,500.00</td>
                    <td>Paid</td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- Payment Voucher Section (list/table visible by default, form in iframe toggled) -->
        <div id="paymentVoucherList" style="display:none;">
            <h2 class="section-title">Payment Vouchers</h2>
            <button class="btn" type="button" onclick="openPaymentVoucherForm()">Create Payment Voucher</button>
            <!-- your payment voucher table/list here if needed -->
        </div>
        <iframe id="paymentVoucherFormFrame" class="voucher-form-frame"></iframe>

        <!-- Discount Voucher Section (list/table visible by default, form in iframe toggled) -->
        <div id="discountVoucherList" style="display:none;">
            <h2 class="section-title">Discount Vouchers</h2>
            <button class="btn" type="button" onclick="openDiscountVoucherForm()">Create Discount Voucher</button>
            <!-- your discount voucher table/list here if needed -->
        </div>
        <iframe id="discountVoucherFormFrame" class="discount-form-frame"></iframe>

        <!-- Ledger Section (table + iframe for new) -->
        <div id="ledger" class="content-section">
            <div id="ledgerList">
                <h2 class="section-title">General Ledger</h2>
                <button class="btn" type="button" onclick="openLedgerForm()">Create Ledger Entry</button>

                <table class="data-table">
                    <thead>
                    <tr>
                        <th>Date</th>
                        <th>Voucher</th>
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

        <!-- Invoices Section -->
        <div id="invoices" class="content-section">
            <h2 class="section-title">Invoices</h2>
            <div style="margin-bottom: 1rem;">
                <button class="btn">Create New Invoice</button>
            </div>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Invoice #</th>
                        <th>Customer</th>
                        <th>Date</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>INV-001</td>
                        <td>ABC Company</td>
                        <td>2023-10-15</td>
                        <td>$1,200.00</td>
                        <td>Paid</td>
                        <td>
                            <button class="btn" style="padding: 0.3rem 0.7rem; font-size: 0.8rem;">View</button>
                        </td>
                    </tr>
                    <tr>
                        <td>INV-002</td>
                        <td>XYZ Corp</td>
                        <td>2023-10-14</td>
                        <td>$850.50</td>
                        <td>Pending</td>
                        <td>
                            <button class="btn" style="padding: 0.3rem 0.7rem; font-size: 0.8rem;">View</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Customers Section -->
        <div id="customers" class="content-section">
            <h2 class="section-title">Customers</h2>
            <table class="data-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Balance</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>CUST-001</td>
                    <td>ABC Company</td>
                    <td>contact@abccompany.com</td>
                    <td>(555) 123-4567</td>
                    <td>$0.00</td>
                </tr>
                <tr>
                    <td>CUST-002</td>
                    <td>XYZ Corp</td>
                    <td>info@xyzcorp.com</td>
                    <td>(555) 987-6543</td>
                    <td>$850.50</td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- Reports Section -->
        <div id="reports" class="content-section">
            <h2 class="section-title">Reports</h2>
            <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 1rem;">
                <div class="stat-card" style="cursor: pointer;">
                    <div class="stat-label">Profit & Loss</div>
                </div>
                <div class="stat-card" style="cursor: pointer;">
                    <div class="stat-label">Balance Sheet</div>
                </div>
                <div class="stat-card" style="cursor: pointer;">
                    <div class="stat-label">Cash Flow</div>
                </div>
                <div class="stat-card" style="cursor: pointer;">
                    <div class="stat-label">Tax Report</div>
                </div>
            </div>
        </div>

        <!-- Settings Section -->
        <div id="settings" class="content-section">
            <h2 class="section-title">Settings</h2>
            <form>
                <div class="form-group">
                    <label class="form-label">Company Name</label>
                    <input type="text" class="form-control" value="My Accounting Company">
                </div>
                <div class="form-group">
                    <label class="form-label">Currency</label>
                    <select class="form-control">
                        <option>USD ($)</option>
                        <option>EUR (€)</option>
                        <option>GBP (£)</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Fiscal Year Start</label>
                    <input type="date" class="form-control" value="2023-01-01">
                </div>
                <button type="submit" class="btn">Save Settings</button>
            </form>
        </div>

        <!-- Logout Section -->
        <div id="logout" class="content-section">
            <h2 class="section-title">Logout</h2>
            <div style="text-align: center; padding: 3rem;">
                <h3>Are you sure you want to logout?</h3>
                <p>You will be redirected to the login page.</p>
                <button class="btn" style="margin-top: 1.5rem;">Confirm Logout</button>
            </div>
        </div>
    </div>

    <footer>
        <small>&copy; <c:out value="${pageContext.request.serverName}"/> Accounting App</small>
    </footer>

    <script>
        // Menu navigation functionality (original pattern)
        document.addEventListener('DOMContentLoaded', function() {
            const menuItems = document.querySelectorAll('.side-menu .menu-item');
            const contentSections = document.querySelectorAll('.content-section');

            menuItems.forEach(item => {
                item.addEventListener('click', function() {
                    // Skip items that use custom onclick logic (payment, discount)
                    if (item.getAttribute("onclick")) return;

                    menuItems.forEach(mi => mi.classList.remove('active'));
                    this.classList.add('active');
                    contentSections.forEach(section => section.classList.remove('active'));
                    const targetId = this.getAttribute('data-target');
                    if (targetId) {
                        document.getElementById(targetId).classList.add('active');
                        // Hide all voucher/ledger iframes and reset lists
                        document.getElementById("paymentVoucherFormFrame").style.display = "none";
                        document.getElementById("paymentVoucherList").style.display = "none";
                        document.getElementById("discountVoucherFormFrame").style.display = "none";
                        document.getElementById("discountVoucherList").style.display = "none";
                        document.getElementById("ledgerFormFrame").style.display = "none";
                        document.getElementById("ledgerList").style.display = "block";
                    }
                });
            });
        });

        function openPaymentVoucherForm() {
            // Hide sections
            document.querySelectorAll('.content-section').forEach(s => s.classList.remove('active'));
            document.getElementById("paymentVoucherList").style.display = "none";
            document.getElementById("paymentVoucherFormFrame").style.display = "block";
            document.getElementById("discountVoucherFormFrame").style.display = "none";
            document.getElementById("discountVoucherList").style.display = "none";
            document.getElementById("ledgerFormFrame").style.display = "none";
            document.getElementById("ledgerList").style.display = "none";
            // Load payment voucher form
            document.getElementById("paymentVoucherFormFrame").src = "${pageContext.request.contextPath}/vouchers/payment/new";
        }

        function closePaymentVoucherForm() {
            document.getElementById("paymentVoucherFormFrame").style.display = "none";
            document.getElementById("paymentVoucherFormFrame").src = "";
            document.getElementById("dashboard").classList.add("active");
        }

        function openDiscountVoucherForm() {
            document.querySelectorAll('.content-section').forEach(s => s.classList.remove('active'));
            document.getElementById("discountVoucherList").style.display = "none";
            document.getElementById("discountVoucherFormFrame").style.display = "block";
            document.getElementById("paymentVoucherFormFrame").style.display = "none";
            document.getElementById("paymentVoucherList").style.display = "none";
            document.getElementById("ledgerFormFrame").style.display = "none";
            document.getElementById("ledgerList").style.display = "none";
            document.getElementById("discountVoucherFormFrame").src = "${pageContext.request.contextPath}/vouchers/discount/new";
        }

        function closeDiscountVoucherForm() {
            document.getElementById("discountVoucherFormFrame").style.display = "none";
            document.getElementById("discountVoucherFormFrame").src = "";
            document.getElementById("dashboard").classList.add("active");
        }

        // Ledger form (open inside iframe)
        function openLedgerForm() {
            document.getElementById("ledgerList").style.display = "none";
            document.getElementById("ledgerFormFrame").src = "${pageContext.request.contextPath}/ledger/new";
            document.getElementById("ledgerFormFrame").style.display = "block";
        }

        function closeLedgerForm() {
            document.getElementById("ledgerFormFrame").style.display = "none";
            document.getElementById("ledgerFormFrame").src = "";
            document.getElementById("ledgerList").style.display = "block";
        }
        // These close*Form functions must be called from the respective iframe ("parent.closePaymentVoucherForm()", etc).
    </script>
</body>
</html>

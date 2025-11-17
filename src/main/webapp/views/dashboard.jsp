<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: var(--light-gray);
            color: var(--dark-gray);
            display: flex;
            min-height: 100vh;
        }
        
        /* Header Styles */
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
        
        .header h1 {
            font-size: 1.8rem;
            font-weight: 600;
        }
        
        /* Side Menu Styles */
        .side-menu {
            width: 250px;
            background-color: var(--white);
            box-shadow: 2px 0 5px rgba(0,0,0,0.05);
            padding-top: 90px;
            height: 100vh;
            position: fixed;
            overflow-y: auto;
        }
        
        .menu-item {
            padding: 1rem 1.5rem;
            cursor: pointer;
            transition: all 0.3s ease;
            border-bottom: 1px solid var(--medium-gray);
            display: flex;
            align-items: center;
        }
        
        .menu-item:hover {
            background-color: var(--light-blue);
            color: var(--primary-blue);
        }
        
        .menu-item.active {
            background-color: var(--light-blue);
            color: var(--primary-blue);
            border-left: 4px solid var(--primary-blue);
        }
        
        .menu-item i {
            margin-right: 10px;
            font-size: 1.2rem;
        }
        
        /* Content Area */
        .content {
            margin-left: 250px;
            margin-top: 70px;
            padding: 2rem;
            flex: 1;
            min-height: calc(100vh - 70px);
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
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        .section-title {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            color: var(--primary-blue);
            border-bottom: 2px solid var(--light-blue);
            padding-bottom: 0.5rem;
        }
        
        /* Dashboard specific styles */
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
        
        .stat-label {
            color: var(--dark-gray);
            font-size: 0.9rem;
        }
        
        /* Table styles for other sections */
        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }
        
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
        
        .data-table tr:hover {
            background-color: var(--light-gray);
        }
        
        /* Form styles */
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }
        
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
        
        .btn:hover {
            background-color: var(--dark-blue);
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
        <div class="menu-item active" data-target="dashboard">
            <i>📊</i> Dashboard
        </div>
        <div class="menu-item" data-target="ledger">
            <i>📒</i> Ledger
        </div>
        <div class="menu-item" data-target="invoices">
            <i>🧾</i> Invoices
        </div>
        <div class="menu-item" data-target="customers">
            <i>👥</i> Customers
        </div>
        <div class="menu-item" data-target="reports">
            <i>📈</i> Reports
        </div>
        <div class="menu-item" data-target="payment-voucher">
            <i>💳</i> Payment Voucher
        </div>
        <div class="menu-item" data-target="discount-voucher">
            <i>🎫</i> Discount Voucher
        </div>
        <div class="menu-item" data-target="settings">
            <i>⚙️</i> Settings
        </div>
        <div class="menu-item" data-target="logout">
            <i>🚪</i> Logout
        </div>
    </div>
    
    <!-- Content Area -->
    <div class="content">
        <!-- Dashboard Section -->
        <div id="dashboard" class="content-section active">
            <h2 class="section-title">Dashboard</h2>
            <div class="dashboard-stats">
                <div class="stat-card">
                    <div class="stat-value">$12,450</div>
                    <div class="stat-label">Total Revenue</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">$8,230</div>
                    <div class="stat-label">Total Expenses</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">$4,220</div>
                    <div class="stat-label">Net Profit</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">24</div>
                    <div class="stat-label">Pending Invoices</div>
                </div>
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
        
        <!-- Ledger Section -->
        <div id="ledger" class="content-section">
            <h2 class="section-title">General Ledger</h2>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Account</th>
                        <th>Debit</th>
                        <th>Credit</th>
                        <th>Balance</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2023-10-15</td>
                        <td>Cash</td>
                        <td>$1,200.00</td>
                        <td>$0.00</td>
                        <td>$1,200.00</td>
                    </tr>
                    <tr>
                        <td>2023-10-14</td>
                        <td>Accounts Receivable</td>
                        <td>$0.00</td>
                        <td>$350.50</td>
                        <td>-$350.50</td>
                    </tr>
                    <tr>
                        <td>2023-10-12</td>
                        <td>Revenue</td>
                        <td>$0.00</td>
                        <td>$2,500.00</td>
                        <td>$2,500.00</td>
                    </tr>
                </tbody>
            </table>
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
        
        <!-- Payment Voucher Section -->
        <div id="payment-voucher" class="content-section">
            <h2 class="section-title">Payment Voucher</h2>
            <form>
                <div class="form-group">
                    <label class="form-label">Voucher Number</label>
                    <input type="text" class="form-control" value="PV-001" readonly>
                </div>
                <div class="form-group">
                    <label class="form-label">Payee</label>
                    <input type="text" class="form-control" placeholder="Enter payee name">
                </div>
                <div class="form-group">
                    <label class="form-label">Amount</label>
                    <input type="number" class="form-control" placeholder="Enter amount">
                </div>
                <div class="form-group">
                    <label class="form-label">Payment Method</label>
                    <select class="form-control">
                        <option>Cash</option>
                        <option>Bank Transfer</option>
                        <option>Check</option>
                    </select>
                </div>
                <button type="submit" class="btn">Create Voucher</button>
            </form>
        </div>
        
        <!-- Discount Voucher Section -->
        <div id="discount-voucher" class="content-section">
            <h2 class="section-title">Discount Voucher</h2>
            <form>
                <div class="form-group">
                    <label class="form-label">Voucher Code</label>
                    <input type="text" class="form-control" placeholder="Enter voucher code">
                </div>
                <div class="form-group">
                    <label class="form-label">Discount Type</label>
                    <select class="form-control">
                        <option>Percentage</option>
                        <option>Fixed Amount</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Discount Value</label>
                    <input type="number" class="form-control" placeholder="Enter discount value">
                </div>
                <div class="form-group">
                    <label class="form-label">Valid Until</label>
                    <input type="date" class="form-control">
                </div>
                <button type="submit" class="btn">Create Voucher</button>
            </form>
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

    <script>
        // Menu navigation functionality
        document.addEventListener('DOMContentLoaded', function() {
            const menuItems = document.querySelectorAll('.menu-item');
            const contentSections = document.querySelectorAll('.content-section');
            
            menuItems.forEach(item => {
                item.addEventListener('click', function() {
                    // Remove active class from all menu items
                    menuItems.forEach(mi => mi.classList.remove('active'));
                    
                    // Add active class to clicked menu item
                    this.classList.add('active');
                    
                    // Hide all content sections
                    contentSections.forEach(section => section.classList.remove('active'));
                    
                    // Show the target content section
                    const targetId = this.getAttribute('data-target');
                    document.getElementById(targetId).classList.add('active');
                });
            });
        });
    </script>
</body>
</html>
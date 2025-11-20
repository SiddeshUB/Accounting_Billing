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

        /* Modal Styles */
        .modal {
            display: none; 
            position: fixed;
            z-index: 2000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 2rem;
            border-radius: 8px;
            width: 400px;
            position: relative;
        }

        .modal .close {
            color: #333;
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 1.5rem;
            cursor: pointer;
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
        <div class="menu-item">
            <a href="/invoices" style="color: inherit; text-decoration: none;">
                <i>🧾</i> Invoices
            </a>
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

        <!-- Customers Section -->
        <div id="customers" class="content-section">
            <h2 class="section-title">Customers</h2>
            
            <!-- Add Customer Button -->
            <button class="btn" id="addCustomerBtn" style="margin-bottom: 15px;">+ Add Customer</button>
            
            <!-- Customers Table -->
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Balance</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${customers}">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.name}</td>
                            <td>${c.email}</td>
                            <td>${c.phoneNumber}</td>
                            <td>${c.balance}</td>
                            <td>
                                <button class="btn edit-btn" data-id="${c.id}" data-name="${c.name}" 
                                        data-email="${c.email}" data-phone="${c.phoneNumber}" 
                                        data-balance="${c.balance}">Edit</button>
                                <a href="/customers/delete/${c.id}" class="btn" style="background-color:red;">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Add/Edit Customer Modal -->
            <div id="customerModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <h3 id="modalTitle">Add Customer</h3>
                    <form id="customerForm" action="/customers/save" method="post">
                        <input type="hidden" name="id" id="customerId" />

                        <div class="form-group">
                            <label class="form-label">Name</label>
                            <input type="text" class="form-control" name="name" id="customerName" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="customerEmail" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Phone Number</label>
                            <input type="text" class="form-control" name="phoneNumber" id="customerPhone">
                        </div>

                        <div class="form-group">
                            <label class="form-label">Balance</label>
                            <input type="number" class="form-control" step="0.01" name="balance" id="customerBalance" required>
                        </div>

                        <button type="submit" class="btn">Save</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Other sections (Reports, Payment Voucher, Discount Voucher, Settings, Logout) remain unchanged -->
    </div>

    <script>
        // Menu navigation functionality
        document.addEventListener('DOMContentLoaded', function() {
            const menuItems = document.querySelectorAll('.menu-item');
            const contentSections = document.querySelectorAll('.content-section');
            
            menuItems.forEach(item => {
                item.addEventListener('click', function() {
                    menuItems.forEach(mi => mi.classList.remove('active'));
                    this.classList.add('active');
                    
                    contentSections.forEach(section => section.classList.remove('active'));
                    
                    const targetId = this.getAttribute('data-target');
                    if(targetId){
                        document.getElementById(targetId).classList.add('active');
                    }
                });
            });

            // Modal functionality
            const modal = document.getElementById("customerModal");
            const addBtn = document.getElementById("addCustomerBtn");
            const closeBtn = document.querySelector(".modal .close");
            const form = document.getElementById("customerForm");

            addBtn.onclick = function() {
                document.getElementById("modalTitle").innerText = "Add Customer";
                form.reset();
                modal.style.display = "block";
            }

            closeBtn.onclick = function() {
                modal.style.display = "none";
            }

            window.onclick = function(event) {
                if(event.target == modal) {
                    modal.style.display = "none";
                }
            }

            // Edit buttons
            const editButtons = document.querySelectorAll('.edit-btn');
            editButtons.forEach(btn => {
                btn.addEventListener('click', function() {
                    document.getElementById("modalTitle").innerText = "Edit Customer";
                    document.getElementById("customerId").value = this.dataset.id;
                    document.getElementById("customerName").value = this.dataset.name;
                    document.getElementById("customerEmail").value = this.dataset.email;
                    document.getElementById("customerPhone").value = this.dataset.phone;
                    document.getElementById("customerBalance").value = this.dataset.balance;
                    modal.style.display = "block";
                });
            });
        });
    </script>
</body>
</html>

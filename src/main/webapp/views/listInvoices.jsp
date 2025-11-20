<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Invoices Dashboard</title>
    <style>
        /* Reset & Base */
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: #ffffff;   /* White background */
            color: #1a1a1a;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 220px;
            height: 100%;
            background: #0d47a1;   /* Blue */
            padding: 20px;
            box-sizing: border-box;
            color: white;
        }

        .sidebar h2 {
            color: #fff;
            font-size: 18px;
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 10px 0;
            color: #bbdefb;
            cursor: pointer;
        }

        .sidebar ul li.active {
            color: #fff;
            font-weight: bold;
        }

        .sidebar .quick-actions {
            margin-top: 30px;
        }

        .sidebar .quick-actions a {
            display: block;
            margin: 6px 0;
            padding: 8px;
            background: #1565c0;
            color: #fff;
            border-radius: 4px;
            text-align: center;
        }

        /* Main content */
        .main {
            margin-left: 240px;
            padding: 20px;
        }

        .main-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .main-header h2 {
            margin: 0;
            font-size: 24px;
            color: #0d47a1;
        }

        .btn {
            padding: 8px 16px;
            background: #0d47a1;
            color: #fff;
            border-radius: 5px;
            font-weight: bold;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #ffffff; 
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #e0e0e0;
        }

        th, td {
            padding: 12px 16px;
            text-align: left;
        }

        th {
            background: #1976d2;   /* Blue */
            color: #fff;
        }

        tr {
            border-bottom: 1px solid #eeeeee;
        }

        tr:hover {
            background: #e3f2fd;   /* Light Blue Hover */
        }

        .status-paid {
            color: #2e7d32;
            font-weight: bold;
        }

        .status-unpaid {
            color: #d32f2f;
            font-weight: bold;
        }

        .action-btn {
            padding: 6px 12px;
            border-radius: 4px;
            margin-right: 5px;
            font-size: 13px;
        }

        .action-edit {
            background: #1565c0;
            color: #fff;
        }

        .action-delete {
            background: #d32f2f;
            color: #fff;
        }
        
        .action-view {
    background: #2e7d32;   /* Green */
    color: #fff;
}
        
    </style>
</head>
<body>

<div class="sidebar">
    <h2> Accounting</h2>
    <ul>
        <li>Dashboard</li>
        <li>Ledger</li>
        <li class="active">Invoices</li>
        <li>Customers</li>
        <li>Reports</li>
        <li>Settings</li>
    </ul>

    <div class="quick-actions">
        <a href="#">+ New Ledger Entry</a>
        <a href="/invoice/new">+ New Invoice</a>
    </div>
</div>

<div class="main">
    <div class="main-header">
        <h2>Invoices</h2>
        <a href="/invoice/new" class="btn">New Invoice</a>
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Customer</th>
            <th>Date</th>
            <th>Due</th>
            <th>Total</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="inv" items="${invoices}">
            <tr>
                <td>${inv.invoiceNumber}</td>
                <td>${inv.customer}</td>
                <td>${inv.invoiceDate}</td>
                <td>${inv.dueDate}</td>
                <td>₹ ${inv.totalAmount}</td>
                <td class="${inv.status.toLowerCase()}">${inv.status}</td>
                <td>
    <a href="/invoice/view/${inv.id}" class="action-btn action-view">View</a>
    <a href="/invoice/edit/${inv.id}" class="action-btn action-edit">Edit</a>
    <a href="/invoice/delete/${inv.id}" class="action-btn action-delete">Delete</a>
</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>

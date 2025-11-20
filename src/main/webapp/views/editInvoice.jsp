<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Edit Invoice</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #ffffff; /* White background */
            color: #1a1a1a;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: #0d47a1; /* Blue heading */
        }

        .form-container {
            width: 450px;
            margin: auto;
            margin-top: 20px;
            background: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
            border: 1px solid #e0e0e0;
        }

        label {
            font-weight: bold;
            color: #0d47a1;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 18px;
            border: 1px solid #b0bec5;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #0d47a1; /* Blue button */
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover {
            background: #1565c0; /* Light blue hover */
        }
    </style>
</head>

<body>

<h2>Edit Invoice</h2>

<div class="form-container">

    <form action="/invoice/update" method="post">

        <input type="hidden" name="id" value="${invoice.id}">

        <label>Invoice Number:</label>
        <input type="text" name="invoiceNumber" value="${invoice.invoiceNumber}" required>

        <label>Customer:</label>
        <input type="text" name="customer" value="${invoice.customer}" required>

        <label>Invoice Date:</label>
        <input type="date" name="invoiceDate" value="${invoice.invoiceDate}" required>

        <label>Due Date:</label>
        <input type="date" name="dueDate" value="${invoice.dueDate}" required>

        <label>Total Amount:</label>
        <input type="number" name="totalAmount" step="0.01" value="${invoice.totalAmount}" required>

        <label>Status:</label>
        <select name="status">
            <option ${invoice.status == 'Paid' ? 'selected' : ''}>Paid</option>
            <option ${invoice.status == 'Unpaid' ? 'selected' : ''}>Unpaid</option>
        </select>

        <button type="submit">Update Invoice</button>

    </form>

</div>

</body>
</html>

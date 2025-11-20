<html>
<head>
    <title>Invoice Details</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #ffffff;
            color: #1a1a1a;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: #0d47a1; /* Blue heading */
        }

        .details-box {
            width: 450px;
            margin: auto;
            margin-top: 20px;
            background: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
            border: 1px solid #e0e0e0;
        }

        .detail-item {
            margin-bottom: 15px;
            font-size: 16px;
        }

        .detail-item strong {
            color: #0d47a1;
            font-weight: bold;
            width: 150px;
            display: inline-block;
        }

        .btn-container {
            text-align: center;
            margin-top: 25px;
        }

        .btn {
            padding: 10px 20px;
            background: #0d47a1;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: bold;
        }

        .btn:hover {
            background: #1565c0;
        }
    </style>

</head>

<body>

<h2>Invoice Details</h2>

<div class="details-box">

    <p class="detail-item"><strong>ID:</strong> ${invoice.id}</p>
    <p class="detail-item"><strong>Invoice Number:</strong> ${invoice.invoiceNumber}</p>
    <p class="detail-item"><strong>Customer:</strong> ${invoice.customer}</p>
    <p class="detail-item"><strong>Invoice Date:</strong> ${invoice.invoiceDate}</p>
    <p class="detail-item"><strong>Due Date:</strong> ${invoice.dueDate}</p>
    <p class="detail-item"><strong>Total Amount:</strong> Rs. ${invoice.totalAmount}</p>
    <p class="detail-item"><strong>Status:</strong> ${invoice.status}</p>

    <div class="btn-container">
        <a href="/invoices" class="btn">Back to Invoices</a>
    </div>

</div>

</body>
</html>

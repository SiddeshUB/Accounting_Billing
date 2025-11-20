<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add / Edit Customer</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f6fc;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 40%;
            margin: 50px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: bold;
            color: #444;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 20px 0;
            border: 1px solid #bbb;
            border-radius: 6px;
            font-size: 14px;
        }

        button {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 12px;
            border: none;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        a.back-btn {
            display: block;
            margin-top: 20px;
            text-align: center;
            background: #6c757d;
            color: white;
            padding: 10px;
            border-radius: 6px;
            text-decoration: none;
            transition: 0.3s;
        }

        a.back-btn:hover {
            background: #545b62;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Customer Form</h2>

    <form action="${pageContext.request.contextPath}/customers/save" method="post">

        <input type="hidden" name="id" value="${customer.id}" />

        <label>Name</label>
        <input type="text" name="name" value="${customer.name}" required />

        <label>Email</label>
        <input type="email" name="email" value="${customer.email}" required />

        <label>Phone Number</label>
        <input type="text" name="phoneNumber" value="${customer.phoneNumber}" />

        <label>Balance</label>
        <input type="number" step="0.01" name="balance" value="${customer.balance}" required />

        <button type="submit">Save</button>
    </form>

    <a href="${pageContext.request.contextPath}/customers" class="back-btn">Back</a>

</div>

</body>
</html>

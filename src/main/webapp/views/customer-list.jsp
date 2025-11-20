<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f6fc;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        a.add-btn {
            display: inline-block;
            margin-bottom: 15px;
            background: #28a745;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 6px;
            transition: 0.3s;
        }

        a.add-btn:hover {
            background: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a.edit-btn, a.delete-btn {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 5px;
            color: white;
            font-size: 14px;
            transition: 0.3s;
        }

        a.edit-btn {
            background-color: #ffc107;
        }

        a.edit-btn:hover {
            background-color: #e0a800;
        }

        a.delete-btn {
            background-color: #dc3545;
        }

        a.delete-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Manage Customers</h2>

    <a href="${pageContext.request.contextPath}/customers/add" class="add-btn">+ Add Customer</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Balance</th>
            <th>Action</th>
        </tr>

        <c:forEach var="c" items="${customers}">
            <tr>
                <td>${c.id}</td>
                <td>${c.name}</td>
                <td>${c.email}</td>
                <td>${c.phoneNumber}</td>
                <td>${c.balance}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/customers/edit/${c.id}" class="edit-btn">Edit</a>
                    <a href="${pageContext.request.contextPath}/customers/delete/${c.id}" 
                       class="delete-btn" onclick="return confirm('Delete this customer?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>

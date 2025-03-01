<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: url('img/op2.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            line-height: +2;
            display: flex;
            justify-content: flex-start; /* Align content to the left */
            padding: 20px;
        }

        .dashboard-container {
            margin-top: 110px;
            margin-right: 40px;
            width: 20%;
            background-color: rgba(255, 255, 255, 0.6);
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-left: +1100px; /* Add left margin for some spacing */
        }

        h2 {
            text-align: center;
            font-size: 1.8rem;
            margin-bottom: 1px;
            color: white;
        }

        ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        li {
            display: flex;
            align-items: center;
        }

        li a {
            flex-grow: 1;
            text-decoration: none;
            padding: 10px;
            background-color: black;
            color: white;
            font-size: 1rem;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        li a:hover {
            background-color: #333;
        }

        @media (max-width: 768px) {
            body {
                flex-direction: column;
                align-items: center;
            }
            .dashboard-container {
                width: 200%;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Employee Dashboard</h2>
        <ul>
            <li><a href="view_operators.jsp">View All Operators</a></li>
            <li><a href="add_operator.jsp">Add Operator</a></li>
            <li><a href="daily_production.jsp">View Daily Production</a></li>
            <li><a href="add_daily_production.jsp">Add Production</a></li>
        </ul>
    </div>
</body>
</html>

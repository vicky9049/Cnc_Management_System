<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Daily Production Data</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: "Roboto", Arial, sans-serif;
            background: black;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            flex-direction: column;
            padding: 20px;
        }

        /* Table Container */
        .table-container {
            width: 90%;
            max-width: 1200px;
            overflow-x: auto;
        }

        /* Table Styling */
        table {
            width: 100%;
            background-color: rgba(255, 255, 255, 0.1);
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 12px rgba(255, 255, 255, 0.2);
        }

        /* Table Headers */
        th {
            background-color: #4caf50;
            color: white;
            padding: 15px;
            text-align: center;
            font-weight: bold;
            font-size: 22px;
            border: 1px solid white;
        }

        /* Table Data */
        td {
            padding: 15px;
            text-align: center;
            border: 1px solid white;
            font-size: 20px;
        }

        /* Table Row Hover Effect */
        tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        /* Heading Styling */
        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 2.5rem;
            color: #4caf50;
            font-weight: bold;
        }

        /* Responsive Table */
        @media (max-width: 768px) {
            th, td {
                font-size: 18px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <h2>Daily Production List</h2>
    <div class="table-container">
        <table border="1">
            <tr>
                <th>Operator Name</th>
                <th>Production Item Name</th>
                <th>Production Date</th>
                <th>Quantity</th>
            </tr>
            <%
                String url = "jdbc:mysql://localhost:3306/company";
                String user = "root";
                String password = "9049";

                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(url, user, password);
                    String query = "SELECT operator_name, production_item_name, production_date, quantity FROM daily_production";
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery(query);

                    while (resultSet.next()) {
            %>
            <tr>
                <td><%= resultSet.getString("operator_name") %></td>
                <td><%= resultSet.getString("production_item_name") %></td>
                <td><%= resultSet.getDate("production_date") %></td>
                <td><%= resultSet.getInt("quantity") %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>
    </div>
</body>
</html>

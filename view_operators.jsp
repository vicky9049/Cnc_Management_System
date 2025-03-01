<!DOCTYPE html>
<html>
<head>
    <title>View Operators</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black; /* Background color changed to black */
            background-size: cover;
            background-position: center;
            text-align: center;
            color: white; /* Text color changed to white for better visibility */
        }
        table {
            width: 100%;
            margin: auto;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.1);
            color: white; /* Table text color set to white */
        }
        th, td {
            border: 1px solid white;
            padding: 10px;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .delete-btn {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .operator-img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
    </style>
    <script>
        function deleteOperator(operatorId) {
            if (confirm("Are you sure you want to delete this operator?")) {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "DeleteOperatorServlet?operator_id=" + operatorId, true);
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        alert("Operator deleted successfully.");
                        location.reload();
                    } else {
                        alert("Error deleting operator.");
                    }
                };
                xhr.send();
            }
        }

        window.onload = function() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "ViewOperatorsServlet", true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    document.getElementById("operatorTableBody").innerHTML = xhr.responseText;
                } else {
                    alert("Error loading data.");
                }
            };
            xhr.send();
        };
    </script>
</head>
<body>
    <h2>List of Operators</h2>
    <table>
        <thead>
            <tr>
                <th>Operator ID</th>
                <th>Operator Name</th>
                <th>Department</th>
                <th>Joining Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="operatorTableBody">
            <!-- Data will be inserted here -->
        </tbody>
    </table>
</body>
</html>

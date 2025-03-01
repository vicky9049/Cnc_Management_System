<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Operator</title>
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
            background: url('img/op2.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            display: flex;
            justify-content: flex-end; /* Align the form container to the right */
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        

        /* Form Container */
        .form-container {
            background-color: white;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.4); /* Semi-transparent white background */
            
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
            opacity: 0;
            transform: translateY(-20px);
            animation: fadeIn 0.8s ease-out forwards;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Heading Styling */
        h2 {
            margin-bottom: 20px;
            font-size: 1.5rem;
            color: #4caf50;
        }

        /* Label and Input Styling */
        label {
            display: white;
            text-align: left;
            margin: 10px 0 5px;
            font-size: 1rem;
            color: #555;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input:focus {
            border-color: #4caf50;
            outline: none;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
        }

        /* Button Styling */
        button {
            width: 100%;
            padding: 12px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.1s ease;
        }

        button:hover {
            background-color: #45a049;
            transform: translateY(-3px);
            animation: bounce 0.4s ease;
        }

        @keyframes bounce {
            0%, 100% {
                transform: translateY(-3px);
            }
            50% {
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                width: 80%;
            }

            h2 {
                font-size: 1.4rem;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Operator</h2>
        <form action="AddOperatorServlet" method="post">
            <label for="operator_name">Operator Name:</label>
            <input type="text" id="operator_name" name="operator_name" placeholder="Enter Operator Name" required>
            
            <label for="operator_id">Operator ID:</label>
            <input type="text" id="operator_id" name="operator_id" placeholder="Enter Operator ID" required>
            
            <label for="department">Department:</label>
            <input type="text" id="department" name="department" placeholder="Enter Department" required>
            
            <label for="joining_date">Joining Date:</label>
            <input type="date" id="joining_date" name="joining_date" required>
            
            <button type="submit">Add Operator</button>
        </form>
    </div>
</body>
</html>

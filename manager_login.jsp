<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Login</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling with Background Image */
        body {
            font-family: 'Roboto', sans-serif;
            background: url('img/manager1.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Form Container */
        .login-container {
            background-color: rgba(255, 255, 255, -0.20); /* Semi-transparent white background */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 350px;
            text-align: center;
            animation: fadeIn 0.5s ease-in-out forwards;
            
             position: relative;
    top: -50px; /* Move up (adjust as needed) */
    left: +500px; /* Move right (use negative value for left) */
        }

        @keyframes fadeIn {
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Heading Styling */
        h2 {
            margin-bottom: 20px;
            font-size: 2rem;
            color: #333;
            font-weight: 600;
        }

        /* Label and Input Styling */
        label {
            display: block;
            text-align: left;
            margin-bottom: 8px;
            font-size: 1rem;
            color: #555;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border 0.3s ease;
        }

        input:focus {
            border: 1px solid #007bff;
            outline: none;
        }

        /* Button Styling */
        button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        button:active {
            background-color: #003f8b;
        }

        /* Forgot Password Link */
        .forgot-password {
            margin-top: 10px;
            font-size: 0.9rem;
            color: #007bff;
            text-decoration: none;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .login-container {
                width: 80%;
                padding: 25px;
            }

            h2 {
                font-size: 1.6rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Manager Login</h2>
        <form action="ManagerLoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            
            <button type="submit">Login</button>
        </form>
        <a href="ForgotPassword.jsp" class="forgot-password">Forgot your password?</a>
    </div>
</body>
</html>


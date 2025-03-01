package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/AddOperatorServlet")
public class AddOperatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 // JDBC URL, username, password for MySQL
    String jdbcURL = "jdbc:mysql://localhost:3306/company";
    String dbUser = "root"; // Replace with your MySQL username
    String dbPassword = "9049"; // Replace with your MySQL password

    
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String operatorName = request.getParameter("operator_name");
	        String operatorId = request.getParameter("operator_id");
	        String department = request.getParameter("department");
	        String joiningDate = request.getParameter("joining_date");

	        
	        
	        try {
	            // Load the JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Establish the connection
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/company", "root", "9049");

	            // SQL query to insert data
	            String sql = "INSERT INTO operators (operator_id, operator_name, department, joining_date) VALUES (?, ?, ?, ?)";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, operatorId);
	            stmt.setString(2, operatorName);
	            stmt.setString(3, department);
	            stmt.setString(4, joiningDate);
	            
	            int rowsInserted = stmt.executeUpdate();
	            if (rowsInserted > 0) {
	                response.getWriter().println("Operator added successfully!");
	            } else {
	                response.getWriter().println("Failed to add operator.");
	            }

	            // Close resources
	            stmt.close();
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
	        }
	    

	}

}

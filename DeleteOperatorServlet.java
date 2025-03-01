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

@SuppressWarnings("serial")
@WebServlet("/DeleteOperatorServlet")
public class DeleteOperatorServlet extends HttpServlet {
    String url = "jdbc:mysql://localhost:3306/company";
    String user = "root";
    String password = "9049";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int operatorId = Integer.parseInt(request.getParameter("operator_id"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            conn = DriverManager.getConnection(url, user, password);

            // SQL query to delete operator
            String sql = "DELETE FROM operators WHERE operator_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, operatorId);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.getWriter().write("Operator deleted successfully.");
            } else {
                response.getWriter().write("Error: Operator not found.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

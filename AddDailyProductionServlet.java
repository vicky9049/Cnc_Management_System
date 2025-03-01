
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
@WebServlet("/AddDailyProductionServlet")
public class AddDailyProductionServlet extends HttpServlet {
    String url = "jdbc:mysql://localhost:3306/company";
    String user = "root";
    String password = "9049";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Getting form data
        String operatorName = request.getParameter("operator_name");
        String productionItemName = request.getParameter("production_item_name");
        String productionDate = request.getParameter("production_date");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Database connection
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/company", "root", "9049");

            // SQL query to insert data (including quantity)
            String sql = "INSERT INTO daily_production (operator_name, production_item_name, production_date, quantity) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, operatorName);
            stmt.setString(2, productionItemName);
            stmt.setString(3, productionDate);
            stmt.setInt(4, quantity);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                response.getWriter().println("Daily Production added successfully.");
            } else {
                response.getWriter().println("Failed to add Daily Production.");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

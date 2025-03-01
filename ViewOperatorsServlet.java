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
import java.sql.ResultSet;

@SuppressWarnings("serial")
@WebServlet("/ViewOperatorsServlet")
public class ViewOperatorsServlet extends HttpServlet {
    String url = "jdbc:mysql://localhost:3306/company";
    String user = "root";
    String password = "9049";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/company", "root", "9049");

            // SQL query to fetch operators
            String sql = "SELECT operator_id, operator_name, department, joining_date FROM operators";
            stmt = conn.prepareStatement(sql);

            // Execute query and get the result
            rs = stmt.executeQuery();

            // Build table rows with delete button
            StringBuilder htmlResponse = new StringBuilder();
            while (rs.next()) {
                htmlResponse.append("<tr>");
                htmlResponse.append("<td>").append(rs.getInt("operator_id")).append("</td>");
                htmlResponse.append("<td>").append(rs.getString("operator_name")).append("</td>");
                htmlResponse.append("<td>").append(rs.getString("department")).append("</td>");
                htmlResponse.append("<td>").append(rs.getDate("joining_date")).append("</td>");
                htmlResponse.append("<td><button onclick='deleteOperator(").append(rs.getInt("operator_id")).append(")'>Delete</button></td>");
                htmlResponse.append("</tr>");
            }

            // Write the rows to the response
            response.getWriter().write(htmlResponse.toString());

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

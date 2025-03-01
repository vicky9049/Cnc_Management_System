package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();

	        String email = request.getParameter("email");
	        try {
	            // Database connection inside servlet
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company", "root", "9049");

	            String query = "SELECT * FROM managers WHERE email=?";
	            PreparedStatement pst = con.prepareStatement(query);
	            pst.setString(1, email);
	            ResultSet rs = pst.executeQuery();

	            if (rs.next()) {
	                // Dummy response, actual implementation should send an email with a reset link or OTP
	                out.println("<h3 style='color:green;'>A password reset link has been sent to your email.</h3>");
	            } else {
	                out.println("<h3 style='color:red;'>Email not found in database.</h3>");
	            }
	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	            out.println("<h3 style='color:red;'>Something went wrong. Try again later.</h3>");
	        }
	    }
}

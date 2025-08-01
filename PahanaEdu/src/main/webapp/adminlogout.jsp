<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // ✅ Invalidate session to log out the customer
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("adminlogin.jsp"); // Redirect to login page
%>


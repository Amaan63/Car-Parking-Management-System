
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.VehicleDao"%>
<%@page import="com.entities.User"%>

<%@page import="com.entities.Vehicle"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Parking History</title>
<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">
</head>
<body>
	<%@include file="../components/UserComponents/UserHomeNavBar.jsp"%>
	
	<%@include file="../components/UserComponents/VehicleDetails.jsp" %>
</body>
</html>
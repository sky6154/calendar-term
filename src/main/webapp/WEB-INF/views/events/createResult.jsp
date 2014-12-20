<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Success</title>
</head>
<body>
    <div align="center">
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>Registration Succeeded!</h2></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <h3>Thank you for registering! Here's the review of your details:</h3>
                </td>
            </tr>
            <tr>
                <td>Owner:</td>
                <td>${eventForm.owner}</td>
            </tr>
            <tr>
                <td>Summary:</td>
                <td>${eventForm.summary}</td>
            </tr>
            <tr>
                <td>Description:</td>
                <td>${eventForm.description}</td>
            </tr>
            <tr>
                <td>Time:</td>
                <td>${eventForm.when}</td>
            </tr>
        </table>
        <input type="button" value="Home" onClick="location.href='/calendar-dev/';">
    </div>
</body>
</html>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%

List<Map<String,String>> userList = (List<Map<String,String>>)request.getAttribute("list");
for(Map<String,String> user : userList){
	out.write("이름 : " + user.get("name"));
	out.write("나이 : " + user.get("age"));
	out.write("<br>");
}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("org.h2.Driver");	
try{
	Class.forName("org.h2.Driver");	
	conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/test","sa","");
System.out.println("연결완료");
conn.close();
}catch(Exception e){
	System.out.println("ERROR");
}finally{
	System.out.println("END");
}

%>
</body>
</html>
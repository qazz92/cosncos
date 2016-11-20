<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%
    request.setCharacterEncoding("UTF-8");       //한글이 깨지지 않도록 UTF-8으로 받음. getParameter위에 써야함!!
   	String userid = request.getParameter("id");
    String userpw = request.getParameter("pw");
    int selectedId = 0;
    String selectedEmail = null;
    String selectedPw = null;
    Connection conn = null;                                        // null로 초기화 한다.
    PreparedStatement pstmt = null;
    try{
        String url = "jdbc:oracle:thin:@45.32.252.246:1521:xe";        // 사용하려는 데이터베이스명을 포함한 URL 기술
        String id = "cos";                                                    // 사용자 계정
        String pw = "rhfo";                                                // 사용자 계정의 패스워드
        Class.forName("oracle.jdbc.driver.OracleDriver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
        conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
        System.out.println("연결완료");
        String sql = "SELECT ID,EMAIL, PASSWORD FROM USERS WHERE EMAIL=?";                        // sql 쿼리
        pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
        pstmt.setString(1,userid);
    	ResultSet rs = null;
    	rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
    	System.out.println("조회 성공");        // 성공시 메시지 출력
    	while(rs.next()){                                                        // 결과를 한 행씩 돌아가면서 가져온다.
    		selectedId = rs.getInt("id");
    		selectedEmail = rs.getString("email");
    		selectedPw = rs.getString("password");
    	}
    	if(userid.equals(selectedEmail) && userpw.equals(selectedPw)){
    		session.setAttribute("userId", selectedId);
    		session.setAttribute("userEmail", selectedEmail);
    		response.sendRedirect("../view/megazine.jsp");
    	}
    	}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
    	e.printStackTrace();
    	System.out.println("조회 실패");
    	}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
    	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}            // PreparedStatement 객체 해제
    	if(conn != null) try{conn.close();}catch(SQLException sqle){}            // Connection 해제
    	}
%>
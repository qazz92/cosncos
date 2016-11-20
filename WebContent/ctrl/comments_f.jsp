<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
request.setCharacterEncoding("UTF-8");
String m_id = request.getParameter("m_id");
String comments = request.getParameter("comments");
int user_id = (int)session.getAttribute("userId");
System.out.println(comments);
Connection conn = null;                                        // null로 초기화 한다.
PreparedStatement pstmt = null;
try{
    String url = "jdbc:oracle:thin:@45.32.252.246:1521:xe";        // 사용하려는 데이터베이스명을 포함한 URL 기술
    String id = "cos";                                                    // 사용자 계정
    String pw = "rhfo";                                                // 사용자 계정의 패스워드
    Class.forName("oracle.jdbc.driver.OracleDriver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
    conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
    System.out.println("reply 연결완료");
    String sql = "insert into reply values(reply_id.NEXTVAL,?,?,?,?)";        // sql 쿼리
	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	pstmt.setString(1,comments);
	pstmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));    // 현재 날짜와 시간
	pstmt.setInt(3,user_id);
	pstmt.setInt(4,Integer.parseInt(m_id));
	
	int result = pstmt.executeUpdate();                                        // 쿼리를 실행한다.
	if(result>0){
		System.out.println("reply 테이블에 새로운 레코드를 추가했습니다.");        // 성공시 메시지 출력
		out.println(true);
	}else {
		System.out.println("insert failed..");        // 실패시 메시지 출력
		out.println(false);
	}
	}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
	e.printStackTrace();
	System.out.println("조회 실패");
	}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}            // PreparedStatement 객체 해제
	if(conn != null) try{conn.close();}catch(SQLException sqle){}            // Connection 해제
	}
%>
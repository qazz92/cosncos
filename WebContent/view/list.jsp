<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%
    request.setCharacterEncoding("UTF-8");       //한글이 깨지지 않도록 UTF-8으로 받음. getParameter위에 써야함!!
	ArrayList<Integer> ids = null;
	ArrayList<String> titles = null;
	ArrayList<String> contents = null;
	int idx = 0;
    Connection conn = null;                                        // null로 초기화 한다.
    PreparedStatement pstmt = null;
    try{
        String url = "jdbc:oracle:thin:@45.32.252.246:1521:xe";        // 사용하려는 데이터베이스명을 포함한 URL 기술
        String id = "cos";                                                    // 사용자 계정
        String pw = "rhfo";                                                // 사용자 계정의 패스워드
        Class.forName("oracle.jdbc.driver.OracleDriver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
        conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
        System.out.println("연결완료");
    	String sql = "select id,title from megazine";        // sql 쿼리
    	pstmt = conn.prepareStatement(sql);
    	ResultSet rs = null;
    	rs = pstmt.executeQuery();
    	System.out.println("조회 성공");        // 성공시 메시지 출력
    	ids = new ArrayList<Integer>();
    	titles = new ArrayList<String>();
    	contents = new ArrayList<String>();
    	while(rs.next()) { 
    		ids.add(idx,rs.getInt("id"));
        	System.out.println(rs.getInt("id"));
    	    titles.add(idx, rs.getString("title"));
        	System.out.println(rs.getString("title"));
    	   	idx+=1;
    	}
    	}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
    	e.printStackTrace();
    	System.out.println("조회 실패");
    	}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
    	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}            // PreparedStatement 객체 해제
    	if(conn != null) try{conn.close();}catch(SQLException sqle){}            // Connection 해제
    	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/common.css">
    <link rel="stylesheet" href="../assets/css/index.css">
<title>Insert title here</title>
</head>
<body>
<% for(int i=0;i<ids.size();i++) { %>
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
 data-target="#modal<%=ids.get(i)%>" 
id="modalBtn<%=ids.get(i)%>">
<%=titles.get(i) %></button>
<!-- Modal -->
<div id="modal<%=ids.get(i)%>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><%=titles.get(i) %></h4>
      </div>
      <div class="modal-body">
		<iframe src="" width="100%" height="500">
        </iframe>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<%} %>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script>
    $('[id^=modalBtn]').on('click', function(e) {
        var id = $(this).attr("id");
        var number = id.replace("modalBtn", "");
        var src = "../view/megazine_detail.jsp?m_id="+number;
        $("#modal"+number+" iframe").attr({'src':src});
    });
    </script>
</body>
</html>
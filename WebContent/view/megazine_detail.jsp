<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<% 
    request.setCharacterEncoding("UTF-8");       //한글이 깨지지 않도록 UTF-8으로 받음. getParameter위에 써야함!!
    String sessionemail = (String)session.getAttribute("userEmail");
    Connection conn = null;                                        // null로 초기화 한다.
    PreparedStatement pstmt = null;
    PreparedStatement pstmt1 = null;
    String m_id = request.getParameter("m_id"); 
    String title = null;
    String contents = null;
    Date date = null;
    ArrayList<String> c_email=null;
    ArrayList<String> c_content = null;
    ArrayList<String> c_ph = null;
    ArrayList<Date> c_date = null;
	int idx = 0;
    try{
        String url = "jdbc:oracle:thin:@45.32.252.246:1521:xe";        // 사용하려는 데이터베이스명을 포함한 URL 기술
        String id = "cos";                                                    // 사용자 계정
        String pw = "rhfo";                                                // 사용자 계정의 패스워드
        Class.forName("oracle.jdbc.driver.OracleDriver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
        conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
        System.out.println("Detail 연결완료");
    	String sql = "select title,content,up_time from megazine where id=?";        // sql 쿼리
    	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
    	pstmt.setInt(1,Integer.parseInt(m_id));
    	ResultSet rs = null;
    	rs = pstmt.executeQuery();
    	System.out.println("Detail 조회 성공");        // 성공시 메시지 출력
    	while(rs.next()) { 
			title = rs.getString("title");
			contents = rs.getString("content");
			date = rs.getDate("up_time");
    	}
    	rs.close();
		String sqlc = "SELECT USERS.EMAIL as email ,USERS.PROFILE_PHOTO as profile_photo, REPLY.CONTENT as content, REPLY.UP_TIME as up_time  FROM REPLY LEFT  OUTER JOIN USERS ON REPLY.USER_ID=USERS.ID WHERE MEG_ID=?";
		pstmt1 = conn.prepareStatement(sqlc);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
    	pstmt1.setInt(1,Integer.parseInt(m_id));
    	ResultSet rs1 = null;
    	rs1 = pstmt1.executeQuery();
    	System.out.println("Comments 조회 성공");        // 성공시 메시지 출력
    	c_email = new ArrayList<String>();
    	c_content = new ArrayList<String>();
    	c_ph = new ArrayList<String>();
    	c_date = new ArrayList<Date>();
     	while(rs1.next()) { 
     		System.out.println(rs1.getString(1)+","+rs1.getString(2)+","+rs1.getString(3)+","+rs1.getString(4));
     		c_email.add(idx,rs1.getString(1));
			c_ph.add(idx,rs1.getString(2));
			c_content.add(idx,rs1.getString(3));
			c_date.add(idx,rs1.getDate(4));
    	   	idx+=1;
    	}
     	rs1.close();
    	System.out.println("END!");
    	}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
    	e.printStackTrace();
    	System.out.println("Detail 조회 실패");
    	}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
    	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}            // PreparedStatement 객체 해제
    	if(pstmt1 != null) try{pstmt1.close();}catch(SQLException sqle){}            // PreparedStatement 객체 해제
    	if(conn != null) try{conn.close();}catch(SQLException sqle){}            // Connection 해제
    	}    
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/magazine_home.css">
    <link rel="stylesheet" href="../assets/css/scrollbar.css">
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
        <!--                      내용 -->
        <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel"><%=title %></h4>
<!--             <p class="test_p">화장품 재활용</p> -->
            <p id="test_time"><%=date %></p>
        </div>
        <div class="modal-body">
            <%=contents %>
        </div>
        <!--                       제품 보러가기-->
        <div class="modal_go_shop">
            <div class="go_shop">
                <div class="row">
                    <h6 id="go_shop_h6">제품 보러가기</h6>
                    <div class="col-xs-3 shop_padding">
                        <div class="w3-card-2">
                            <div>
                                <img class="go_shop_img" src="../assets/image/test1.jpg">
                            </div>
                            <div class="go_shop_span">
                                <span>뀨뀨꺄꺄</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-3 shop_padding">
                        <div class="w3-card-2">
                            <div>
                                <img class="go_shop_img" src="../assets/image/test1.jpg">
                            </div>
                            <div class="go_shop_span">
                                <span>뀨뀨꺄꺄</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-3 shop_padding">
                        <div class="w3-card-2">
                            <div>
                                <img class="go_shop_img" src="../assets/image/test1.jpg">
                            </div>
                            <div class="go_shop_span">
                                <span>뀨뀨꺄꺄</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-3 shop_padding">
                        <div class="w3-card-2">
                            <div>
                                <img class="go_shop_img" src="../assets/image/test1.jpg">
                            </div>
                            <div class="go_shop_span">
                                <span>뀨뀨꺄꺄</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--                       댓글 입력창-->
            <div class="modal_magazine_review">
                <div class="magazine_review">
                   <div class="row">
                       <div class="col-xs-1 review_padding">
                           <img src="../assets/image/users.png" width="70%" height="70%">
                       </div>
                       <div class="col-xs-11 review_padding">
                         <div class="row">
                         <%if(session.getAttribute("userId")==null) {%>
                             <div class="col-xs-10" id="review_padding">
                                 <textarea rows="4">로그인 하세요</textarea>
                             </div>
                             <div class="col-xs-2 review_padding">
                                 <button id="review_area" class="review_bt_style" onclick="location.href='../index.jsp'">로그인 하러가기</button>
                             </div>
                             <%}else { %>                         
                             <div class="col-xs-10" id="review_padding">
                                 <textarea id="review_area" rows="4"></textarea>
                             </div>
                             <div class="col-xs-2 review_padding">
                                 <button id="review_bt" class="review_bt_style" >댓글 등록</button>
                             </div>
                             <% } %>
                         </div>
                       </div>
                   </div>
                </div>
            </div>
        <!--        댓글 -->
        <div class="modal_magazine_review1">
            <div class="magazine_review1">
             		<%for(int i=0;i<c_email.size();i++){ %>
                    <div class="row row_line">
                        <div class="col-xs-1 review_padding">
                            <img class="users" src="<%=c_ph.get(i) %>" width="70%" height="70%">
                        </div>
                        <div class="col-xs-11 review_padding">
                            <span class="review_nik"><strong><%=c_email.get(i) %></strong></span><br>
                            <span class="review_con"><%=c_content.get(i) %></span><br>
                            <span class="review_time">
                                <i class="fa fa-clock-o" style="font-size:15px;color:lightgrey"></i>
                                 <%=c_date.get(i) %></span>
                        </div>
                    </div>
                    <%} %>
                    <div id="comments_div"></div>
            </div>
        </div>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
        <script>
        $(document).ready(function(){
        	  console.log("ASdf");


        });
        $("#review_bt").click(function(){
            console.log("click!!");
            var comments = $("#review_area").val();
            var userEmail = "<%=sessionemail%>";
            if(comments==""){
				alert("내용을 입력해주세요");
            }
            else{
            alert(comments+","+userEmail);
		     $.ajax({
                type : "POST",
               url : "../ctrl/comments_f.jsp",
               data: {"m_id":<%=m_id%>,"comments":comments},
               error : function(){
                   alert('통신 실패!!');
               },
               success : function(data){
                   alert("통신데이터 : "+data);
                   $("#comments_div").append("<div class='row row_line'>"+
                           "<div class='col-xs-1 review_padding'>"+
                           "<img class='users' src='../assets/image/users1.jpg' width='70%' height='70%'>"+
                           "</div>"+
                           "<div class='col-xs-11 review_padding'>"+
                           "<span class='review_nik'>"+
                           "<strong>"+userEmail+"</strong>"+
                           "</span><br>"+
                           "<span class='review_con'>"+
                           comments+
                           "</span><br>"+
                           "<span class='review_time'><i class='fa fa-clock-o' style='font-size:15px;color:lightgrey'></i>"+
                           " 방금"+
                           "</span></div></div>"
                           );
               }
            });
            }
       });
        </script>
</body>
</html>
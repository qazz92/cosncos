<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%-- <% if(session.getAttribute("userId")==null){
	response.sendRedirect("../index.jsp");
	}
%> --%>
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
    	    titles.add(idx, rs.getString("title"));
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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>magazine</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/common.css">
    <link rel="stylesheet" href="../assets/css/magazine_home.css">
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <section>
        <div class="container">
           <div class="w_r">
               <ul id="top_ul">
                   <li class="top_li"><a>로그아웃</a></li>
                   <li class="top_li"><a>회원가입</a></li>
                   <li class="top_li"><a>마이페이지</a></li>
                   <li class="top_li"><a>주문조회</a></li>
                   <li class="top_li"><a>장바구니</a></li>
               </ul>
           </div>  
        </div>
    </section>
    <div class="container">
         <div class="row logo_row">
          <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
              <img id="logo" src="../assets/image/logo.png">
          </div>
             <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
               <form id="find_form">
                  <div>
                      <input type="text" class="input-lg w3-border-0">
                      <img id="glass" src="../assets/image/glass.png">
                   </div>
               </form>
           </div>
             <div class="col-lg-3 col-md-3 col-sm-3">
             </div>
        </div>
    </div>
<!--        메뉴-->
    <section id="nav_border">
        <div class="container">
            <ul class="nav nav-pills magazine_nav w_r">
                <li><a href="#">찜목록 </a></li>
                <li><a href="#">게시판 </a></li>
                <li><a href="#">쇼핑</a></li>
            </ul>
        </div>
    </section>
    <div class="container">
        <section class="w_r">
<!--        배너-->
            <div class="row" id="banner">
                <div class="col-lg-8 col-md-8 col-xs-12">
                    <img class="mySlides" src="../assets/image/one.jpg" width="100%" height="320px">
                    <img class="mySlides" src="../assets/image/two.jpg" width="100%" height="320px">
                    <img class="mySlides" src="../assets/image/three.jpg" width="100%" height="320px">
                </div>
                <div class="col-lg-4 col-md-4 col-xs-12">
                    <div id="best_div" class="w3-card-2">
                        <h3 id="best_h3">BEST </h3>
                        <hr id="best_hr">
                        <p class="best_p"><span class="number_span">1 </span><span class="text_span">수분 </span></p>
                        <p class="best_p"><span class="number_span">2 </span><span class="text_span">화장품 재활용 </span></p>
                        <p class="best_p"><span class="number_span">3 </span><span class="text_span">로즈 립스틱 </span></p>
                        <p class="best_p"><span class="number_span">4 </span><span class="text_span">누드 메이크업 </span></p>
                        <p class="best_p"><span class="number_span">5 </span><span class="text_span">2016 가을 메이크업 트렌드 </span></p>
                        <p class="best_p"><span class="number_span">6 </span><span class="text_span">2016 겨울 메이크업 트렌드 </span></p>
                        <p class="best_p"><span class="number_span">7 </span><span class="text_span">동안 메이크업 </span></p>
                    </div>
                </div>
            </div>
            
            <div class="row margin_row magazine_row">
            <% for(int i=0;i<ids.size();i++) { %>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 cursor" 
                data-toggle="modal" data-target="#modal<%=ids.get(i) %>" id="modalBtn<%=ids.get(i) %>">
                    <div class="w3-card-2">
                        <div >
                            <img class="magazine_image" src="../assets/image/magazine1.jpg">
                        </div>
                        <div class="magazine_span_div">
                            <span><%=titles.get(i) %></span>
                        </div>
                    </div>
                </div>
                    <!-- Modal -->
    <div class="modal fade" id="modal<%=ids.get(i) %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
<!--                    1단락 -->
                <iframe src="" width="73%" height="750" frameborder="no">
                    </iframe>
<!--                   2단락 -->
                   <div id="modal_div2">
                      <div id="modal_div3">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                          </button>
                          <div class="modal-header div2_header">  
                              <img class="users" src="../assets/image/users2.jpg" width="30%" style="display:block; margin:auto;">
                              <p class="test_pp">관리자</p>
                              <p class="test_pp1">cos&cos</p>
                          </div>
                          <div class="modal-body div2_body">
                             <p>
                                 <span><i class="fa fa-smile-o" style="font-size:17px; color:lightgrey;"></i>
                                     조회수  </span>
                                 <span class="p_right">1200</span>
                             </p>
                              <p>
                                  <span><i class="fa fa-heart" style="font-size:17px; color:lightgrey;"></i>
                                      좋아요  </span>
                                  <span class="p_right">55</span>
                              </p>
                              <p>
                                  <span><i class="fa fa-comment" style="font-size:17px; color:lightgrey;"></i>
                                      댓글  </span>
                                  <span class="p_right">2</span>
                              </p>
                          </div>
                          <div class="modal-footer">
                              <p></p>
                          </div>
                      </div>
                   </div>
            </div>

        </div>
    </div>
                <%} %>
            </div>
        </section>
    </div>
    
    <div class="container">
        <hr>
        <div class="row w_r h_r">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                <img id="footer_logo" src="../assets/image/logo.png">
            </div>
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                <p id="footer_p">
                    법인명(상호) : cos&cos &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    대표자(성명) : 정록헌 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    사업자 등록번호 : 00-000-0000 <br>
                    통신판매업 신고 : 00-000-0000 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    [사업자정보확인] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    전화 : 00-000-0000 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 팩스 : <br>
                    주소 : 부산광역시 서구 구덕로 225 동아대학교 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    개인정보관리책임자 : 정록헌(j.rokhun@gmail.com) <br>
                    Contact for more information.
                </p>
            </div>
        </div>
    </div>

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script>
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) {myIndex = 1}
            x[myIndex-1].style.display = "block";
            setTimeout(carousel, 4000); // Change image every 2 seconds
        }
        $('[id^=modalBtn]').on('click', function(e) {
            var id = $(this).attr("id");
            var number = id.replace("modalBtn", "");
            var src = "../view/megazine_detail.jsp?m_id="+number;
            $("#modal"+number+" iframe").attr({'src':src});
        });
    </script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>landing</title>
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/common.css">
    <link rel="stylesheet" href="./assets/css/index.css">
</head>

<body>
    <div class="container">
        <div class="row logo_row">
            <div class="col-lg-3 col-md-3 col-sm-3">
                <img id="logo" src="./assets/image/logo.png">
            </div>
        </div>
    </div>
    <div class="jumbotron">
            <section id="jum_sec">
    	<% if(session.getAttribute("userId")!=null){ 
		String id = (String)session.getAttribute("userEmail");
		%>
			<h2>환영합니다 . ${id }</h2>
	<form action="./ctrl/logout_f.jsp" method="get">
		<button class="btn btn-default btn-lg landing_btn" type="submit">로그아웃</button>
	</form>
	<%} else { %>

         <form action="./ctrl/login_f.jsp" method="post">
            <input class="input-lg landing_bt" type="email" id="id" name="id">
            <input class="input-lg" type="password" id="pw" name="pw">
            <button class="btn btn-default btn-lg landing_btn" type="submit">로그인</button>
            </form>
            <button class="btn btn-default btn-lg landing_btn" type="button" data-toggle="modal" data-target="#myModal">회원가입</button>
            <a id="find">아이디|비밀번호 찾기</a>

          <%} %>
                  </section>
    </div>
    <div class="container">
       <section>
        <div class="row w_r h_r">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div id="center_p1">
                    <h3 class="h"><strong>나만의 조합을 찾으세요</strong></h3>
                    <br>
                    <p class="p">&nbsp;저희 cos&cos에선 다양한 화장품 믹스 정보를 유용하게 사용하실 수 있도록 한눈에 보기 쉽게 정리해 놓았습니다. <br>
                        &nbsp;원하는 정보를 구독하신 후 나만의 것으로 만든다면 지금보다 훨씬 더 아름다워질 수 있는 기회를 갖게 될 것입니다.</p>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <img class="landing_img" src="./assets/image/find.jpg">
            </div>
        </div>
        <div class="row w_r h_r">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <img class="landing_img" id="phone" src="./assets/image/find2.jpg">
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
               <div id="center_p2">
                    <h3 class="h"><strong>나만의 조합을 공유하세요</strong></h3>
                    <br>
                    <p class="p">&nbsp;직접 만들거나 사용하는 당신만의 특별한 정보를 많은 사람들과 공유하세요  </p>
                </div>
            </div>
        </div>
        <div class="row w_r h_r">
            <div class="col-lg-6 col-md-6 col-sm-6">
               <div id="center_p3">
                <h3 class="h"><strong>나에게 선물하세요</strong></h3>
                <br>
                <p class="p">&nbsp;매분 매초 고생하고 있는 나에게 특별한 선물을 주세요. <br> 이 선물은 내가 더 아름다워질 수 있는 나만의 비법입니다.</p>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <img class="landing_img" src="./assets/image/find3.jpg">
            </div>
        </div>
        </section>
    </div>
    
    <div class="container">
        <hr>
        <div class="row w_r h_r">
            <div class="col-lg-4 col-md-4">
                <img id="footer_logo" src="./assets/image/logo.png">
            </div>
            <div class="col-lg-8 col-md-8">
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
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <form class="form-horizontal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">회원가입</h4>
                    </div>
                    <div class="modal-body">
                      <div class="row">
                          <div class="col-md-9">
                              <div class="form_group">
                                <label class="control-label col-md-4" >이메일</label>
                                <div class="col-md-7">
                                    <input class="form-control" type="email">  
                                </div>   
                              </div>
                          </div>
                          <div class="col-md-9 modal_col">
                              <div class="form_group">
                                  <label class="control-label col-md-4">비밀번호</label>
                                  <div class="col-md-7">
                                      <input class="form-control" type="password">  
                                  </div>   
                              </div>
                          </div>
                          <div class="col-md-9 modal_col">
                              <div class="form_group">
                                  <label class="control-label col-md-4">비밀번호 확인</label>
                                  <div class="col-md-7">
                                      <input class="form-control" type="password">  
                                  </div>   
                              </div>
                          </div>
                          <div class="col-md-9 modal_col">
                              <div class="form_group">
                                  <label class="control-label col-md-4">주소</label>
                                  <div class="col-md-7">
                                      <input class="form-control" type="text">  
                                  </div>   
                              </div>
                          </div>
                          <div class="col-md-9 modal_col">
                              <div class="form_group">
                                  <label class="control-label col-md-4">핸드폰 번호</label>
                                  <div class="col-md-7">
                                      <input class="form-control" type="tel" size="13">  
                                  </div>   
                              </div>
                          </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary">가입</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
</body>

</html>
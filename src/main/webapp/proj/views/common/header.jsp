<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div class="top-header" style="height: 10rem;">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="/proj/views/index.jsp">
                <i class="bi-pin-map-fill m-auto text-primary"></i>
                <!--<img src="#" target="blank" alt="logo" height="100">-->
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="true" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="../info/area.do">여행정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">여행일정</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../community/list.do">커뮤니티</a>
                    </li>


                    <div class="nav-right navbar">
                        <%
                            // 로그인이 안되면 로그인과 회원가입을 보여줌
                            if(session.getAttribute("u_id") == null) {
                        %>
                        <%--아이콘을 누르면 모달창이 뜬다.--%>
                        <button data-bs-toggle="modal" data-bs-target="#log_or_join" id="start-btn">
                            <i class="bi bi-person-circle" style="color:#fff;"></i>
                        </button>

                        <!-- 로그인 또는 회원가입 Modal창 -->
                        <div class="modal fade" id="log_or_join" tabindex="-1" aria-labelledby="log_or_joinModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">ThreeGo</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="blockquote text-center p-5">ThreeGo에 회원가입하여<br>여행을 즐겨보세요.</div>
                                        <div class="d-grid gap-2 p-5">
                                            <button class="btn btn-join" type="button" onclick="location.href='/join/join.do';">회원가입</button>
                                            <button class="btn btn-login" type="button" onclick="location.href='/login.do';">로그인</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            // 로그인되었을 경우, 로그아웃을 보여준다.
                        } else {
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="/logout.do">로그아웃</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/mypage.do">마이페이지</a>
                        </li>
                        <%
                            }
                        %>
                    </div>
                </ul>
            </div>
        </nav>
    </div>
</div>
</body>
</html>
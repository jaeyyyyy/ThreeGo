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

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">여행정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../info/area.do">여행일정</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../community/list.do">커뮤니티</a>
                    </li>


                    <div class="nav-right navbar">
                        <%
                            // 로그인이 안되면 로그인과 회원가입을 보여줌
                            if(session.getAttribute("sessionID") == null) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="/login.do">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../../join/join.do">회원가입</a>
                        </li>
                        <%
                            // 로그인되었을 경우, 로그아웃을 보여준다.
                        } else {
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="/logout.do">로그아웃</a>
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
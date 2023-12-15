<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="common/commonstyle.css" rel="stylesheet"/>
</head>
<body>
<div class="top-header" style="height: 30rem;">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="../index.jsp">
                <i class="bi-pin-map-fill m-auto text-primary"></i>
                <!--<img src="#" target="blank" alt="logo" height="100">-->
            </a>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">여행정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">여행일정</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../views/community/bbs.jsp">커뮤니티</a>
                    </li>


                    <div class="nav-right navbar">
                        <li class="nav-item">
                            <a class="nav-link" href="#">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="join/join.jsp">회원가입</a>
                        </li>
                    </div>
                </ul>
            </div>
        </nav>
    </div>

    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col-xl-8">
                <div class="text-center text-white">
                    <form class="form-subscribe" id="searchForm">
                        <!-- 여행지 검색창 input-->
                        <div class="row">
                            <div class="col">
                                <input class="form-control form-control-lg" id="searchInput" placeholder="여행지를 입력하세요."/>
                            </div>
                            <div class="col-auto"><button class="btn btn-primary btn-lg" id="searchButton" type="submit">검색</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
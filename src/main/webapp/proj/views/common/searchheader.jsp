<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.DAO.UserDAO" %>
<%@ page import="com.DTO.UserDTO" %>
<%@ page import="com.util.LoginService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
</head>
<body>

<!--top-header-->
<div class="top-header" style="height: 30rem;">
    <!--container-->
    <div class="container">
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="../views/index.jsp">
                <i class="bi bi-pin-map-fill m-auto text-dark"></i>
                <!--<img src="#" target="blank" alt="logo" height="100">-->
            </a>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="../../info/area.do">여행정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:alert('준비중입니다.');">여행일정</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../../community/list.do">커뮤니티</a>
                    </li>


                    <div class="nav-right navbar">
                        <c:choose>
                            <c:when test="${empty sessionScope.u_id}">
                                <!--로그인이 안되면 로그인과 회원가입을 보여줌-->
                                <button data-bs-toggle="modal" data-bs-target="#log-or-join" id="start-btn" class="navbar-brand">
                                    <i class="bi bi-person-circle text-dark"></i>
                                </button>

                                <!-- 로그인 또는 회원가입 Modal창 -->
                                <div class="modal fade" id="log-or-join" tabindex="-1" aria-labelledby="LogJoinModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="LogJoinModalLabel">ThreeGo</h5>
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
                            </c:when>

                            <c:otherwise>
                                <!--로그인이 되면 마이페이지와 로그아웃을 보여줌-->
                                <button data-bs-toggle="modal" data-bs-target="#mypage-or-logout" id="start-btn2" class="navbar-brand">
                                    <div class="header-prof-img">
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.u_sfile}">
                                                <!--프로필 사진이 있다면 보여주고-->
                                                <img class="header-my-prof-img" src="../../../upload/${sessionScope.u_sfile}" />
                                            </c:when>
                                            <c:otherwise>
                                                <!-- 아니라면 빈 사진을 보여준다-->
                                                <img class="header-my-prof-img" src="../resources/assets/img/no_profimg.png" />
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </button>

                                <!-- 마이페이지 또는 로그아웃 Modal창 -->
                                <div class="modal fade" id="mypage-or-logout" tabindex="-1" aria-labelledby="MypageLogoutModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="MypageLogoutModalLabel">ThreeGo</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="blockquote text-center p-5">ThreeGo에서 나의 정보를 확인하세요.</div>
                                                <div class="d-grid gap-2 p-5">
                                                    <button class="btn btn-join" type="button" onclick="location.href='/mypage.do';">마이페이지</button>
                                                    <button class="btn btn-login" type="button" onclick="location.href='/logout.do';">로그아웃</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </ul>
            </div>

        </nav>
        <!--navbar end-->



    </div>
    <!--container end-->
    <!--swiper-->
    <div class="swiper-container">
        <section class="slider-1">
            <div class="swiper" id="swiper-1">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="cards cards-1">

                            <p></p>
                        </div>
                    </div><!--end swiper-slide-->
                    <div class="swiper-slide">
                        <div class="cards cards-2">

                            <p></p>
                        </div>
                    </div><!--end swiper-slide-->
                    <div class="swiper-slide">
                        <div class="cards cards-3">

                            <p></p>
                        </div>
                    </div><!--end swiper-slide-->
                    <div class="swiper-slide">
                        <div class="cards cards-4">

                            <p></p>
                        </div>
                    </div><!--end swiper-slide-->
                    <div class="swiper-slide">
                        <div class="cards cards-5">

                            <p></p>
                        </div>
                    </div><!--end swiper-slide-->
                    <div class="swiper-slide">
                        <div class="cards cards-6">

                            <p></p>
                        </div>
                    </div><!--end swiper-slide-->
                </div><!--end swipper-wrapper-->
                <div class="swiper-pagination">

                </div>
            </div>
        </section>
    </div>
    <!--end swiper-->


<%--검색창 삭제-->
<%--    <div class="container position-relative">--%>
<%--        <div class="row justify-content-center">--%>
<%--            <div class="col-xl-8">--%>
<%--                <div class="text-center text-white">--%>
<%--                    <form class="form-subscribe" id="searchForm">--%>
<%--                        <!-- 여행지 검색창 input-->--%>
<%--                        <div class="row">--%>
<%--                            <div class="col">--%>
<%--                                <input class="form-control form-control-lg" id="searchInput" placeholder="Coming Soon..."/>--%>
<%--                            </div>--%>
<%--                            <div class="col-auto"><button class="btn btn-primary btn-lg" id="searchButton" type="submit">검색</button></div>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>

<script>
    new Swiper("#swiper-1",{
        autoplay:{
            delay: 3500,
            disableOnInteraction: false
        },
        pagination:{
            el: "#swiper-1 .swiper-pagination",
            clickable:true,
        },
        lazyLoading: true,
        loop: true,
        keyboard:{
            enabled:true,
        }
    });
</script>
</body>
</html>
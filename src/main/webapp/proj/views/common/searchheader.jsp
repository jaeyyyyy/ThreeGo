<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.DAO.UserDAO" %>
<%@ page import="com.DTO.UserDTO" %>
<%@ page import="com.util.LoginService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
</head>
<body>

<header class="p-3">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="../../proj/views/index.jsp" class="navbar-brand d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
                <i class="bi bi-pin-map-fill m-auto text-dark"></i>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="../../info/area.do" class="nav-link px-2" >여행정보</a></li>
                <li><a href="javascript:alert('준비중입니다.');" class="nav-link px-2">여행일정</a></li>
                <li><a href="../../community/list.do" class="nav-link px-2">커뮤니티</a></li>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                ${sessionScope.u_name}
            </form>

            <div class="dropdown text-end">

                <!--로그인이 안되면 로그인과 회원가입을 보여줌-->
                <c:choose>
                    <c:when test="${empty sessionScope.u_id}">
                        <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle text-dark"></i>
                        </a>
                        <ul class="dropdown-menu text-small" style="">
                            <li><a class="dropdown-item" href="../../login.do">로그인</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="../../join/join.do">회원가입</a></li>
                        </ul>
                    </c:when>


                    <c:otherwise>
                        <!--로그인이 되면 마이페이지와 로그아웃을 보여줌-->
                        <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            <c:choose>
                                <c:when test="${not empty sessionScope.u_sfile}">
                                    <!--프로필 사진이 있다면 보여주고-->
                                    <img src="../../../upload/${sessionScope.u_sfile}" alt="mdo" width="40" height="40" class="rounded-circle">
                                </c:when>
                                <c:otherwise>
                                    <!-- 아니라면 빈 사진을 보여준다-->
                                    <img src="../resources/assets/img/no_profimg.png" alt="mdo" width="40" height="40" class="rounded-circle" />
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <ul class="dropdown-menu text-small" style="">
                            <li><a class="dropdown-item" href="../../mypage.do">마이페이지</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="../../logout.do">로그아웃</a></li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</header>



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
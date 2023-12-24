<%@ page import="com.DAO.UserDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../../proj/views/common/commonstyle.css?after" rel="stylesheet"/>

    <title>마이페이지</title>
    <style>
        #my-page{
            display: flex;
            align-items: flex-start;
        }
        .post-text{
            border-left: 1px solid #EEEEEE;
        }
        .post-img{
            object-fit: cover;
        }
        .myboard-list {
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            gap: 1em;
        }
        .myboard-card {
            width: calc(100% / 2);
        }
    </style>

</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>
<div class="sub-header">
    <div class="container pt-5 pl-5">
        <h3 class="display-6 text-white">마이페이지</h3>
    </div>
</div>

<div class="container position-relative">

    <div id="my-page" class="row gap-3">
        <!-- 정보 수정 폼 -->
        <div class="col-md-3 text-center my-profile mt-5 mb-5">
            <c:choose>
                <c:when test="${not empty dto.u_ofile == true}">
                    <div class="prof-img mt-5">
                        <img class="my-prof-img" src="../../../upload/${dto.u_sfile}" />
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="prof-img mt-5">
                        <img class="my-prof-img" src="../proj/resources/assets/img/no_profimg.png" />
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="greeting m-5 text-white">
                <h3 style="font-weight: 500;">환영합니다!</h3>
                <h1 style="font-weight: 700;">${dto.u_name}님</h1>
            </div>


            <a href="/updateUser.do">
                <button class="btn btn-primary mb-5">정보 수정하기</button>
            </a>

        </div>


        <div class="col-md mt-5 mb-5">
            <h3>나의 게시글</h3>
            <div class="myboard-list">
                <!-- 내 작성글 확인-->
                <!-- 두 개만 보여줌-->
                <c:forEach var="myPost" items="${myList}" end="1">
                    <div class="card mb-3 myboard-card">
                        <a href="/community/view.do?b_id=${myPost.b_id}">
                        <div class="row g-0">
                            <div class="col-md-4 mt-5 mb-5">
                                <img src="../../../upload/${myPost.b_sfile}" class="img-fluid rounded-start post-img" alt="...">
                            </div>
                            <div class="col-md-8 post-text">
                                <div class="card-body">
                                    <h5 class="card-title">${myPost.b_title}</h5>
                                    <p class="card-text">${myPost.b_content}</p>
                                    <p class="card-text"><small class="text-body-secondary">${myPost.b_postdate}</small></p>
                                </div>
                            </div>
                        </div>
                        </a>
                    </div>

                </c:forEach>
            </div>
            <!-- 게시글 더 보려면 클릭-->
            <a href="/mypage/boardlist.do">게시글 더 보기</a>
        </div>

    </div>





</div>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function editUserInfo() {
        alert('회원 정보가 변경되었습니다.');
    }
</script>
</body>
</html>

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
            <h3 class="mb-4">나의 최근 게시글</h3>
            <div class="myboard-list">
                <!-- 내 작성글 확인-->
                <!-- 두 개만 보여줌-->
                <c:choose>
                    <c:when test="${empty myList == true}">
                        작성한 게시글이 없습니다.
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="myPost" items="${myList}" end="1">
                            <div class="card mb-3 myboard-card">
                                <a href="/community/view.do?b_id=${myPost.b_id}">
                                    <div class="row g-0">
                                        <div class="col-md-4 mt-5 mb-5">
                                            <c:choose>
                                                <c:when test="${not empty myPost.b_sfile == true}">
                                                    <img src="../../../upload/${myPost.b_sfile}" class="img-fluid rounded-start post-img" alt="...">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="../proj/resources/assets/img/no_image.png" class="img-fluid rounded-start post-img" alt="...">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="col-md-8 post-text">
                                            <div class="card-body">
                                                <h5 class="card-title">${myPost.b_title}</h5>
                                                <p class="card-text">${myPost.b_content}</p>
                                                <p class="card-text"><small class="text-body-secondary"><i class="bi bi-calendar"></i>&nbsp;&nbsp;${myPost.b_postdate}</small></p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- 게시글 더 보려면 클릭-->
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a href="/mypage/boardlist.do"><button class="btn btn-primary">게시글 더 보기</button></a>
                    </div>

                    </c:otherwise>
                </c:choose>

            <div class="myreply-list">
                <h3 class="mb-4">나의 최근 작성 댓글</h3>
                <c:choose>
                    <c:when test="${empty myReplyList}">
                        작성한 댓글이 없습니다.
                    </c:when>
                    <c:otherwise>

                        <c:forEach var="myReply" items="${myReplyList}" end="3">
                            <div class="my-reply-box">
                                <div class="my-reply-text">
                                    <div class="my-reply-btitle"><a href="/community/view.do?b_id=${myReply.b_id}">[${myReply.b_title}]</a></div>
                                    <div class="my-reply-content">
                                        <div class="my-reply-level">
                                            <c:if test="${myReply.re_level > 0}">
                                                <c:forEach var="level" begin="1" end="${myReply.re_level}" step="1">
                                                    re:
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                        <c:if test="${myReply.re_del eq 'Y'}">
                                            <div class="my-reply-deleted">삭제된 댓글 입니다.</div>
                                        </c:if>
                                        <c:if test="${myReply.re_del eq 'N'}">
                                            <a href="/community/view.do?b_id=${myReply.b_id}">${myReply.re_content}</a>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="my-reply-regdate">
                                    <c:choose>
                                        <c:when test="${empty myReply.re_modifydate}"><i class="bi bi-calendar"></i> &nbsp;&nbsp; ${myReply.re_regdate}</c:when>
                                        <c:otherwise><i class="bi bi-calendar"></i> &nbsp;&nbsp; ${myReply.re_modifydate} 수정됨</c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- 댓글 더 보려면 클릭-->
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="/mypage/replylist.do"><button class="btn btn-primary">댓글 더 보기</button></a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
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

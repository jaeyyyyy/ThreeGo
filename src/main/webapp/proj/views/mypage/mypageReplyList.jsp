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
        <%-- 내 작성글 확인--%>
        <h3 class="mt-5">내 작성 댓글</h3>

        <c:choose>
            <c:when test="${empty myReplyList}">
                작성한 댓글이 없습니다.
            </c:when>
            <c:otherwise>
                <c:forEach var="myReply" items="${myReplyList}">
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
                                <c:when test="${empty myReply.re_modifydate}">${myReply.re_regdate}</c:when>
                                <c:otherwise>${myReply.re_modifydate} 수정됨</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <div class="container position-relative pb-5">
            <div class="d-flex justify-content-center pb-2">
                ${map.pagingImg}
            </div>
        </div>
    </div>
</div>

<!--footer-->
<jsp:include page="../common/footer.jsp"/>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

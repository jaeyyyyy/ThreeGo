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
    <script>
        $(document).ready(function (){
            let pageNum = 1;
            const urlParams = new URL(location.href).searchParams;
            let pageTemp = urlParams.get('pageNum');
            if(pageTemp !== null){
                pageNum = pageTemp
            }

            $('#pageBtn' + pageNum).addClass('active');
        })
    </script>
    <style>

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
        <%-- 내 작성글 확인--%>
        <h3 class="mt-5">내 작성 글</h3>

        <c:choose>
            <c:when test="${empty myList == true}">
                작성한 게시글이 없습니다.
            </c:when>
            <c:otherwise>
                <c:forEach var="myPost" items="${myList}">
                    <div class="card myboard-card">
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

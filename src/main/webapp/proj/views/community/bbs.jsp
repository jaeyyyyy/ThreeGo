<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
    <title>커뮤니티</title>
</head>
<body>
<script>
    function PostToLogin(){
        alert("글 작성은 로그인 후에 가능합니다.");
        location.href =  "../login.do";
    }
</script>
<!-- header-->
<jsp:include page="../common/header.jsp"/>
<div class="sub-header">
    <div class="container pt-5 pl-5">
        <h3 class="display-6 text-white">게시판</h3>
    </div>
</div>

<form method="get" name="writeFrm">
    <div class="container position-relative">
        <div class="d-flex justify-content-center pt-5">
            <select name="searchField">
                <option value="b_title"<c:if test="${param.searchField ne 'b_content'}"> selected="selected"</c:if>>제목</option>
                <option value="b_content"<c:if test="${param.searchField eq 'b_content'}"> selected="selected"</c:if>>내용</option>
            </select>
            <input type="text" name="searchWord" value="${param.searchWord}">
            <input type="submit" value="검색" class="btn btn-primary btn-sm">
        </div>



    <%--리스트 샘플-->
<%--    <div class="card-deck row row-cols-1 row-cols-md-3 g-4">--%>
<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="#" alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">여기에 제목이 들어갑니다.</h5>--%>
<%--                    <h5 class="card-title">여기에 제목이 들어갑니다.</h5>--%>
<%--                    <p class="card-text">여기에 내용이 들어가는데 내용이 많아지면 ...로 줄입니다. css를 이용해서</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">작성날짜나 작성자이름을 쓰면 되겟군요</small>--%>
<%--                    <small class="text-muted">작성날짜나 작성자이름을 쓰면 되겟군요</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="card-deck row row-cols-1 row-cols-md-3 g-4 pt-5 pb-5">
        <c:choose>
            <c:when test="${empty boardList}">
                <div class="col">
                    <p class="card-text">등록된 게시물이 없습니다.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${boardList}" var="dto" varStatus="loop">
                    <a href="../community/view.do?b_id=${dto.b_id}">
                        <div class="col">
                            <div class="card card-item">
                                <div class="card-img-item">
                                    <c:choose>
                                        <c:when test="${not empty dto.b_ofile == true}">
                                            <img class="card-img-top" src="../../../upload/${dto.b_sfile}" alt="Card image cap">
                                        </c:when>
                                        <c:otherwise>
                                            <img class="card-img-top" src="../../proj/resources/assets/img/no_image.png" alt="Card image cap">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">${dto.b_title}</h5>
                                    <p class="card-text">${dto.b_content}</p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">${dto.u_id}</small>
                                    <small class="text-muted">${dto.b_postdate}</small>
                                </div>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </div>

            <div class="container position-relative pb-5">
                <div class="d-flex justify-content-center pb-2">
                    ${map.pagingImg}
                </div>
                <%
                    // 로그인이 안되면 글은 로그인 후에 쓸 수 있다고 알려줌
                    if(session.getAttribute("u_id") == null) {
                %>
                <div class="d-flex justify-content-end">
                    <button type="button" onclick="PostToLogin();" class="btn btn-primary btn-sm">글쓰기</button>
                </div>
                <%
                    } else {
                %>
                <div class="d-flex justify-content-end">
                    <button type="button" onclick="location.href='../community/write.do';" class="btn btn-primary btn-sm">글쓰기</button>
                </div>
                <%
                    }
                %>
            </div>
    </div>
</form>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../common/commonstyle.css?after" rel="stylesheet"/>
    <title>커뮤니티</title>
</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>
<div class="container position-relative">
    <form method="get">
        <table border="1" width="90%">
            <tr>
                <td align="center">
                    <select name="searchFiled">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord">
                    <input type="submit" value="검색">
                </td>
            </tr>
        </table>
    </form>

    <div class="card-deck row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card card-item">
                <img class="card-img-top" src="#" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">여기에 제목이 들어갑니다.</h5>
                    <h5 class="card-title">여기에 제목이 들어갑니다.</h5>
                    <p class="card-text">여기에 내용이 들어가는데 내용이 많아지면 ...로 줄입니다. css를 이용해서</p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">작성날짜나 작성자이름을 쓰면 되겟군요</small>
                    <small class="text-muted">작성날짜나 작성자이름을 쓰면 되겟군요</small>
                </div>
            </div>
        </div>
    </div>

<div class="card-deck row row-cols-1 row-cols-md-3 g-4">
<c:choose>
    <c:when test="${empty boardList}">
        <div class="col">
            <p class="card-text">등록된 게시물이 없습니다.</p>
        </div>
    </c:when>
    <c:otherwise>
        <c:forEach items="${boardList}" var="dto" varStatus="loop">
            <a href="../community/view.do?idx=${dto.idx}">
                <div class="col">
                    <div class="card card-item">
                        <div class="card-img-item">
                            <c:choose>
                                <c:when test="${not empty dto.ofile == true}">
                                    <img class="card-img-top" src="../../../upload/${dto.sfile}" alt="Card image cap">
                                </c:when>
                                <c:otherwise>
                                    <img class="card-img-top" src="../../resources/assets/img/no_image.png" alt="Card image cap">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${dto.title}</h5>
                            <p class="card-text">${dto.content}</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">${dto.name}</small>
                            <small class="text-muted">${dto.postdate}</small>
                        </div>
                    </div>
                </div>
            </a>
        </c:forEach>
    </c:otherwise>
</c:choose>
</div>

<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="..." alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">${row.title}</h5>--%>
<%--                    <p class="card-text">${row.content}</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">${row.name}</small>--%>
<%--                    <small class="text-muted">${row.postdate}</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="..." alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Card title</h5>--%>
<%--                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="..." alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Card title</h5>--%>
<%--                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="..." alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Card title</h5>--%>
<%--                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="..." alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Card title</h5>--%>
<%--                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <table border="1" width="90%">
        <tr align="center">
            <td>
                ${map.pagingImg}
            </td>
            <td width="100">
                <button type="button" onclick="location.href='../community/write.do';">글쓰기</button>
            </td>
        </tr>
    </table>

<!--footer-->
<jsp:include page="../common/footer.jsp"/>
</body>

</html>
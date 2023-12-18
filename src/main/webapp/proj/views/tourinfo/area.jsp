<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
<%--    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">--%>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
<%--    <link href="../common/commonstyle.css?after" rel="stylesheet"/>--%>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>관광지 정보 | 3GO</title>
</head>
<body>
    <h2 id="test">test</h2>
    <div id="area">
        <h4>- 지역 -</h4>
        <table border="1" width="30%" align="center">
        <c:forEach items="${areaList}" var="area" varStatus="idx">
            <c:if test="${idx.index % 3 == 0}"><tr></c:if>
            <td><a href="../info/city.do?area=${area.j_areacode}">${area.j_area_name}</a></td>
            <c:if test="${idx.index % 3 == 2}"></tr></c:if>
        </c:forEach>
        </table>
    </div>
</body>
</html>

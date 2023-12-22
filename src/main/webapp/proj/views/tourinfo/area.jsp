<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../../../proj/views/common/commonstyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>관광지 정보 | 3GO</title>
</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>
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
<!--footer-->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>

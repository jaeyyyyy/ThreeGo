<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>관광지 정보 | 3GO</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        // $(document).ready(function (){
        //
        // })
        //
        // function checkArea(){
        //     let url = '/info.do'
        //     $('.areaSelect').click(function (){
        //         $.ajax({
        //             url : url,
        //             method : 'get',
        //             data : {
        //                 area : $('input[name=area]').val(),
        //                 sigungu : $('input[name=sigungu]').val(),
        //                 cat1 : $('input[name=cat1]').val(),
        //                 cat2 : $('input[name=cat2]').val(),
        //                 cat3 : $('input[name=cat3]').val(),
        //                 type : $('input[name=type]').val(),
        //             },
        //             success : function(){
        //             }
        //         })
        //     })
        // }
    </script>
</head>
<body>

test
    <div id="area">
        <c:forEach items="${areaList}" var="area">
            <input type="radio" name="area" class="areaSelect">${area.j_area_name};
        </c:forEach>
    </div>

</body>
</html>

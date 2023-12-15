<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>관광지 정보 | 3GO</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function (){
            checkArea();
        })

        function checkArea(){
            let url = '/info.do'
            $('.areaSelect').click(function (){
                $.ajax({
                    url : url,
                    method : 'get',
                    data : {
                        area : $('input[name=area]:checked').val(),
                        sigungu : $('input[name=sigungu]:checked').val(),
                        cat1 : $('input[name=cat1]:checked').val(),
                        cat2 : $('input[name=cat2]:checked').val(),
                        cat3 : $('input[name=cat3]:checked').val(),
                        type : $('input[name=type]:checked').val()
                    },
                    success : function(data){
                        console.log(data.test)
                        $('#test').html(data.test)
                    }
                })
            })
        }
    </script>
</head>
<body>

    <h2 id="test"></h2>
    <div id="area">
        <c:forEach items="${areaList}" var="area">
            <input type="radio" class="areaSelect" name="area" value="${area.j_areacode}">${area.j_area_name}
        </c:forEach>

    </div>

</body>
</html>

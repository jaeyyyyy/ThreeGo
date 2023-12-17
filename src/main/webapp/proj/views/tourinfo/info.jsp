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
            let url = '/select.do'

            // 지역 선택
            $('.areaSelect').click(function (){
                $.ajax({
                    url : url,
                    type: 'POST',
                    contentType : 'application/json; charset=UTF-8',
                    dataType: 'json',
                    data : JSON.stringify({
                        area : $('input[name=area]:checked').val(),
                        sigungu : $('input[name=sigungu]:checked').val(),
                        cat1 : $('input[name=cat1]:checked').val(),
                        cat2 : $('input[name=cat2]:checked').val(),
                        cat3 : $('input[name=cat3]:checked').val(),
                        type : $('input[name=type]:checked').val()
                    }),
                    success : function(data){
                        let sigunguList = data.sigunguList;
                        $('#sigunguLabel').html("<br/><h4>- 시군구 -</h4>")
                        $('#sigungu').html("")
                        sigunguList.forEach(function (sigungu){
                            $('#sigungu').append(
                                '<input type="radio" class="sigunguSelect" name="sigungu" value="' + sigungu.s_sigungucode + '">' + sigungu.sigungu_name
                            )
                        })

                    }
                })
            })

            // $(document).on('click','.sigunguSelect',function (){
            //     $.ajax({
            //         url : url,
            //         type: 'POST',
            //         contentType : 'application/json; charset=UTF-8',
            //         dataType: 'json',
            //         data : JSON.stringify({
            //             area : $('input[name=area]:checked').val(),
            //             sigungu : $('input[name=sigungu]:checked').val(),
            //             cat1 : $('input[name=cat1]:checked').val(),
            //             cat2 : $('input[name=cat2]:checked').val(),
            //             cat3 : $('input[name=cat3]:checked').val(),
            //             type : $('input[name=type]:checked').val()
            //         }),
            //         success : function(data){
            //         }
            //     })
            // })

            // 카테고리(분류) 선택
            $('.catSelect').click(function (){
                $.ajax({
                    url : url,
                    type: 'POST',
                    contentType : 'application/json; charset=UTF-8',
                    dataType: 'json',
                    data : JSON.stringify({
                        area : $('input[name=area]:checked').val(),
                        sigungu : $('input[name=sigungu]:checked').val(),
                        cat1 : $('input[name=cat1]:checked').val(),
                        cat2 : $('input[name=cat2]:checked').val(),
                        cat3 : $('input[name=cat3]:checked').val(),
                        type : $('input[name=type]:checked').val()
                    }),
                    success : function(data){
                        let cat2List = data.cat2List;
                        $('#cat2Label').html("<br/><h4>- 중분류 -</h4>")
                        $('#cat2').html("")
                        cat2List.forEach(function (cat2){
                            $('#cat2').append(
                                '<input type="radio" class="cat2Select" name="cat2" value="' + cat2.cat2 + '">' + cat2.cat2_name
                            )
                        })
                        $('#cat3Label').html("")
                        $('#cat3').html("")
                    }
                })
            })

            $(document).on('click','.cat2Select',function (){
                $.ajax({
                    url : url,
                    type: 'POST',
                    contentType : 'application/json; charset=UTF-8',
                    dataType: 'json',
                    data : JSON.stringify({
                        area : $('input[name=area]:checked').val(),
                        sigungu : $('input[name=sigungu]:checked').val(),
                        cat1 : $('input[name=cat1]:checked').val(),
                        cat2 : $('input[name=cat2]:checked').val(),
                        cat3 : $('input[name=cat3]:checked').val(),
                        type : $('input[name=type]:checked').val()
                    }),
                    success : function(data){
                        let cat3List = data.cat3List;
                        $('#cat3Label').html("<br/><h4>- 소분류 -</h4>")
                        $('#cat3').html("")
                        cat3List.forEach(function (cat3){
                            $('#cat3').append(
                                '<input type="radio" class="cat3Select" name="cat3" value="' + cat3.cat3 + '">' + cat3.cat3_name
                            )
                        })
                    }
                })
            })

            // 조회
            $('button[name=search]').click(function (){
                let area = $('input[name=area]:checked').val();
                let sigungu = $('input[name=sigungu]:checked').val();
                let cat1 = $('input[name=cat1]:checked').val();
                let cat2 = $('input[name=cat2]:checked').val();
                let cat3 = $('input[name=cat3]:checked').val();
                let type = $('input[name=type]:checked').val();

                $('#result').html("");
                $('#result').append("<h3>선택한 항목</h3>");
                if(area != null) $('#result').append("지역: " + area + "<br/>");
                if(sigungu != null) $('#result').append("시군구: " + sigungu + "<br/>");
                if(cat1 != null) $('#result').append("대분류: " + cat1 + "<br/>");
                if(cat2 != null) $('#result').append("중분류: " + cat2 + "<br/>");
                if(cat3 != null) $('#result').append("소분류: " + cat3 + "<br/>");
                if(type != null) $('#result').append("컨텐츠 타입: " + type);
            })
        }

    </script>
</head>
<body>

    <h2 id="test">test</h2>
    <div id="area">
        <h4>- 지역 -</h4>
        <c:forEach items="${areaList}" var="area">
            <input type="radio" class="areaSelect" name="area" value="${area.j_areacode}">${area.j_area_name}
        </c:forEach>
        <br/>
        <div id="sigunguLabel"></div>
        <div id="sigungu"></div>
    </div>
    <br/>
    <div id="category">
        <h4>- 대분류 -</h4>
        <c:forEach items="${cat1List}" var="cat1">
            <input type="radio" class="catSelect" name="cat1" value="${cat1.cat1}">${cat1.cat1_name}
        </c:forEach>
        <br/>
        <div id="cat2Label"></div>
        <div id="cat2"></div>
        <div id="cat3Label"></div>
        <div id="cat3"></div>
    </div>
    <br/>
    <div id="content_type">
        <h4>- 컨텐츠 타입 -</h4>
        <c:forEach items="${c_typeList}" var="type">
            <input type="radio" class="typeSelect" name="type" value="${type.contenttypeid}">${type.ctype_name}
        </c:forEach>
        <br/>
    </div>

    <br/>
    <button name="search">조회</button>
    <div id="result"></div>

</body>
</html>

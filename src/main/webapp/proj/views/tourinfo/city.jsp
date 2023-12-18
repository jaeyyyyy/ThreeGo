<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
<%--    <!-- Font Awesome icons (free version)-->--%>
<%--    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>--%>
<%--    <!-- Bootstrap icons-->--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />--%>
<%--    <!-- Google fonts-->--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">--%>
<%--    <!-- Core theme CSS (includes Bootstrap)-->--%>
<%--    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />--%>
<%--    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />--%>
<%--    <link href="../common/commonstyle.css?after" rel="stylesheet"/>--%>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!-- toast grid -->
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />

    <script>
        $(document).ready(function (){
            checkCategory();
            search();
        })

        function checkCategory(){
            let url = '/info/city.do'

            // 카테고리(분류) 선택
            $('.catSelect').click(function (){
                $.ajax({
                    url : url,
                    type: 'POST',
                    contentType : 'application/json; charset=UTF-8',
                    dataType: 'json',
                    data : JSON.stringify({
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
        }

        function showList(){
            $('#gridDiv').html("");

            const dataSource = {
                contentType: 'application/json; charset=UTF-8',
                api: {
                    readData: {
                        url: '/tour_list.do',
                        method: 'GET',
                        initParams: {
                            area : $('input[name=area]').val(),
                            sigungu : $('input[name=sigungu]:checked').val(),
                            cat1 : $('input[name=cat1]:checked').val(),
                            cat2 : $('input[name=cat2]:checked').val(),
                            cat3 : $('input[name=cat3]:checked').val(),
                            type : $('input[name=type]:checked').val()
                        }
                    }
                }
            };

            var grid = new tui.Grid({
                el : document.getElementById('gridDiv'),
                data : dataSource,
                scrollX : false,
                scrollY : false,

                columns : [ {
                    header : '제목',
                    name : 'title'
                }],

                pageOptions: {
                    useClient: true,	// front에서만 페이징 하는 속성
                    perPage: 5
                }

            });
        }

        function search(){
            // 조회
            $('button[name=search]').click(function (){
                showList();
            })
        }

    </script>
    <style>
        .touritem-img {
            width: 400px;
            height: 300px;
        }
    </style>
    <title>관광지 정보 | 3GO</title>
</head>
<body>

    <h2 id="test">test</h2>
    <div id="category">
        <input type="hidden" name="area" value="${param.area}">
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
    <div id="sigungu">
        <h4>- 상세 지역 -</h4>
        <c:forEach items="${sigunguList}" var="sigungu">
            <input type="radio" class="areaSelect" name="sigungu" value="${sigungu.s_sigungucode}">${sigungu.sigungu_name}
        </c:forEach>
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

    <div id="gridDiv"></div>

</body>
</html>
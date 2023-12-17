<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../../../proj/resources/assets/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <script>
        $(document).ready(function (){
            // paging();
            checkArea();
        })

        // var flag = true;
        //
        // function paging(){
        //     $(document).ready(function(){
        //         $('#pagination').twbsPagination({
        //             totalPages: 10000,	// 총 페이지 번호 수
        //             visiblePages: 5,	// 하단에서 한번에 보여지는 페이지 번호 수
        //             startPage : 1, // 시작시 표시되는 현재 페이지
        //             initiateStartPageClick: false,	// 플러그인이 시작시 페이지 버튼 클릭 여부 (default : true)
        //             first:'<span sris-hidden="true">«</span>',
        //             last:'<span sris-hidden="true">»</span>',
        //             prev:"이전",
        //             next:"다음",
        //             nextClass : "page-item next",	// 이전 페이지 CSS class
        //             prevClass : "page-item prev",	// 다음 페이지 CSS class
        //             lastClass : "page-item last",	// 마지막 페이지 CSS calss
        //             firstClass : "page-item first",	// 첫 페이지 CSS class
        //             pageClass : "page-item",	// 페이지 버튼의 CSS class
        //             activeClass : "active",	// 클릭된 페이지 버튼의 CSS class
        //             disabledClass : "disabled",	// 클릭 안된 페이지 버튼의 CSS class
        //             anchorClass : "page-link",	//버튼 안의 앵커에 대한 CSS class
        //
        //             onPageClick: function (event, page) {
        //                 redraw(page);
        //             }
        //         });
        //
        //     });
        // }
        //
        // function redraw(page){
        //     let url = '/select.do'
        //
        //     if(flag){
        //         flag = false;
        //         $.ajax({
        //             url : url,
        //             type : 'POST',
        //             contentType : 'application/json; charset=UTF-8',
        //             dataType: 'json',
        //             data: {
        //                 "page" : page
        //             },
        //             success: function(data){
        //
        //                 $("#pagination").twbsPagination("changeTotalPages", data.totalCount , page);
        //
        //                 $('#content').html("");
        //
        //                 let touritemList = data.touritemList;
        //
        //                 touritemList.forEach(function (touritem) {
        //                     console.log(touritem.title);
        //                     $('#content').append(
        //                         "<div class='touritem-box'>"
        //                         + "<div class='img-div'><img class='touritem-img' src='" + touritem.firstimage + "'></div>"
        //                         + "<p>" + touritem.title + "</p>"
        //                         + "</div>"
        //                     );
        //                 })
        //
        //             },
        //             complete: function(){	// 이부분 중요
        //                 flag = true;	//호출 완료되면 flag 값을 사용가능하게 변경
        //             }
        //
        //         });
        //     }
        //
        // }

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

    <div id="content">

    </div>

    <div class="pagination-div">
        <nav aria-label="Page navigation">
            <ul class="pagination" id="pagination"></ul>
        </nav>
    </div>
</body>
</html>

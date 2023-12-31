<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../../../proj/views/common/commonstyle.css?after" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!-- toast grid -->
    <script type="text/javascript" src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
    <link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />

    <script>

        $(document).ready(function (){
            checkCategory();
            showList();
            search();
            $("#morebtn").click(function() {
                $(".invisiblecard").slideToggle(300);
            });
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
                        $('#cat2Label').html("<br/><h5>- 중분류 -</h5>")
                        $('#cat2').html("")

                        $('#cat2').append(
                            '<input type="radio" class="cat2Select btn-check" name="cat2" id="cat20" autocomplete="off" value="" checked>'
                            + '<label class="btn btn-2" for="cat20">#전체</label>'
                        )
                        cat2List.forEach(function (cat2, idx){
                            $('#cat2').append(
                                '<input type="radio" class="cat2Select btn-check" name="cat2" id="cat2'+ (idx+1) +'" autocomplete="off" value="' + cat2.cat2 + '">'
                                + '<label class="btn btn-2" for="cat2' + (idx+1) + '">' + cat2.cat2_name + '</label>'
                            )
                        })
                        if($('input[name=cat1]:checked').val() == ""){
                            $('#cat2Label').html("")
                            $('#cat2').html("")
                        }
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
                        $('#cat3Label').html("<br/><h5>- 소분류 -</h5>")
                        $('#cat3').html("")
                        $('#cat3').append(
                            '<input type="radio" class="cat3Select btn-check" name="cat3" id="cat30" autocomplete="off" value="" checked>'
                            + '<label class="btn btn-2" for="cat30">#전체</label>'
                        )
                        cat3List.forEach(function (cat3, idx){
                            $('#cat3').append(
                                '<input type="radio" class="cat3Select btn-check" name="cat3" id="cat3'+ (idx+1) +'" autocomplete="off" value="' + cat3.cat3 + '">'
                                + '<label class="btn btn-2" for="cat3' + (idx+1) + '">' + cat3.cat3_name + '</label>'
                            )
                        })
                        if($('input[name=cat2]:checked').val() == ""){
                            $('#cat3Label').html("")
                            $('#cat3').html("")
                        }
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

            const Grid = tui.Grid;
            Grid.applyTheme('clean',{
                cell: {
                    normal: {
                        background: '#fff',
                            border: '#e0e0e0',
                            showVerticalBorder: false,
                            showHorizontalBorder: true
                    },
                    header: {
                        background: '#fff',
                            border: '#e0e0e0',
                            showVerticalBorder: false,
                            showHorizontalBorder: true
                    },
                    selectedHeader: {
                        background: '#e0e0e0'
                    }
                }
            });

            var grid = new Grid({
                el : document.getElementById('gridDiv'),
                data : dataSource,
                scrollX : false,
                scrollY : false,
                rowHeight : 120,
                rowHeaders: [{type: 'rowNum', width: 50}],

                columns : [
                    {
                        header : '사진',
                        name : 'firstimage',
                        renderer: {
                            styles: {
                                textAlign: 'center'
                            },
                        },
                        width : 200
                    },
                    {
                        header : '관광정보',
                        name : 'content',
                    }
                ],

                pageOptions: {
                    useClient: true,	// front에서만 페이징 하는 속성
                    perPage: 10
                }

            });
        }

        function search(){
            // 조회
            $('button[name=searchBtn]').click(function (){
                showList();
            })
        }

    </script>
    <style>
        *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        #content_container{
            display: flex;
            gap: 30px;
            align-items: flex-start;
        }

        #tagSelector{
            border: 1px solid #DDDDDD;
            border-radius: 20px;
            width: 30%;
            height: auto;
        }

        #content_type, #category, #sigungu{
            padding: 20px;
        }

        #category, #sigungu{
            border-top: 1px solid #DDDDDD;
            padding: 20px;
        }

        #wrap{
            width: 1200px;
            margin: 0 auto;
        }
        .thumbnail{
            width: 150px;
            height: 100px;
        }
        #gridDiv{
            width: 70%;
        }

        .list_title{
            font-weight: 700;
        }

        .list_address, .list_category{
            font-weight: 400;
        }

        .btn-2{
            padding: 10px !important;
            font-size: 13px !important;
            border-radius: 15px !important;
        }

        .btn-3 {
            font-size: 13px !important;
            border-radius: 15px !important;
        }


        .d-grid{
            padding: 0 10px 20px;
        }

        .search-btn{
            font-weight: 700;
            border: 1px solid #AAAAAA;
            border-radius: 20px;
        }

        .search-btn:hover{
            background-color: #AAAAAA;
            color: #FFFFFF;
        }

        #areaName{
            padding: 20px 0;
        }

        label.btn-area{
            padding: 0;
        }
        label.btn-area a{
            display: block;
            padding: 10px;
        }

        .flex-box{
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .btn-select-area{
            border-color: #333333;
            color: #333333;
        }

        .btn-select-area:hover{
            border-color: #666666;
            color: #666666;
        }

        #area-list-box{
            margin-bottom: 10px;
        }
    </style>
    <title>관광지 정보 | 3GO</title>
</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>
    <div id="wrap">
        <div class="flex-box">
            <h2 id="areaName">${areaName}</h2>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-2 btn-primary2 btn-select-area " id="morebtn" >지역선택</button>
        </div>
        <div id="area-list-box" class = "invisiblecard">
            <c:forEach items="${areaList}" var="area" varStatus="idx">
                <input type="radio" class="areaSelect btn-check" name="areaSelect" id="area${idx.count}" autocomplete="off"
                       value="${area.j_areacode}" <c:if test="${param.area eq area.j_areacode}"> checked</c:if>>
                <label class="btn btn-3 btn-area" for="area${idx.count}"><a href="/info/city.do?area=${area.j_areacode}">#${area.j_area_name}</a></label>
            </c:forEach>
        </div>
        <div id="content_container">
            <%-- 리스트 --%>
            <div id="gridDiv"></div>
            <%-- 카테고리 셀렉터 --%>
            <div id="tagSelector">
                <div id="content_type">
                    <h5>- 관광 타입 -</h5>
                    <input type="radio" class="typeSelect btn-check" name="type" id="type0" autocomplete="off" value="" checked>
                    <label class="btn btn-2" for="type0">#전체</label>
                    <c:forEach items="${c_typeList}" var="type" varStatus="idx">
                        <input type="radio" class="typeSelect btn-check" name="type" id="type${idx.count}" autocomplete="off" value="${type.contenttypeid}">
                        <label class="btn btn-2" for="type${idx.count}">#${type.ctype_name}</label>
                    </c:forEach>
                    <br/>
                </div>
                <div id="category">
                    <input type="hidden" name="area" value="${param.area}">
                    <h5>- 대분류 -</h5>
                    <input type="radio" class="catSelect btn-check" name="cat1" id="cat10" autocomplete="off" value="" checked>
                    <label class="btn btn-2" for="cat10">#전체</label>
                    <c:forEach items="${cat1List}" var="cat1" varStatus="idx">
                        <input type="radio" class="catSelect btn-check" name="cat1" id="cat1${idx.count}" autocomplete="off" value="${cat1.cat1}">
                        <label class="btn btn-2" for="cat1${idx.count}">#${cat1.cat1_name}</label>
                    </c:forEach>
                    <br/>
                    <div id="cat2Label"></div>
                    <div id="cat2"></div>
                    <div id="cat3Label"></div>
                    <div id="cat3"></div>
                </div>
                <div id="sigungu">
                    <h5>- 상세 지역 -</h5>
                    <input type="radio" class="areaSelect btn-check" name="sigungu" id="sigungu0" autocomplete="off" value="" checked>
                    <label class="btn btn-2" for="sigungu0">#전체</label>
                    <c:forEach items="${sigunguList}" var="sigungu" varStatus="idx">
                        <input type="radio" class="areaSelect btn-check" name="sigungu" id="sigungu${idx.count}" autocomplete="off" value="${sigungu.s_sigungucode}">
                        <label class="btn btn-2" for="sigungu${idx.count}">#${sigungu.sigungu_name}</label>
                    </c:forEach>
                </div>
                <div class="d-grid">
                    <button class="btn btn-2 search-btn" type="button" name="searchBtn">검색</button>
                </div>
            </div>
        </div>
    </div>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

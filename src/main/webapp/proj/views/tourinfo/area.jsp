<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!--css-->
    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../../../proj/views/common/commonstyle.css" rel="stylesheet" />
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>관광지 정보 | 3GO</title>
    <style>
        .main{
            width: 100%;
            margin: 0 auto;
            display: flex;
            gap: 1rem;
        }

        .main_bar {
            position: relative;
            font-size: 1.5rem;
            font-weight: bold;
            color: white;
            text-align: center;
            border-radius: 10px;
            padding: 1rem;
            height: 150px;
            flex: 1;
            transition: 0.5s ease-in-out;
        }

        .b1 {
            background: url("../../../proj/resources/assets/img/mainimg/seoul.jpeg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
        }
        .b2 {
            background: url("../../../proj/resources/assets/img/subimg/busan.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
        }
        .b3 {
            background: url("../../../proj/resources/assets/img/subimg/jeju.jpg") 50% 80% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
        }
        .b4 {
            background: url("../../../proj/resources/assets/img/subimg/daejeon.jpg") 50%  no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
        }
        .b5 {
            background: url("../../../proj/resources/assets/img/subimg/daegu.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
        }
        .b6 {
            background: url("../../../proj/resources/assets/img/subimg/gyunggi.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
            background-size: 500px;
        }
        .b7 {
            background: url("../../../proj/resources/assets/img/subimg/gwangju.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
        }
        .b8 {
            background: url("../../../proj/resources/assets/img/subimg/gangwon.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
        }
        .b9 {
            background: url("../../../proj/resources/assets/img/subimg/ulsan.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
        }
        .b10 {
            background: url("../../../proj/resources/assets/img/mainimg/incheon.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
        }
        .b11 {
            background: url("../../../proj/resources/assets/img/mainimg/sejong.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
        }
        .b12 {
            background: url("../../../proj/resources/assets/img/subimg/chungbuk.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
            background-size: 500px;
        }
        .b13 {
            background: url("../../../proj/resources/assets/img/subimg/chungnam.jpg") 50% 70% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
            background-size: 500px;
        }
        .b14 {
            background: url("../../../proj/resources/assets/img/subimg/gyungbuk.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
            background-size: 500px;
        }
        .b15 {
            background: url("../../../proj/resources/assets/img/subimg/gyungnam.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
            background-size: 500px;
        }
        .b16 {
            background: url("../../../proj/resources/assets/img/subimg/jeonbuk.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
            background-size: 500px;
        }
        .b17 {
            background: url("../../../proj/resources/assets/img/subimg/jeonnam.jpg") 50% no-repeat,linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5));
            background-blend-mode: multiply;
            background-size: 500px;
        }


        .main_card {
            position: relative;
            font-size: 1.5rem;
            font-weight: bold;
            color: white;
            text-align: center;
            border-radius: 10px;
            padding: 1rem;
            height: 150px;
            flex: 1;
            transition: 0.5s ease-in-out;
        }
        .main_card:hover {
            flex: 3;
            cursor: pointer;
            border-color: #008bf8;
            box-shadow: 0 4px 18px 0 rgba(0, 0, 0, 0.25);
        }
        .main_card:hover {
            opacity: 1;
        }



    </style>
</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>

<div class="sub-header">
    <div class="container pt-5 pl-5">
        <h3 class="display-6 text-white">여행지</h3>
    </div>
</div>


    <div class="container mt-5">
        <h2 id="test">여행을 떠날 지역을 골라보세요!</h2>
        <div id="area">
<%--            <table border="1" width="70%" align="center">--%>
<%--                <c:forEach items="${areaList}" var="area" varStatus="idx">--%>
<%--                    <c:if test="${idx.index % 3 == 0}"><tr></c:if>--%>
<%--                    <td><a href="../info/city.do?area=${area.j_areacode}">${area.j_area_name}</a></td>--%>
<%--                    <c:if test="${idx.index % 3 == 2}"></tr></c:if>--%>
<%--                </c:forEach>--%>
<%--            </table>--%>



            <div class="main mt-5">

                <div class="main_card b1">
                    <a href="../info/city.do?area=1">
                    <div class="main_bar">서울</div>
                    </a>
                </div>

                <div class="main_card b2">
                    <a href="../info/city.do?area=6">
                        <div class="main_bar">부산</div>
                    </a>
                </div>

                <div class="main_card b3">
                    <a href="../info/city.do?area=39">
                        <div class="main_bar">제주</div>
                    </a>
                </div>

                <div class="main_card b4">
                    <a href="../info/city.do?area=3">
                        <div class="main_bar">대전</div>
                    </a>
                </div>

                <div class="main_card b5">
                    <a href="../info/city.do?area=4">
                        <div class="main_bar">대구</div>
                    </a>
                </div>
            </div>

            <div class="main mt-3">
                <div class="main_card b6">
                    <a href="../info/city.do?area=9">
                        <div class="main_bar">경기도</div>
                    </a>
                </div>

                <div class="main_card b7">
                    <a href="../info/city.do?area=5">
                        <div class="main_bar">광주</div>
                    </a>
                </div>

                <div class="main_card b8">
                    <a href="../info/city.do?area=32">
                        <div class="main_bar">강원도</div>
                    </a>
                </div>

                <div class="main_card b9">
                    <a href="../info/city.do?area=7">
                        <div class="main_bar">울산</div>
                    </a>
                </div>

                <div class="main_card b10">
                    <a href="../info/city.do?area=2">
                        <div class="main_bar">인천</div>
                    </a>
                </div>

                <div class="main_card b11">
                    <a href="../info/city.do?area=8">
                        <div class="main_bar">세종</div>
                    </a>
                </div>
            </div>

            <div class="main mt-3">
                <div class="main_card b12">
                    <a href="../info/city.do?area=33">
                        <div class="main_bar">충북</div>
                    </a>
                </div>

                <div class="main_card b13">
                    <a href="../info/city.do?area=34">
                        <div class="main_bar">충남</div>
                    </a>
                </div>

                <div class="main_card b14">
                    <a href="../info/city.do?area=35">
                        <div class="main_bar">경북</div>
                    </a>
                </div>

                <div class="main_card b15">
                    <a href="../info/city.do?area=36">
                        <div class="main_bar">경남</div>
                    </a>
                </div>

                <div class="main_card b16">
                    <a href="../info/city.do?area=37">
                        <div class="main_bar">전북</div>
                    </a>
                </div>

                <div class="main_card b17">
                    <a href="../info/city.do?area=38">
                        <div class="main_bar">전남</div>
                    </a>
                </div>

            </div>
        </div>
    </div>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../common/commonstyle.css?after" rel="stylesheet"/>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>


</head>
<body>
<!--계획 화면에선 헤더가 안들어가야됨-->

<!--이전 화면에서 input 값으로 여행 start day와 여행 end day 값을 가지고 옵니다. (start day가 더 작은지에 대한 유효성 검사가 필요합니다.)-->
<!--유효한 날짜값을 받았다면 end day - start day + 1 을 해서 일자 수를 계산합니다.-->
<!--계산한 일자수를 토대로 day1, day2... 등을 출력합니다.-->
<!--day1을 클릭하면 그 날짜의 장소를 검색하고 선택해서 가져오면, 빈칸에는 장소에 해당하는 지도가 출력됩니다.-->

<style>
    .row > * {
        padding-right: 0 !important;
        padding-left: 0 !important;
    }
    .scroll {
        overflow-y: auto;
        height: calc(100vh - 79px);
    }
    .test {
        width: calc(100% - 872px);
        /* 담은 장소를 못보게 하면 이 너비여야함 width: calc(100% - 492px); */
    }
    .plus, .delete {
        background: #fff;
        border: 0px;
        width: 30px;
        height: 30px;
        border-radius: 100%;
    }
</style>





<div class="container-fluid">
    <!--한줄로 정렬합니다.-->
    <div class="row">
        <!--여행 몇일차인지-->
        <div class="vh-100 d-flex flex-column bg-light" style="width: 7rem;">
            <a href="/" class="d-block p-3 link-dark text-decoration-none text-center" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Icon-only">
                일정
            </a>
            <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
                <li class="nav-item">
                    <a href="#" class="nav-link active py-3 border-bottom" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Home">
                        Day 1
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Dashboard">
                        Day 2
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Orders">
                        Day 3
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Products">
                        Day 4
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Customers">
                        Day 5
                    </a>
                </li>
            </ul>
            <div class="dropdown border-top">
                <a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none dropdown-toggle" id="dropdownUser3" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://github.com/mdo.png" alt="mdo" width="24" height="24" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser3">
                    <li><a class="dropdown-item" href="#">New project...</a></li>
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Sign out</a></li>
                </ul>
            </div>
        </div>




        <!--장소찾기-->
        <div class="d-flex flex-column align-items-stretch bg-white" style="width: 380px;">
            <a href="/" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
                <p class="fs-5 fw-semibold">도시명</p>
                <p class="fx-6">이전화면에서 선택한 날짜</p>
            </a>
            <div class="scroll list-group list-group-flush border-bottom scrollarea">
                <a href="#" class="list-group-item list-group-item-action active py-3 lh-tight" aria-current="true">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소1</strong>
                        <button class="plus">
                            <!--아이콘 눌러서 담기-->
                            <i class="bi bi-bookmark-plus"></i>
                        </button>

                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소2</strong>
                        <button class="plus">
                            <i class="bi bi-bookmark-plus"></i>
                        </button>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소3</strong>
                        <button class="plus">
                            <i class="bi bi-bookmark-plus"></i>
                        </button>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>

                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소4</strong>
                        <button class="plus">
                            <i class="bi bi-bookmark-plus"></i>
                        </button>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소5</strong>
                        <button class="plus">
                            <i class="bi bi-bookmark-plus"></i>
                        </button>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소6</strong>
                        <button class="plus">
                            <i class="bi bi-bookmark-plus"></i>
                        </button>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소7</strong>
                        <button class="plus">
                            <i class="bi bi-bookmark-plus"></i>
                        </button>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소8</strong>
                        <button class="plus">
                            <i class="bi bi-bookmark-plus"></i>
                        </button>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소9</strong>
                        <button class="plus">
                            <i class="bi bi-bookmark-plus"></i>
                        </button>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소10</strong>
                        <button class="plus">
                            <i class="bi bi-bookmark-plus"></i>
                        </button>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소11</strong>
                        <button class="plus">
                            <i class="bi bi-bookmark-plus"></i>
                        </button>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>
                <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">장소12</strong>
                        <button class="plus">
                            <i class="bi bi-bookmark-plus"></i>
                        </button>
                    </div>
                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                </a>
            </div>
        </div>


        <!--장소담기-->
        <div class="d-flex flex-column align-items-stretch bg-white" style="width: 380px;">
            <a href="/" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
                <p class="fs-5 fw-semibold">DAY1</p>
            </a>

            <!--버튼눌러서 담으면 이렇게 됩니다.-->
<%--            <div id="areabox" class="scroll list-group list-group-flush border-bottom scrollarea">--%>
<%--                <a href="#" class="list-group-item list-group-item-action active py-3 lh-tight" aria-current="true">--%>
<%--                    <div class="d-flex w-100 align-items-center justify-content-between">--%>
<%--                        <strong class="mb-1">장소1</strong>--%>
<%--                        <small>--%>
<%--                            <!--아이콘 눌러서 담기-->--%>
<%--                            <button id="deleteBtn" type="button" onclick="deleteRow(this);">
                                    <i class='bi bi-x-circle'></i>
                                </button>
<%--                        </small>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>

            <div id="areabox" class="scroll list-group list-group-flush border-bottom scrollarea">
            </div>
        </div>


        <!--지도가 들어갑니다. 영역 알아보기 쉬우라고 bg-dark 클래스를 줬습니다. 실제로 쓸 땐 빼면 됩니다.-->
        <div class="d-flex test bg-dark">
            <p class="text-white">여기는 지도가? 들어가겟죵?</p>
        </div>
    </div>

</div>

<script>
    // 아이콘 누르면 장소 담기에 추가하는 함수
    $(document).ready(function() {
        $('.plus').click(function() {
            const areaname = $(this).prev('strong').text();
            console.log(areaname);
            $("#areabox").append("<a href='#' class='list-group-item list-group-item-action py-3 lh-tight' aria-current='true'> <div class='d-flex w-100 align-items-center justify-content-between'> <strong class='mb-1'>" + areaname + "</strong> <button class='delete' type='button' onclick='deleteRow(this);'><i class='bi bi-x-circle'></i></button> </div> </a>")
        })
    })

    function deleteRow(ths) {
        var ths = $(ths);
        ths.closest("a").remove();
    }
</script>

</body>
</html>

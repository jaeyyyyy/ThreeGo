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
    <link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="common/commonstyle.css?after" rel="stylesheet"/>
    <title>Three Go</title>
</head>
<body>
<!-- header-->
<jsp:include page="common/searchheader.jsp"/>

<!-- Icons Grid-->
<section class="features-icons bg-light text-center">
    <div class="container">
        <div class="row">
            <h2 class="mb-5">당신의 여행을 시작하세요!</h2>
            <div class="col-lg-4">

                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                    <div class="features-icons-icon d-flex"><i class="bi-pin-map-fill m-auto text-primary"></i></div>
                    <h5>국내의 도시를 검색하세요.</h5>
                    <p class="mb-0">넣을 내용이 더 있으면 더 넣습니다.</p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                    <div class="features-icons-icon d-flex"><i class="bi-calendar-week m-auto text-primary"></i></div>
                    <h5>다른 여행자들의 일정을 확인하고,<br>나만의 일정을 계획해보세요.</h5>
                    <p class="mb-0"></p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="features-icons-item mx-auto mb-0 mb-lg-3">
                    <div class="features-icons-icon d-flex"><i class="bi-luggage-fill m-auto text-primary"></i></div>
                    <h5>여행자들과 여행정보를<br>공유하고, 질문해보세요.</h5>
                    <p class="mb-0"></p>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<!-- Image Cards-->
<!-- 대략적인 도시들을 나열합니다. 도시는 8개지만 '도'를 포함하면 총 17개(api기준)입니다. 일단은 8개만 나열했습니다.-->
<section class="bg-light text-center">
    <div class="container-fluid p-0">
        <div class="row row-cols-1 row-cols-md-4 g-4">
            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/seoul2.jpg" class="card-img-top rounded" alt="서울">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">서울</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/busan.png" class="card-img-top rounded" alt="부산">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">부산</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/jeju.jpg" class="card-img-top rounded" alt="제주">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">제주</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/daejeon.jpg" class="card-img-top rounded" alt="대전">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">대전</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/daegu.png" class="card-img-top rounded" alt="대구">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">대구</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/kunggi.jpg" class="card-img-top rounded" alt="경기도 수원">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">경기도</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/gwangju.jpg" class="card-img-top rounded" alt="광주">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">광주</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/gangwon.jpg" class="card-img-top rounded" alt="강원도">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">강원도</h4>
                    </div>
                </div>
            </div>

            <%--8개 더 --%>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/ulsan.jpg" width="100%" class="card-img-top rounded" alt="울산">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">울산</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/incheon.jpg" class="card-img-top rounded" alt="인천">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">인천</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/sejong.png" class="card-img-top rounded" alt="세종">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">세종</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/chungbuk.jpg" class="card-img-top rounded" alt="충북">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">충북</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/chungnam.jpg" class="card-img-top rounded" alt="충남">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">충남</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/kyungbuk.jpg" class="card-img-top rounded" alt="경북">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">경북</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/kyungnam.jpg" class="card-img-top rounded" alt="경남">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">경남</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/jeonrabukdo.jpg" class="card-img-top rounded" alt="전북">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">전북</h4>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card border-0">
                    <img src="../../../proj/resources/assets/img/mainimg/jeonranamdo.jpg" class="card-img-top rounded" alt="전남">
                    <div class="card-img-overlay">
                        <h4 class="card-title text-white text-center main_text">전남</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--footer-->
<jsp:include page="common/footer.jsp"/>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/script.js"></script>
</body>
</html>

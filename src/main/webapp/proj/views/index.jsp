<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css"
          type="text/css"/>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../resources/assets/css/style.css?after" rel="stylesheet"/>
    <link href="    common/commonstyle.css?after" rel="stylesheet"/>

    <!--swiper-->
    <link href="../resources/assets/swiper/swiper-bundle.min.css" rel="stylesheet" />
    <script src="../resources/assets/swiper/swiper-bundle.min.js"></script>
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
                    <h5>국내의 도시를 찾아보고,<br>관광 정보를 확인해보세요.</h5>
                    <p class="mb-0"></p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                    <div class="features-icons-icon d-flex"><i class="bi-calendar-week m-auto text-primary"></i></div>
                    <h5>다른 여행자들의 일정을 확인하고,<br>나만의 일정을 계획해보세요.</h5>
                    <p class="mb-0">coming soon... </p>
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

<section class="bg-light text-center">
    <div class="container">
        <div class="container-fluid p-0">
            <div class="row row-cols-1 row-cols-md-4 g-4">


                <h1 class="mb-5 sec2h2">이번 여행은 <br>어디로 <br>갈까요?</h1>
                <div class="col">
                    <a href="../../info/city.do?area=1">
                        <div class="card border-0">
                            <img src="../../../proj/resources/assets/img/mainimg/seoul2.jpg" class="card-img-top rounded" alt="서울">
                            <div class="card-img-overlay cardgradient">
                                <h4 class="card-title text-white text-center main_text">서울</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col">
                    <a href="../../info/city.do?area=6">
                        <div class="card border-0">
                            <img src="../../../proj/resources/assets/img/mainimg/busan.png" class="card-img-top rounded" alt="부산">
                            <div class="card-img-overlay cardgradient">
                                <h4 class="card-title text-white text-center main_text">부산</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col">
                    <a href="../../info/city.do?area=39">
                        <div class="card border-0">
                            <img src="../../../proj/resources/assets/img/mainimg/jeju.jpg" class="card-img-top rounded" alt="제주">
                            <div class="card-img-overlay cardgradient">
                                <h4 class="card-title text-white text-center main_text">제주</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col">
                    <a href="../../info/city.do?area=3">
                        <div class="card border-0">
                            <img src="../../../proj/resources/assets/img/mainimg/daejeon.jpg" class="card-img-top rounded" alt="대전">
                            <div class="card-img-overlay cardgradient">
                                <h4 class="card-title text-white text-center main_text">대전</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col">
                    <a href="../../info/city.do?area=4">
                        <div class="card border-0">
                            <img src="../../../proj/resources/assets/img/mainimg/daegu.png" class="card-img-top rounded" alt="대구">
                            <div class="card-img-overlay cardgradient">
                                <h4 class="card-title text-white text-center main_text">대구</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col">
                    <a href="../../info/city.do?area=9">
                        <div class="card border-0">
                            <img src="../../../proj/resources/assets/img/mainimg/kunggi.jpg" class="card-img-top rounded" alt="경기도 수원">
                            <div class="card-img-overlay cardgradient">
                                <h4 class="card-title text-white text-center main_text">경기도</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col">
                    <a href="../../info/city.do?area=5">
                        <div class="card border-0">
                            <img src="../../../proj/resources/assets/img/mainimg/gwangju.jpg" class="card-img-top rounded" alt="광주">
                            <div class="card-img-overlay cardgradient">
                                <h4 class="card-title text-white text-center main_text">광주</h4>
                            </div>
                        </div>
                    </a>
                </div>
            </div>



            <div class = "invisiblecard">
                <%--7개 이후 --%>
                <div class="row row-cols-1 row-cols-md-4 g-4 pt-4">
                    <div class="col">
                        <a href="../../info/city.do?area=32">
                            <div class="card border-0 ">
                                <img src="../../../proj/resources/assets/img/mainimg/gangwon.jpg" class="card-img-top rounded" alt="강원도">
                                <div class="card-img-overlay cardgradient">
                                    <h4 class="card-title text-white text-center main_text">강원도</h4>
                                </div>
                            </div>
                        </a>
                    </div>



                    <div class="col">
                        <a href="../../info/city.do?area=7">
                            <div class="card border-0 ">
                                <img src="../../../proj/resources/assets/img/mainimg/ulsan.jpg" width="100%" class="card-img-top rounded" alt="울산">
                                <div class="card-img-overlay cardgradient">
                                    <h4 class="card-title text-white text-center main_text">울산</h4>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="../../info/city.do?area=2">
                            <div class="card border-0 ">
                                <img src="../../../proj/resources/assets/img/mainimg/incheon.jpg" class="card-img-top rounded" alt="인천">
                                <div class="card-img-overlay cardgradient">
                                    <h4 class="card-title text-white text-center main_text">인천</h4>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="../../info/city.do?area=8">
                            <div class="card border-0 ">
                                <img src="../../../proj/resources/assets/img/mainimg/sejong.png" class="card-img-top rounded" alt="세종">
                                <div class="card-img-overlay cardgradient">
                                    <h4 class="card-title text-white text-center main_text">세종</h4>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="../../info/city.do?area=33">
                            <div class="card border-0 ">
                                <img src="../../../proj/resources/assets/img/mainimg/chungbuk.jpg" class="card-img-top rounded" alt="충북">
                                <div class="card-img-overlay cardgradient">
                                    <h4 class="card-title text-white text-center main_text">충북</h4>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="../../info/city.do?area=34">
                            <div class="card border-0 ">
                                <img src="../../../proj/resources/assets/img/mainimg/chungnam.jpg" class="card-img-top rounded" alt="충남">
                                <div class="card-img-overlay cardgradient">
                                    <h4 class="card-title text-white text-center main_text">충남</h4>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="../../info/city.do?area=35">
                            <div class="card border-0 ">
                                <img src="../../../proj/resources/assets/img/mainimg/kyungbuk.jpg" class="card-img-top rounded" alt="경북">
                                <div class="card-img-overlay cardgradient">
                                    <h4 class="card-title text-white text-center main_text">경북</h4>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="../../info/city.do?area=36">
                            <div class="card border-0 " >
                                <img src="../../../proj/resources/assets/img/mainimg/kyungnam.jpg" class="card-img-top rounded" alt="경남">
                                <div class="card-img-overlay cardgradient">
                                    <h4 class="card-title text-white text-center main_text">경남</h4>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="../../info/city.do?area=37">
                            <div class="card border-0 ">
                                <img src="../../../proj/resources/assets/img/mainimg/jeonrabukdo.jpg" class="card-img-top rounded" alt="전북">
                                <div class="card-img-overlay cardgradient">
                                    <h4 class="card-title text-white text-center main_text">전북</h4>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <a href="../../info/city.do?area=38">
                            <div class="card border-0 ">
                                <img src="../../../proj/resources/assets/img/mainimg/jeonranamdo.jpg" class="card-img-top rounded" alt="전남">
                                <div class="card-img-overlay cardgradient">
                                    <h4 class="card-title text-white text-center main_text">전남</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="pt-4">
                <button type="button" class="btn btn-primary2 " id="morebtn" >더보기</button>
            </div>
        </div>
    </div>
</section>

<!--footer-->
<jsp:include page="common/footer.jsp"/>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<%--카드 --%>
<script>
    // 버튼 누르면 더보기
    $(document).ready(function() {
        $("#morebtn").click(function() {
            $(".invisiblecard").slideToggle(500);
            if ($("#morebtn").html() == "더보기") {
                $("#morebtn").html("접기");
            } else {
                $("#morebtn").html("더보기");
            }
        });
    });
</script>
</body>
</html>
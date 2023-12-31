<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../../../proj/views/common/commonstyle.css" rel="stylesheet" />
    <!-- jquery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!--swiper-->
<%--    <link href="../../../proj/resources/assets/swiper/swiper-bundle.min.css" rel="stylesheet" />--%>
<%--    <script src="../../../proj/resources/assets/swiper/swiper-bundle.min.js"></script>--%>

    <script>

        const contentid = ${content.contentid};
        const contenttypeid = ${content.contenttypeid};
        const address = "${content.addr1}" + " " + "${content.addr2}";

        const endPoint = "https://apis.data.go.kr/B551011/KorService1/";
        const MobileOS = "ETC";
        const MobileApp = "TEST";
        const serviceKey = 'xsdYHhNhYtCKEIiJVyY0CXvA5xcMWGYz9rFAAjLhfr6a7xD82nXkq3gW7egZBeTAKAsSfbyj5v45%2BtNn32cHhQ%3D%3D';

        const altImag = '../../../proj/resources/assets/img/no_img.jpg'

        $(document).ready(function (){
            if(contenttypeid === 25){
                $('#carousel_grid').html("");
                $('#carousel_grid').removeClass("col-md-6");
                $('#map_grid').removeClass("col-md-6");
                $('#map_grid').addClass("col-md-12");
                map.relayout();
                map.setCenter(placePosition);
            }
            showImages();
            showOverview();
        })

        function calcDay(day1, day2){
            let diff = day1.getTime() - day2.getTime();
            diff = Math.ceil(diff / (1000 * 60 * 60 * 24));

            return diff
        }

        function showImages(){
            const searchType = 'detailImage1';
            const url = endPoint + searchType
                    + '?MobileOS=' + MobileOS
                    + '&MobileApp=' + MobileApp
                    + '&contentId=' + contentid
                    + '&imageYN=Y&subImageYN=Y&numOfRows=10'
                    + '&serviceKey=' + serviceKey
                    + '&_type=json'

            $.ajax({
                url : url,
                type: 'GET',
                dataType: 'json',
                success : function(data){
                    const images = data.response.body.items.item;
                    const noImg = Object.keys(data.response.body.items).length == 0;
                    let length = 0;
                    if(!noImg) length = Object.keys(images).length;
                    if(noImg){
                        $('.carousel-inner').html(
                            '<div class="carousel-item active">'
                            + '<img src="' + altImag + '" class="d-block w-100" alt="등록된 이미지가 없습니다.">'
                            + '</div>'
                        )
                    }else {
                        images.forEach(function (image, idx){
                            if(length === 1){
                                $('.carousel-inner').html(
                                    '<div class="carousel-item active">'
                                    + '<img src=' + image.originimgurl + ' class="d-block w-100" alt=' + image.imgname + '>'
                                    + '</div>'
                                )
                            }else {
                                if(idx === 0){
                                    $('.carousel-indicators').append(
                                        '<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>'
                                    )
                                    $('.carousel-inner').append(
                                        '<div class="carousel-item active" data-bs-interval="5000">'
                                        + '<img src=' + image.originimgurl + ' class="d-block w-100" alt=' + image.imgname + '>'
                                        + '</div>'
                                    )
                                }else if(idx > 0){
                                    $('.carousel-indicators').append(
                                        '<button type="button" data-bs-target="#myCarousel" data-bs-slide-to=' + idx + ' aria-label="Slide ' + (idx + 1) + '"></button>'
                                    )
                                    $('.carousel-inner').append(
                                        '<div class="carousel-item" data-bs-interval="5000">'
                                        + '<img src=' + image.originimgurl + ' class="d-block w-100" alt=' + image.imgname + '>'
                                        + '</div>'
                                    )
                                }
                            }
                        })
                    }
                }
                ,beforeSend:function(){
                    $('.wrap-loading').removeClass('display-none');
                }

                ,complete:function(){
                    setTimeout(function(){
                        $('.wrap-loading').addClass('display-none');
                    },1500);
                }
            })
        }

        function showOverview(){
            const searchType = 'detailCommon1';
            const url = endPoint + searchType
                + '?MobileOS=' + MobileOS
                + '&MobileApp=' + MobileApp
                + '&contentId=' + contentid
                + '&defaultYN=Y&overviewYN=Y'
                + '&serviceKey=' + serviceKey
                + '&_type=json'

            $.ajax({
                url : url,
                type: 'GET',
                dataType: 'json',
                success : function(data){
                    const info = data.response.body.items.item;
                    let overview = (info[0].overview === "" || info[0].overview === "-") ? "관련 데이터가 없습니다." : info[0].overview;
                    overview = overview.replaceAll("<br/>","");
                    overview = "&nbsp;" + overview.replaceAll("\n","<br/><br/>&nbsp;");
                    $('#overview').html(overview)
                    const homepage = info[0].homepage
                    showDetail(homepage)
                }
                ,beforeSend:function(){
                    $('.wrap-loading').removeClass('display-none');
                }

                ,complete:function(){
                    setTimeout(function(){
                        $('.wrap-loading').addClass('display-none');
                    },1500);
                }
            })
        }

        function showDetail(homepage){
            const searchType = 'detailIntro1';
            const url = endPoint + searchType
                + '?MobileOS=' + MobileOS
                + '&MobileApp=' + MobileApp
                + '&contentId=' + contentid
                + '&contentTypeId=' + contenttypeid
                + '&serviceKey=' + serviceKey
                + '&_type=json'

            $.ajax({
                url : url,
                type: 'GET',
                dataType: 'json',
                success : function(data){
                    const info = data.response.body.items.item;
                    let restdate = "";
                    let parking = "";
                    switch (contenttypeid){
                        case 12:
                            restdate = info[0].restdate === "" ? "연중무휴" : info[0].restdate;
                            parking = info[0].parking === "" ? "주차 불가" : info[0].parking;
                            let guide = info[0].expguide === "" ? "없음" : info[0].expguide;
                            let agerange = info[0].expagerange === "" ? "없음" : info[0].expagerange;
                            $('#detailInfo').append(
                                '<tr>'
                                + '<th width="10%">주소</th>'
                                + '<td width="40%">' + address + '</td>'
                                + '<th width="10%">관광안내원</th>'
                                + '<td width="40%">' + guide + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>이용문의</th>'
                                + '<td>' + info[0].infocenter  + '</td>'
                                + '<th>입장제한연령</th>'
                                + '<td>' + agerange + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>이용시간</th>'
                                + '<td>' + info[0].usetime + '</td>'
                                + '<th>수용인원</th>'
                                + '<td>' + info[0].accomcount  + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>휴무일</th>'
                                + '<td>' + restdate + '</td>'
                                + '<th>주차여부</th>'
                                + '<td>' + parking + '</td>'
                                +'</tr>'
                            )
                            if(homepage !== ""){
                                $('#detailInfo').append(
                                    '<tr>'
                                    + '<th>홈페이지</th>'
                                    + '<td colspan="3">' + homepage + '</td>'
                                    +'</tr>'
                                )
                            }
                            break;

                        case 14:
                            restdate = info[0].restdateculture === "" ? "연중무휴" : info[0].restdateculture;
                            parking = info[0].parkingculture === "" ? "주차 불가" : info[0].parkingculture;
                            $('#detailInfo').append(
                                '<tr>'
                                + '<th width="10%">주소</th>'
                                + '<td width="40%">' + address + '</td>'
                                + '<th width="10%">이용요금</th>'
                                + '<td width="40%">' + info[0].usefee + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>이용문의</th>'
                                + '<td>' + info[0].infocenterculture  + '</td>'
                                + '<th>관람소요시간</th>'
                                + '<td>' + info[0].spendtime + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>이용시간</th>'
                                + '<td>' + info[0].usetimeculture + '</td>'
                                + '<th>수용인원</th>'
                                + '<td>' + info[0].accomcountculture  + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>휴무일</th>'
                                + '<td>' + restdate + '</td>'
                                + '<th>주차여부</th>'
                                + '<td>' + parking + '</td>'
                                +'</tr>'
                            )
                            if(homepage !== ""){
                                $('#detailInfo').append(
                                    '<tr>'
                                    + '<th>홈페이지</th>'
                                    + '<td colspan="3">' + homepage + '</td>'
                                    +'</tr>'
                                )
                            }
                            break;

                        case 15:
                            // 축제 개최 기간 확인
                            let startDay = info[0].eventstartdate;
                            startDay = new Date(startDay.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'));

                            let endDay = info[0].eventenddate;
                            endDay = new Date(endDay.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'));

                            let today = new Date();

                            if(startDay > today){
                                $('#title').after("<h5 id='period'> D-" + calcDay(startDay, today) + "</h5>")
                            }else if(startDay <= today && endDay >= today){
                                $('#title').after("<h5 id='period'> 행사 " + (calcDay(today, startDay) + 1) + "일차 </h5>")
                            }else {
                                $('#title').after("<h5 id='period'> 종료된 행사 </h5>")
                            }

                            //상세 정보
                            let tel = "";
                            if(info[0].sponsor1tel !== "") tel += ("[주관] " + info[0].sponsor1tel)
                            if(info[0].sponsor1tel !== "" && info[0].sponsor2tel !== "") tel += ("<br/>")
                            if(info[0].sponsor2tel !== "") tel += ("[주최] " + info[0].sponsor2tel)
                            $('#detailInfo').append(
                                '<tr>'
                                + '<th width="10%">행사기간</th>'
                                + '<td width="40%">' + startDay.toLocaleDateString() + ' ~ ' + endDay.toLocaleDateString() + '</td>'
                                + '<th width="10%">공연시간</th>'
                                + '<td width="40%">' + info[0].playtime + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>장소</th>'
                                + '<td>' + info[0].eventplace + '<br/>(' + address  + ')</td>'
                                + '<th>이용요금</th>'
                                + '<td>' + info[0].usetimefestival + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>주관</th>'
                                + '<td>' + info[0].sponsor1 + '</td>'
                                + '<th>입장제한연령</th>'
                                + '<td>' + info[0].agelimit + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>주최</th>'
                                + '<td>' + info[0].sponsor2 + '</td>'
                                + '<th>예매</th>'
                                + '<td>' + info[0].bookingplace + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>이용문의</th>'
                                + '<td>' + tel + '</td>'
                                + '<th>위치 안내</th>'
                                + '<td>' + info[0].placeinfo + '</td>'
                                +'</tr>'
                            )
                            if(homepage !== ""){
                                $('#detailInfo').append(
                                    '<tr>'
                                    + '<th>홈페이지</th>'
                                    + '<td colspan="3">' + homepage + '</td>'
                                    +'</tr>'
                                )
                            }
                            break;

                        case 25:
                            $('#detailInfo').append(
                                '<tr>'
                                + '<th width="10%">코스 테마</th>'
                                + '<td width="40%">${cat3_name}</td>'
                                + '<th width="10%">코스 총 거리</th>'
                                + '<td width="40%">' + info[0].distance + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>주소</th>'
                                + '<td>' + address  + '</td>'
                                + '<th>소요시간</th>'
                                + '<td>' + info[0].taketime + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>문의 및 안내</th>'
                                + '<td>' + info[0].infocentertourcourse + '</td>'
                                +'</tr>'
                            )

                            break;

                        case 28:
                            restdate = info[0].restdateleports === "" ? "연중무휴" : info[0].restdateleports;
                            parking = info[0].parkingleports === "" ? "주차 불가" : info[0].parkingleports;
                            $('#detailInfo').append(
                                '<tr>'
                                + '<th width="10%">주소</th>'
                                + '<td width="40%">' + address  + '</td>'
                                + '<th width="10%">휴무일</th>'
                                + '<td width="40%">' + restdate + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>문의 및 안내</th>'
                                + '<td>' + info[0].infocenterleports + '</td>'
                                + '<th>주차여부</th>'
                                + '<td>' + parking + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>이용요금</th>'
                                + '<td>' + info[0].usefeeleports + '</td>'
                                + '<th>이용시간</th>'
                                + '<td>' + info[0].usetimeleports + '</td>'
                                +'</tr>'
                            )
                            if(homepage !== ""){
                                $('#detailInfo').append(
                                    '<tr>'
                                    + '<th>홈페이지</th>'
                                    + '<td colspan="3">' + homepage + '</td>'
                                    +'</tr>'
                                )
                            }
                            break;
                        case 32:
                            parking = info[0].parkinglodging === "" ? "주차 불가" : info[0].parkinglodging;
                            $('#detailInfo').append(
                                '<tr>'
                                + '<th width="10%">주소</th>'
                                + '<td width="40%">' + address  + '</td>'
                                + '<th>객실유형</th>'
                                + '<td>' + info[0].roomtype + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>문의 및 안내</th>'
                                + '<td>' + info[0].infocenterlodging + '</td>'
                                + '<th width="10%">체크인</th>'
                                + '<td width="40%">' + info[0].checkintime + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>예약안내</th>'
                                + '<td>' + info[0].reservationlodging + '</td>'
                                + '<th>체크아웃</th>'
                                + '<td>' + info[0].checkouttime + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>부대시설</th>'
                                + '<td>' + info[0].subfacility + '</td>'
                                + '<th>주차여부</th>'
                                + '<td>' + parking + '</td>'
                                +'</tr>'
                            )
                            if(homepage !== ""){
                                $('#detailInfo').append(
                                    '<tr>'
                                    + '<th>홈페이지</th>'
                                    + '<td colspan="3">' + homepage + '</td>'
                                    +'</tr>'
                                )
                            }
                            break;
                        case 38:
                            restdate = info[0].restdateshopping === "" ? "연중무휴" : info[0].restdateshopping;
                            parking = info[0].parkingshopping === "" ? "주차 불가" : info[0].parkingshopping;
                            $('#detailInfo').append(
                                '<tr>'
                                + '<th width="10%">판매품목</th>'
                                + '<td width="40%">' + info[0].saleitem + '</td>'
                                + '<th width="10%">운영시간</th>'
                                + '<td width="40%">' + info[0].opentime + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>주소</th>'
                                + '<td>' + address  + '</td>'
                                + '<th>휴무일</th>'
                                + '<td>' + restdate + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>전화번호</th>'
                                + '<td>' + info[0].infocentershopping + '</td>'
                                + '<th>주차여부</th>'
                                + '<td>' + parking + '</td>'
                                +'</tr>'
                            )
                            if(homepage !== ""){
                                $('#detailInfo').append(
                                    '<tr>'
                                    + '<th>홈페이지</th>'
                                    + '<td colspan="3">' + homepage + '</td>'
                                    +'</tr>'
                                )
                            }
                            break;

                        case 39:
                            restdate = info[0].restdatefood === "" ? "연중무휴" : info[0].restdatefood;
                            parking = info[0].parkingfood === "" ? "주차 불가" : info[0].parkingfood;
                            $('#detailInfo').append(
                                '<tr>'
                                + '<th width="10%">분류</th>'
                                + '<td width="40%">${cat3_name}</td>'
                                + '<th width="10%">포장</th>'
                                + '<td width="40%">' + info[0].packing + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>대표메뉴</th>'
                                + '<td>' + info[0].firstmenu  + '</td>'
                                + '<th>영업시간</th>'
                                + '<td>' + info[0].opentimefood + '</td>'
                                +'</tr>'
                                +'<tr>'
                                + '<th>메뉴</th>'
                                + '<td>' + info[0].treatmenu + '</td>'
                                + '<th>휴무일</th>'
                                + '<td>' + restdate + '</td>'
                                +'</tr>'
                                + '<th>주소</th>'
                                + '<td>' + address + '</td>'
                                + '<th>카드사용여부</th>'
                                + '<td>' + info[0].chkcreditcardfood + '</td>'
                                +'</tr>'
                                + '<th>전화번호</th>'
                                + '<td>' + info[0].infocenterfood + '</td>'
                                + '<th>주차여부</th>'
                                + '<td>' + parking + '</td>'
                                +'</tr>'
                            )
                            if(homepage !== ""){
                                $('#detailInfo').append(
                                    '<tr>'
                                    + '<th>홈페이지</th>'
                                    + '<td colspan="3">' + homepage + '</td>'
                                    +'</tr>'
                                )
                            }
                    }

                    const moreItem = ${moreItem};
                    switch (contenttypeid){
                        case 25:
                            $('#sub-title').html('코스 안내')
                            moreItem.forEach(function (cosItem){
                                $('#sub-items-wrap').append(
                                    '<div class="card sub-item">'
                                    + '<a href="../info/content.do?contentid=' + cosItem.subcontentid + '">'
                                    + '<img src="' + cosItem.subimage + '" class="card-img-top" alt="...">'
                                    + '<div class="card-body">'
                                    + '<p class="card-text">' + cosItem.subname + '</p>'
                                    + '</div>'
                                    + '</a>'
                                    + '</div>'
                                )
                            })

                            break;

                        default:
                            $('#sub-title').html('동일 카테고리의 주변 관광지 추천')
                            moreItem.forEach(function (cosItem){
                                $('#sub-items-wrap').append(
                                    '<div class="card sub-item">'
                                    + '<a href="../info/content.do?contentid=' + cosItem.contentid + '">'
                                    + '<img src="' + cosItem.subimage + '" class="card-img-top" alt="...">'
                                    + '<div class="card-body">'
                                    + '<p class="card-text">' + cosItem.title + '</p>'
                                    + '</div>'
                                    + '</a>'
                                    + '</div>'
                                )
                            })

                            break;
                    }
                }
                ,beforeSend:function(){
                    $('.wrap-loading').removeClass('display-none');
                }

                ,complete:function(){
                    setTimeout(function(){
                        $('.wrap-loading').addClass('display-none');
                    },1500);
                }
            })
        }

    </script>
    <script>
        let distance = 0;

        function slideItem(btn){
            const direction = $(btn).val();
            const width = parseFloat($('#sub-items').css('width'));
            const wrapWidth = (width - 40)/5 * ${moreItem}.length + 10 * ${moreItem}.length  - 18
            if(direction === 'left'){
                distance += (width - 40)/5 + 8;
                if(distance > 0) distance = 0
            }else if(direction === 'right'){
                distance -= (width - 40)/5 + 8;
                if(Math.abs(distance) > (wrapWidth - width)) distance = -(wrapWidth - width);
            }
            $('#sub-items-wrap').css("transform", "translateX(" + distance + "px)");

            if(distance === 0){
                $('.btn-slide-left').addClass('hide');
            }else if(distance === -(wrapWidth - width)){
                $('.btn-slide-right').addClass('hide');
            }else {
                $('.btn-slide-left').removeClass('hide');
                $('.btn-slide-right').removeClass('hide');
            }
        }

    </script>
    <style>
        #myCarousel{
            height: 400px;
        }

        #myCarousel img{
            height: 400px;
            object-fit: cover;
        }

        #wrap{
            width: 1200px;
            margin: 0 auto;
        }

        th, td{
            vertical-align: top;
            padding: 10px;
        }

        #sub-items{
            width: 100%;
            position: relative;
        }
        #sub-items-container{
            width: 100%;
            overflow: hidden;
        }
        #sub-items-wrap{
            display: flex;
            padding: 20px 5px;
            flex-wrap: nowrap;
            gap: 10px;
            transition: 0.3s ease-in-out;
        }
        .sub-item{
            flex-basis: calc((100% - 40px)/5);
            flex-shrink: 0;
        }
        .btn-slide{
            position: absolute;
            width: 60px;
            height: 60px;
            background-color: transparent;
            border: 0;
            outline: 0;
        }
        .btn-slide-left{
            top:calc(50% - 40px);
            left:-60px;
        }
        .btn-slide-right{
            top:calc(50% - 40px);
            right:-60px;
        }
        .icon-arrow{
            color: #333333;
            font-size: 50px;
        }
        .hide{
            visibility: hidden;
        }

        .title-box{
            display: flex;
            align-items: flex-end;
            gap: 20px;
            padding: 50px 0 0;
        }
        #period{
            background-color: #333333;
            color: #FFFFFF;
            padding: 8px;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: -1px;
            border-radius: 10px;
        }
        #category{
            font-weight: 500;
            color: #333333;
        }
        .row{
            padding: 20px 0;
        }
        .sub-title{
            padding: 10px 0;
        }

        .wrap-loading{ /*화면 전체를 어둡게 합니다.*/
            position: fixed;
            z-index: 100;
            left:0;
            right:0;
            top:0;
            bottom:0;
            background: rgba(0,0,0,0.2); /*not in ie */
            filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',endColorstr='#20000000');    /* ie */
        }
        .wrap-loading div{ /*로딩 이미지*/
            position: fixed;
            z-index: 300;
            top:50%;
            left:50%;
            width: 100px;
            height: 100px;
            margin-left: -21px;
            margin-top: -21px;
        }
        .wrap-loading div>img{
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .display-none{ /*감추기*/
            display:none;
        }

    </style>
    <style>
        #container {overflow:hidden; width:100%; height:400px;position:relative;}
        #btnRoadview,  #btnMap {position:absolute;top:5px;left:5px;padding:7px 12px;font-size:14px;border: 1px solid #dbdbdb;background-color: #fff;border-radius: 2px;box-shadow: 0 1px 1px rgba(0,0,0,.04);z-index:1;cursor:pointer;}
        #btnRoadview:hover,  #btnMap:hover{background-color: #fcfcfc;border: 1px solid #c1c1c1;}
        #container.view_map #mapWrapper {z-index: 10;}
        #container.view_map #btnMap {display: none;}
        #container.view_roadview #mapWrapper {z-index: 0;}
        #container.view_roadview #btnRoadview {display: none;}
    </style>

    <title>관광지 정보 | 3GO</title>
</head>
<body>

<div class="wrap-loading display-none">
    <div><img src="../../../proj/resources/assets/img/loading.gif" /></div>
</div>
<!-- header-->
<jsp:include page="../common/header.jsp"/>
<div id="wrap">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="title-box">
                    <h3 id="title">${title}</h3>
                </div>
                <div id="category">${category}</div>
                <div class="row" id="row1">
                    <%-- 캐러셀 --%>
                    <div id="carousel_grid" class="col-md-6">
                        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
                            <%-- indicators --%>
                            <div class="carousel-indicators"></div>
                            <%-- 이미지 --%>
                            <div class="carousel-inner"></div>

                            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                    <%-- 지도 --%>
                    <div id="map_grid" class="col-md-6">
                        <div id="container" class="view_map">
                            <div id="mapWrapper" style="width:100%;height:400px;position:relative;">
                                <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
                                <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰">
                            </div>
                            <div id="rvWrapper" style="width:100%;height:400px;position:absolute;top:0;left:0;">
                                <div id="roadview" style="height:100%"></div> <!-- 로드뷰를 표시할 div 입니다 -->
                                <input type="button" id="btnMap" onclick="toggleMap(true)" title="지도 보기" value="지도">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <%-- 소개 --%>
                    <div class="col-md-12">
                        <h4 class="sub-title"> 소개 </h4>
                        <div id="overview"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="sub-title">상세정보</h4>
                        <table border="1" width="100%" id="detailInfo">
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h4 id="sub-title"></h4>
                        <div id="sub-items">
                            <div id="sub-items-container">
                                <div id="sub-items-wrap"></div>
                            </div>
                            <c:if test="${fn:length(moreItem) > 5 or fn:length(subItemList) > 5}">
                                <button class="btn-slide btn-slide-left hide" value="left" onclick="slideItem(this)"><i class="fa-solid fa-chevron-left icon-arrow"></i></button>
                                <button class="btn-slide btn-slide-right" value="right" onclick="slideItem(this)"><i class="fa-solid fa-chevron-right icon-arrow"></i></button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a523b773771c7b31ef741ad7e52ee9c"></script>
<script>
    var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
        mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
        btnRoadview = document.getElementById('btnRoadview'), // 지도 위의 로드뷰 버튼, 클릭하면 지도는 감춰지고 로드뷰가 보입니다
        btnMap = document.getElementById('btnMap'), // 로드뷰 위의 지도 버튼, 클릭하면 로드뷰는 감춰지고 지도가 보입니다
        rvContainer = document.getElementById('roadview'), // 로드뷰를 표시할 div 입니다
        mapContainer = document.getElementById('map'); // 지도를 표시할 div 입니다

    if(contenttypeid === 25){
        // 마커 배열
        var markers = [];
        // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
        var linePath = [];

        // 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표입니다
        var placePosition = new kakao.maps.LatLng(${content.mapy}, ${content.mapx});

        // 지도 옵션입니다
        var mapOption = {
            center: placePosition, // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow();

        // 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);

        let positions = ${subItemList};

        displayPlaces(positions);

        // 지도에 표시할 선을 생성합니다
        var polyline = new kakao.maps.Polyline({
            path: linePath, // 선을 구성하는 좌표배열 입니다
            strokeWeight: 3, // 선의 두께 입니다
            strokeColor: '#ff0000', // 선의 색깔입니다
            strokeOpacity: 0.9, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });

        // 지도에 선을 표시합니다
        polyline.setMap(map);

        // 함수

        // 검색 결과 목록과 마커를 표출하는 함수입니다
        function displayPlaces(places) {

            var bounds = new kakao.maps.LatLngBounds();

            // 지도에 표시되고 있는 마커를 제거합니다
            removeMarker();

            for ( var i=0; i<places.length; i++ ) {

                // 마커를 생성하고 지도에 표시합니다
                var placePosition = new kakao.maps.LatLng(places[i].mapy, places[i].mapx),
                    marker = addMarker(placePosition, i);

                linePath.push(placePosition);

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                bounds.extend(placePosition);

                // 마커와 검색결과 항목에 mouseover 했을때
                // 해당 장소에 인포윈도우에 장소명을 표시합니다
                // mouseout 했을 때는 인포윈도우를 닫습니다
                (function(marker, title) {
                    kakao.maps.event.addListener(marker, 'mouseover', function() {
                        displayInfowindow(marker, title);
                    });

                    kakao.maps.event.addListener(marker, 'mouseout', function() {
                        infowindow.close();
                    });

                })(marker, places[i].title);
            }
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
        }

        // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
        function addMarker(position, idx, title) {
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                imgOptions =  {
                    spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                    spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                    offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                },
                markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                    position: position, // 마커의 위치
                    image: markerImage
                });

            marker.setMap(map); // 지도 위에 마커를 표출합니다
            markers.push(marker);  // 배열에 생성된 마커를 추가합니다

            return marker;
        }

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
        function removeMarker() {
            for ( var i = 0; i < markers.length; i++ ) {
                markers[i].setMap(null);
            }
            markers = [];
        }

        // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
        // 인포윈도우에 장소명을 표시합니다
        function displayInfowindow(marker, title) {
            var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

            infowindow.setContent(content);
            infowindow.open(map, marker);
        }

    }else {
        // 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표입니다
        var placePosition = new kakao.maps.LatLng(${content.mapy}, ${content.mapx});

        // 지도 옵션입니다
        var mapOption = {
            center: placePosition, // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

        // 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);


        // 지도 중심을 표시할 마커를 생성하고 특정 장소 위에 표시합니다
        var mapMarker = new kakao.maps.Marker({
            position: placePosition,
            map: map
        });

        var iwContent = '<div style="padding:5px; font-size:15px">${title}<br><a href="https://map.kakao.com/link/map/${title},${content.mapy},${content.mapx}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${content.title},${content.mapy},${content.mapx}" style="color:blue" target="_blank">길찾기</a></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            position : position,
            content : iwContent
        });

        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
        infowindow.open(map, mapMarker);
    }

    // 로드뷰 객체를 생성합니다
    var roadview = new kakao.maps.Roadview(rvContainer);

    var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

    var position = new kakao.maps.LatLng(${content.mapy}, ${content.mapx});

    // 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
    roadviewClient.getNearestPanoId(position, 50, function(panoId) {
        if(panoId == null){
            btnRoadview.style.display = 'none';
        }
        roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
    });

    // 로드뷰 초기화가 완료되면
    kakao.maps.event.addListener(roadview, 'init', function() {

        // 로드뷰에 특정 장소를 표시할 마커를 생성하고 로드뷰 위에 표시합니다
        var rvMarker = new kakao.maps.Marker({
            position: placePosition,
            map: roadview
        });
    });

    // 지도와 로드뷰를 감싸고 있는 div의 class를 변경하여 지도를 숨기거나 보이게 하는 함수입니다
    function toggleMap(active) {
        if (active) {

            // 지도가 보이도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
            container.className = "view_map"
        } else {

            // 지도가 숨겨지도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
            container.className = "view_roadview"
        }
    }
</script>
</body>
</html>

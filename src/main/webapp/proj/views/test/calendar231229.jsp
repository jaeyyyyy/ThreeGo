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
    <!-- bootstrap datepicker cdn -->
    <!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
    <!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/css/bootstrap-datepicker.min.css" integrity="sha512-34s5cpvaNG3BknEWSuOncX28vz97bRI59UnVtEEpFX536A7BtZSJHsDyFoCl8S7Dt2TPzcrCEoHBGeM4SUBDBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/js/bootstrap-datepicker.min.js" integrity="sha512-LsnSViqQyaXpD4mBBdRYeP6sRwJiJveh2ZIbW41EBrNmKxgr/LFZIiWT6yr+nycvhvauz8c2nYMhrP80YhG7Cw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>Title</title>


    <style>
        i.bi.bi-calendar {
            position: absolute;
            top: 14px;
        }
        #fa-1 {
            left: calc(50% - 40px);
        }

        #fa-2 {
            left: calc(100% - 40px);
        }
        input {
            padding: 10px 15px !important;
            border: 1px solid lightgrey !important;
            border-radius: 10px;
            box-sizing: border-box;
            background-color: #fff !important;
            color: #2C3E50;
            font-size: 14px;
            letter-spacing: 1px;
            position: relative;
        }

        input:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            border: 1px solid #512DA8;
            outline-width: 0;
        }

        ::placeholder {
            color: #BDBDBD;
            opacity: 1;
        }

        :-ms-input-placeholder {
            color: #BDBDBD;
        }

        ::-ms-input-placeholder {
            color: #BDBDBD;
        }

        button:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            outline-width: 0;
        }

        .datepicker {
            background-color: #fff;
            border: none;
            border-radius: 0 !important;
        }

        .datepicker-dropdown {
            top: 0;
            left: 0;
        }

        .datepicker table tr td.today, span.focused {
            border-radius: 50% !important;
            background-image: linear-gradient(#FFF3E0, #FFE0B2);
        }

        .datepicker table tr td.today.range {
            background-image: linear-gradient(#eeeeee, #eeeeee) !important;
            border-radius: 0 !important;
        }

        /*Weekday title*/
        thead tr:nth-child(3) th {
            font-weight: bold !important;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .dow, .old-day, .day, .new-day {
            width: 40px !important;
            height: 40px !important;
            border-radius: 0px !important;
        }

        .old-day:hover, .day:hover, .new-day:hover, .month:hover, .year:hover, .decade:hover, .century:hover {
            border-radius: 50% !important;
            background-color: #eee;
        }

        .active {
            border-radius: 50% !important;
            background-image: linear-gradient(#90CAF9, #64B5F6) !important;
            color: #fff !important;
        }

        .range-start, .range-end {
            border-radius: 50% !important;
            background-image: linear-gradient(#FFA726, #FFA726) !important;
        }

        .prev, .next, .datepicker-switch {
            border-radius: 0 !important;
            padding: 10px 10px 10px 10px !important;
            text-transform: uppercase;
            font-size: 14px;
            opacity: 0.8;
        }

        .prev:hover, .next:hover, .datepicker-switch:hover {
            background-color: inherit !important;
            opacity: 1;
        }

        .btn-black {
            background-color: #37474F !important;
            color: #fff !important;
            width: 100%;
        }

        .btn-black:hover {
            color: #fff !important;
            background-color: #000 !important;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="sub-header">
    <div class="container pt-5 pl-5">
        <h3 class="display-6 text-white">캘린더 샘플</h3>
    </div>
</div>

<div class="container px-1 px-sm-5 mx-auto">
    <form autocomplete="off">
        <div class="flex-sm-row flex-column d-flex">
            <div class="col-sm-9 col-12 px-0 mb-2">
                <div class="input-group input-daterange">
                    <input id="start" type="text" class="form-control" placeholder="Arriving Date" onchange="test()" readonly>
                    <i class="bi bi-calendar" id="fa-1"></i>
                    <input id="end" type="text" class="form-control" placeholder="Leaving Date" onchange="test()" readonly>
                    <i class="bi bi-calendar" id="fa-2"></i>
                </div>
            </div>
            <div class="col-sm-3 col-12 px-0">
                <button type="submit" class="btn btn-black">Search</button>
            </div>
        </div>
    </form>
</div>
<div class="result"></div>
<script>
    $(document).ready(function(){

        $('.input-daterange').datepicker({
            format: 'yyyy-mm-dd',
            todayHighlight: true,
            startDate: '0d'
        });

    });

    function test() {
        // 시작일 value 가져오기
        const startday = document.getElementById('start').value;
        document.querySelector('.result').innerText = startday;

        // 종료일 value 가져오기
        const endday = document.getElementById('end').value;
        document.querySelector('.result').innerText = endday;
    }


</script>





</body>
</html>

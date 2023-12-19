<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>

        const contentid = ${content.contentid};

        const endPoint = "https://apis.data.go.kr/B551011/KorService1/";
        const MobileOS = "ETC";
        const MobileApp = "TEST";
        const serviceKey = 'xsdYHhNhYtCKEIiJVyY0CXvA5xcMWGYz9rFAAjLhfr6a7xD82nXkq3gW7egZBeTAKAsSfbyj5v45%2BtNn32cHhQ%3D%3D';

        const altImag = '../../../proj/resources/assets/img/no_img.jpg'

        $(document).ready(function (){
            showImages();
            // var myCarousel = document.querySelector('#myCarousel')
            // var carousel = new bootstrap.Carousel(myCarousel, {})
        })

        function showImages(){
            const searchType = 'detailImage1';
            const url = endPoint + searchType
                    + '?MobileOS=' + MobileOS
                    + '&MobileApp=' + MobileApp
                    + '&contentId=' + contentid
                    + '&imageYN=Y&subImageYN=Y&numOfRows=5'
                    + '&serviceKey=' + serviceKey
                    + '&_type=json'

            console.log(url);

            $.ajax({
                url : url,
                type: 'GET',
                dataType: 'json',
                success : function(data){
                    const images = data.response.body.items.item;
                    if(Object.keys(images).length === 0){
                        $('.carousel-inner').html(
                            '<div class="carousel-item active">'
                            + '<img src=' + altImag + ' class="d-block w-100" alt="등록된 이미지가 없습니다.">'
                            + '</div>'
                        )
                    }else if(Object.keys(images).length === 1){
                        $('.carousel-inner').html(
                            '<div class="carousel-item active">'
                            + '<img src="${content.firstimage}" class="d-block w-100" alt="${content.title}">'
                            + '</div>'
                        )
                    }else if(Object.keys(images).length > 1){
                        images.forEach(function (image, idx){
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
                        })
                    }

                }
            })
        }

    </script>
    <style>
        #myCarousel{
            width: 600px;
            height: 400px;
        }
        #wrap{
            width: 1200px;
            margin: 0 auto;
        }
    </style>

    <title>관광지 정보 | 3GO</title>
</head>
<body>
<div id="wrap">
    <h2>${content.title}</h2>
    ${content.contenttypeid}
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


</body>
</html>

<%@ page import="com.DAO.BoardDAO" %>
<%@ page import="com.DTO.BoardDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../../proj/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../proj/resources/assets/css/style.css?after" rel="stylesheet" />
    <link href="../../proj/views/common/commonstyle.css?after" rel="stylesheet"/>
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>게시판 글 상세보기</title>
</head>
<body>
<script>

    $(document).ready(function (){
        regComment();
        clickReply();
        regReply();
        clickDelete();
        clickEdit();
    })


    function deletePost(){
        var confirmed = confirm("정말 삭제하시겠습니까?");
        if (confirmed) {
            var form = document.writeFrm;
            form.method = "post";
            form.action = "../community/del.do?mode=delete&b_id=${param.b_id}";
            form.submit();
        }else {
            alert("취소하였습니다.")
        }
    }

    function clickReply(){
        $('.btn-reply').click(function (e) {
            if(${sessionScope.u_id == null}){
                alert("댓글은 로그인 후 작성할 수 있습니다.")
                location.href = "/login.do"
            }else{
                const num = e.target.value;
                const selectedReply = '#reply-box' + num;
                if($(selectedReply).hasClass('hide')){
                    $('.reply-box').addClass('hide');
                    $(selectedReply).toggleClass('hide');
                }else {
                    $(selectedReply).addClass('hide');
                }
            }
        })
    }

    function clickDelete(){
        let url = '/community/reply_del.do'
        $('.btn-delete').click(function (e) {
            const num = e.target.value;
            var confirmed = confirm("정말 삭제하시겠습니까?");
            if (confirmed) {
                $.ajax({
                    url: url,
                    type: 'GET',
                    data: {
                        re_num: $('#re_num' + num).val()
                    },
                    success: function (){
                        alert("삭제되었습니다.");
                        location.reload(true);
                    }
                })
            }else {
                alert("취소하였습니다.")
            }
        })
    }

    function clickEdit(){
        $('.btn-edit').click(function (e) {
            const num = e.target.value;
            const content = $('#reply-content'+num).html();
            $('#reply-wrap'+num).html(
                '<div class="input-group mb-3 reply-box" id="edit-box' + num + '">'
                + '<div class="form-floating" style=" margin-top: 10px">'
                + '<textarea class="form-control" placeholder="Leave a comment here" id="edit-text' + num + '" style="height: 100px">' + content + '</textarea>'
                + '<label class="reply-label" for="edit-text' + num + '">수정 중인 댓글</label>'
                + '</div>'
                + '<button class="btn btn-outline-secondary edit-btn" type="button" value="' + num + '" onclick="editReply(' + num + ')" style="margin-top: 10px">수정</button>'
                + '</div>'
            );
        })
    }

    function editReply(num){
        let url = '/community/reply_edit.do'

            $.ajax({
                url: url,
                type: 'GET',
                data: {
                    re_num: $('#re_num' + num).val(),
                    edit_content: $('#edit-text' + num).val()
                },
                success: function (){
                    alert("수정 되었습니다.");
                    location.reload(true);
                },
                error: function (){
                    alert("수정이 정상적으로 이루어지지 않았습니다.");
                }
            })

    }

    function regReply(){
        let url = '/community/reply.do'
        const loginedId = '${sessionScope.u_id}'
        $('.reply-btn').click(function (e) {
            const num = e.target.value;
            if(loginedId === null){
                alert("댓글은 로그인 후 작성할 수 있습니다.")
                location.href = "/login.do"
            }else if($('#reply-text' + num).val() === ""){
                alert("내용을 입력해주십시오.")
            }else{
                $.ajax({
                    url: url,
                    type: 'POST',
                    contentType: 'application/json; charset=UTF-8',
                    dataType: 'text',
                    data: JSON.stringify({
                        b_id: $('input[name=b_id]').val(),
                        content: $('#reply-text' + num).val(),
                        re_num: $('#re_num' + num).val(),
                        re_ref: $('#re_ref' + num).val(),
                        re_order: $('#re_order' + num).val(),
                        re_level: $('#re_level' + num).val()
                    }),
                    success: function (data) {
                        location.reload(true);
                    },
                    error:function(request,status,error){
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                })
            }
        })
    }

    function regComment() {
        let url = '/community/comment.do'
        const loginedId = '${sessionScope.u_id}'
        $('#comment-btn').click(function () {
            if(loginedId === ""){
                alert("댓글은 로그인 후 작성할 수 있습니다.")
                location.href = "/login.do"
            }else if($('#comment-text').val() === ""){
                alert("내용을 입력해주십시오.")
            }else{
                $.ajax({
                    url: url,
                    type: 'POST',
                    contentType : 'application/json; charset=UTF-8',
                    dataType: 'text',
                    data : JSON.stringify({
                        b_id: $('input[name=b_id]').val(),
                        content: $('#comment-text').val()
                    }),
                    success : function (data){
                        console.log(data)
                        location.reload(true);
                        /*console.log(data)
                        let replyList = data.replyList;
                        let total = data.total
                        let login_id = '{sessionScope.u_id}';
                        console.log("통신 성공")
                        console.log(total);

                        $('#comment-text').val("");

                        $('#reply-total').html(
                            '<p>댓글 ' + total + '개</p>'
                        )
                        $('#reply-list').html("");
                        replyList.forEach(function (reply, no){
                            $('#reply-list').append('<div class="reply" style="margin-left: ' + (reply.re_level * 50) + 'px">')
                            if(reply.re_del === 'N'){
                                $('#reply-list').append(
                                    '<div class="reply-img"><img src="../../../upload/' + reply.u_sfile + '"></div>'
                                    + '<div class="reply-content">'
                                    + '<div class="reply-profile">'
                                    + '<p class="reply-nickname">' + reply.u_name + '</p>'
                                )
                                if(reply.re_modifydate == null){
                                    $('#reply-list').append(
                                        '<p class="reply-date">' + reply.re_regdate + '</p>'
                                    )
                                }else {
                                    $('#reply-list').append(
                                        '<p class="reply-date">' + reply.re_modifydate + '</p>'
                                    )
                                }
                                $('#reply-list').append('</div>')

                                if(login_id === reply.u_id){
                                    $('#reply-list').append(
                                        + '<div class="reply-btn-grop">'
                                        + '<button type="button" class="btn btn-edit">수정</button>'
                                        + '<button type="button" class="btn btn-delete">삭제</button>'
                                        + '</div>'
                                    )
                                }
                                $('#reply-list').append(
                                    + '</div>'
                                    + '<div class="reply-text">' + reply.re_content + '</p></div>'
                                    + '</div>'
                                )
                            }else if(reply.re_del === 'Y') {
                                $('#reply-list').append(
                                    '<div class="deleted-reply">'
                                    + '<p>삭제된 댓글 입니다.</p>'
                                    + '</div>'
                                    + '</div>'
                                )
                            }
                        })*/
                    }
                })
            }
        })
    }
    function clickLike(){
        const loginedId = '${sessionScope.u_id}'
        if(loginedId === ""){
            alert('로그인 후 이용하실 수 있습니다.');
            location.href = "/login.do";
        }else {
            $.ajax({
                url: '/like.do',
                type: 'GET',
                contentType: 'application/json; charset=UTF-8',
                data: {
                    b_id: ${dto.b_id},
                    check: $('input[name=like-check]').val()
                },
                success: function (data){
                    const like_check = data.like_check;
                    const like_count = data.like_count;
                    if(like_check){
                        $('#like-heart').html(
                            '<i class="bi bi-heart-fill">'
                            + '<input type="hidden" name="like-check" value="true">'
                        )
                        alert('추천하였습니다.')
                    }else {
                        $('#like-heart').html(
                            '<i class="bi bi-heart">'
                            + '<input type="hidden" name="like-check" value="false">'
                        )
                        alert('추천을 취소하였습니다.')
                    }
                    $('#like-counter').html(like_count)
                }
            })
        }
    }

</script>
<style>
    #comment-btn, .reply-btn{
        width: 70px;
    }
    #reply-box{
        margin: 50px 0 10px;
    }
    .reply-img{
        border: 1px solid #CCCCCC;
        border-radius: 10%;
        margin-right: 15px;
    }
    .reply-img>img{
        width: 70px;
        height: 70px;
        object-fit: cover;
    }
    .reply{
        display: flex;
        align-items: flex-start;
        width: 100%;
        margin-top: 20px;
    }
    .reply-wrap{
        display: flex;
        align-items: flex-start;
        width: 100%;
    }
    .reply-content{
        width: 100%;
        border-bottom: 1px solid #CCCCCC;
    }
    .reply-text{
        padding-bottom: 10px;
    }
    .reply-profile{
        display: flex;
        align-items: center;
    }
    .reply-nickname{
        font-weight: 700;
        margin-right: 10px;
    }
    .reply-date{
        color: #999999;
    }
    .reply-btn-grop{
        margin-left: 10px;
    }
    .btn-edit, .btn-delete, .btn-reply{
        width: 30px;
        height: 30px;
        padding: 0;
        font-size: 14px;
    }
    .deleted-reply{
        padding: 20px 10px 20px;
        width: 100%;
        margin-left: 85px;
        border-bottom: 1px solid #CCCCCC;
        color: #666666;
    }
    .reply-label {
        color: #999999;
    }
    .hide{
        visibility: hidden;
        height: 0;
    }
    .bi-arrow-return-right{
        font-size: 20px;
        padding-right: 10px;
        color: #999999;
    }

    #like-btn{
        width: 80px;
    }
    #like-wrap{
        align-items: center;
        display: flex;
        gap: 10px;
    }
    #like-heart{
        display: flex;
        color: #FFFFFF;
        font-weight: 700;
    }
    #like-counter{
        width: 100%;
    }

</style>


<!-- header-->
<jsp:include page="../common/header.jsp"/>
<div class="sub-header">
    <div class="container pt-5 pl-5">
        <h3 class="display-6 text-white">게시판</h3>
    </div>
</div>

<form name="writeFrm">
    <div class="container position-relative pt-5 pb-5">
        <!--글 제목-->
        <div class="jumbotron">
            <h3 class="display-4">${dto.b_title}</h3>
        </div>

        <!--글 정보-->
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col-md-auto">
                        <i class="bi bi-person"></i> &nbsp;&nbsp; ${dto.u_name}
                    </div>
                    <div class="col-md-auto">
                        <i class="bi bi-calendar"></i> &nbsp;&nbsp; ${dto.b_postdate}
                    </div>
                    <div class="col-md-auto">
                        <i class="bi bi-eye"></i> &nbsp;&nbsp; ${dto.b_visitcount}
                    </div>
                </div>
            </div>

            <hr class="my-4">


            <!--글 내용-->
            <p>
                <c:if test="${not empty dto.b_ofile and isImage == true}">
                    <img src="../../../upload/${dto.b_sfile}" style="max-width: 100%"/>
                </c:if>
                <br>
                ${dto.b_content}
                </p>

            <!--첨부파일 표시-->
            <c:if test="${not empty dto.b_ofile}">
                <hr class="my-4">
                첨부파일 &nbsp;&nbsp; <i class="bi bi-file-earmark-image"></i> ${dto.b_ofile}
            </c:if>
        </div>

        <div class="text-center pt-5">
            <button type="button" class="btn btn-secondary btn-sm" id="like-btn" onclick="clickLike()">
                <div id="like-wrap">
                    <div id="like-heart">
                        <c:choose>
                            <c:when test="${like_check}">
                                <i class="bi bi-heart-fill"></i>
                                <input type="hidden" name="like-check" value="true">
                            </c:when>
                            <c:otherwise>
                                <i class="bi bi-heart"></i>
                                <input type="hidden" name="like-check" value="false">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div id="like-counter">${like_count}</div>
                </div>
            </button>
        </div>


        <div class="text-center">
            <div class="btn-group pt-5" role="group" aria-label="Basic example">
                <c:if test="${not empty sessionScope.u_id and sessionScope.u_id eq dto.u_id}">
                    <button type="button" class="btn btn-primary btn-sm" onclick="location.href='../community/edit.do?mode=edit&b_id=${param.b_id}';">수정</button>
                    <%--            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='../community/del.do?mode=delete&b_id=${param.b_id}';">삭제</button>--%>
                    <button type="button" class="btn btn-primary btn-sm" onclick="deletePost();">삭제</button>
                </c:if>

                <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='../community/list.do';">목록보기</button>
            </div>
        </div>

        <!--댓글란-->
        <div id="reply-box">
            <div id="reply-total"><p>댓글 ${replyTotal}개</p></div>
            <div class="input-group mb-3">
                <div class="form-floating">
                    <input type="hidden" name="b_id" value="${dto.b_id}">
                    <textarea class="form-control" placeholder="Leave a comment here" id="comment-text" style="height: 100px"></textarea>
                    <label class="reply-label" for="comment-text">Comments</label>
                </div>
                <button class="btn btn-outline-secondary" type="button" id="comment-btn">등록</button>
            </div>

            <div id="reply-list">
                <c:forEach items="${replyList}" var="reply" varStatus="no">
                    <div class="reply" id="reply${no.count}" style="padding-left: ${reply.re_level * 50 - 30}px">
                        <c:if test="${reply.re_level > 0}">
                            <i class="bi bi-arrow-return-right"></i>
                        </c:if>
                        <input type="hidden" id="re_num${no.count}" value="${reply.re_num}">
                        <input type="hidden" id="re_ref${no.count}" value="${reply.re_ref}">
                        <input type="hidden" id="re_order${no.count}" value="${reply.re_order}">
                        <input type="hidden" id="re_level${no.count}" value="${reply.re_level}">
                        <div id="reply-wrap${no.count}" class="reply-wrap">
                            <c:if test="${reply.re_del eq 'N'}">
                                <div class="reply-img">
                                    <c:choose>
                                        <c:when test="${empty reply.u_sfile}"><img src="../proj/resources/assets/img/no_profimg.png"></c:when>
                                        <c:otherwise><img src="../../../upload/${reply.u_sfile}"></c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="reply-content">
                                    <div class="reply-profile">
                                        <p class="reply-nickname">${reply.u_name}</p>
                                        <p class="reply-date">
                                            <c:choose>
                                                <c:when test="${empty reply.re_modifydate}">${reply.re_regdate}</c:when>
                                                <c:otherwise>${reply.re_modifydate} 수정됨</c:otherwise>
                                            </c:choose>
                                        </p>
                                        <div class="reply-btn-grop">
                                            <c:if test="${reply.re_level < 2}">
                                                <button type="button" class="btn btn-reply" value="${no.count}">답글</button>
                                            </c:if>
                                            <c:if test="${sessionScope.u_id eq reply.u_id}">
                                                <button type="button" class="btn btn-edit" value="${no.count}">수정</button>
                                                <button type="button" class="btn btn-delete" value="${no.count}">삭제</button>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div id="reply-content${no.count}" class="reply-text">${reply.re_content}</div>
                                </div>
                            </c:if>
                            <c:if test="${reply.re_del eq 'Y'}">
                                <div class="deleted-reply">
                                    <p>삭제된 댓글 입니다.</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="input-group mb-3 reply-box hide" id="reply-box${no.count}">
                        <div class="form-floating" style="margin-left: ${reply.re_level * 50}px; margin-top: 10px">
                            <textarea class="form-control" placeholder="Leave a comment here" id="reply-text${no.count}" style="height: 100px"></textarea>
                            <label class="reply-label" for="reply-text${no.count}">${reply.u_name} 님 에게.</label>
                        </div>
                        <button class="btn btn-outline-secondary reply-btn" type="button" value="${no.count}" style="margin-top: 10px">등록</button>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>


</form>



<!--footer-->
<jsp:include page="../common/footer.jsp"/>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
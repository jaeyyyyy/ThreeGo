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
            const num = e.target.value;
            const selectedReply = '#reply-box' + num;
            if($(selectedReply).hasClass('hide')){
                $('.reply-box').addClass('hide');
                $(selectedReply).toggleClass('hide');
            }else {
                $(selectedReply).addClass('hide');
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

    function regReply() {
        let url = '/community/reply.do'
        const loginedId = '${sessionScope.u_id}'
        $('.reply-btn').click(function (e) {
            const num = e.target.value;
            if(loginedId === null){
                alert("로그인 후 이용 가능한 페이지 입니다.")
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
                alert("로그인 후 이용 가능한 페이지 입니다.")
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
                                        + '<button type="button" class="btn btn-update">수정</button>'
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
    .reply-content{
        width: 100%;
        border-bottom: 1px solid #CCCCCC;
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
    .btn-update, .btn-delete, .btn-reply{
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
    label {
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
</style>


<!-- header-->
<jsp:include page="../common/header.jsp"/>
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
            <p>${dto.b_content}
                <c:if test="${not empty dto.b_ofile and isImage == true}">
                    <br><img src="../../../upload/${dto.b_sfile}" style="max-width: 100%"/>
                </c:if></p>

            <!--첨부파일 표시-->
            <c:if test="${not empty dto.b_ofile}">
                <hr class="my-4">
                첨부파일 &nbsp;&nbsp; <i class="bi bi-file-earmark-image"></i> ${dto.b_ofile}
            </c:if>
        </div>

        <!--댓글란-->
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

        <div id="reply-box">
            <div id="reply-total"><p>댓글 ${replyTotal}개</p></div>
            <div class="input-group mb-3">
                <div class="form-floating">
                    <input type="hidden" name="b_id" value="${dto.b_id}">
                    <textarea class="form-control" placeholder="Leave a comment here" id="comment-text" style="height: 100px"></textarea>
                    <label for="comment-text">Comments</label>
                </div>
                <button class="btn btn-outline-secondary" type="button" id="comment-btn">등록</button>
            </div>

            <div id="reply-list">
                <c:forEach items="${replyList}" var="reply" varStatus="no">
                    <div class="reply" id="reply${no.count}" style="padding-left: ${reply.re_level * 50 - 30}px">
                        <c:if test="${reply.re_level > 0}">
                            <i class="bi bi-arrow-return-right"></i>
                        </c:if>
                        <c:if test="${reply.re_del eq 'N'}">
                            <input type="hidden" id="re_num${no.count}" value="${reply.re_num}">
                            <input type="hidden" id="re_ref${no.count}" value="${reply.re_ref}">
                            <input type="hidden" id="re_order${no.count}" value="${reply.re_order}">
                            <input type="hidden" id="re_level${no.count}" value="${reply.re_level}">
                            <div class="reply-img"><img src="../../../upload/${reply.u_sfile}"></div>
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
<%--                                        <button type="button" class="btn btn-update" value="${no.count}" >수정</button>--%>
                                        <button type="button" class="btn btn-delete" value="${no.count}">삭제</button>
                                    </c:if>
                                    </div>
                                </div>
                                <div class="reply-text"><p>${reply.re_content}</p></div>
                            </div>
                        </c:if>
                        <c:if test="${reply.re_del eq 'Y'}">
                            <div class="deleted-reply">
                                <p>삭제된 댓글 입니다.</p>
                            </div>
                        </c:if>
                    </div>
                    <div class="input-group mb-3 reply-box hide" id="reply-box${no.count}">
                        <div class="form-floating" style="margin-left: ${reply.re_level * 50}px; margin-top: 10px">
                            <textarea class="form-control" placeholder="Leave a comment here" id="reply-text${no.count}" style="height: 100px"></textarea>
                            <label for="reply-text${no.count}">${reply.u_name} 님 에게.</label>
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
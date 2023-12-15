<%@ page import="com.DAO.BoardDAO" %>
<%@ page import="com.DTO.BoardDTO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    //DAO 생성
    BoardDAO dao = new BoardDAO();

    //사용자 검색 조건 입력
    Map<String, Object> param = new HashMap<>();
    String searchFiled = request.getParameter("searchFiled");
    String searchWord =  request.getParameter("searchWord");
    if(searchWord !=null){
        param.put("searchFiled", searchFiled);
        param.put("searchWord", searchWord);
    }
    int totalCount = dao.selectCount(param); //게시물 수 확인
    List<BoardDTO> boardList = dao.selectList(param); //게시물 목록
    dao.close();

%>


<html>
<head>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../resources/assets/css/style.css?after" rel="stylesheet" />
    <title>커뮤니티</title>
</head>
<body>
<!-- header-->
<jsp:include page="../common/header.jsp"/>
<div class="container position-relative">
    <form method="get">
        <table border="1" width="90%">
            <tr>
                <td align="center">
                    <select name="searchFiled">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord">
                    <input type="submit" value="검색">
                </td>
            </tr>
        </table>
    </form>
    <%--게시물 목록 테이블 --%>
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>

        <%
            //게시물이 하나도 없을때
            if(boardList.isEmpty()){

        %>
        <tr>
            <td colspan="5" align="center">등록된 게시물이 없습니다.</td>
        </tr>

        <%
            //게시물이 있을 때
        }else{
            int virtualNum = 0; //화면상에서 게시물 번호
            for(BoardDTO dto : boardList){
                virtualNum = totalCount--;
        %>
        <tr align="center">
            <td><%= virtualNum%></td> <%--게시물 번호--%>
            <td align="left"><a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a></td> <%--제목--%>
            <td align="center"><%=dto.getId()%></td>            <%--작성자 아이디--%>
            <td align="center"><%=dto.getVisitcount()%></td>    <%--조회수--%>
            <td align="center"><%=dto.getPostdate()%></td>      <%--작성일--%>
        </tr>
        <%
                }
            }
        %>
    </table>
<%--    <div class="card-deck row row-cols-1 row-cols-md-3 g-4">--%>
<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="..." alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Card title</h5>--%>
<%--                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="..." alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Card title</h5>--%>
<%--                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="..." alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Card title</h5>--%>
<%--                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="..." alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Card title</h5>--%>
<%--                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="..." alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Card title</h5>--%>
<%--                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="col">--%>
<%--            <div class="card card-item">--%>
<%--                <img class="card-img-top" src="..." alt="Card image cap">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Card title</h5>--%>
<%--                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                </div>--%>
<%--                <div class="card-footer">--%>
<%--                    <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <table border="1" width="90%">
        <tr align="center">
            <td>
                ${map.pagingImg}
            </td>
            <td width="100">
                <button type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button>
            </td>
        </tr>
    </table>
</div>
<!--footer-->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>

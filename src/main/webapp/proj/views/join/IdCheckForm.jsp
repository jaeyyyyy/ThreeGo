<%--<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta http-equiv="content-type" content="text/html; charset=EUC-KR">--%>
<%--    <title>���̵� �ߺ� üũ</title>--%>
<%--    <script type="text/javascript">--%>
<%--        var httpRequest = null;--%>
<%--        //httpRequest ��ü ����--%>
<%--        function getXMLHttpRequest(){--%>
<%--            var httpRequest = null;--%>

<%--            if(window.ActiveXObject){--%>
<%--                try{--%>
<%--                    httpRequest = new ActiveXObject("Msxml2.XMLHTTP");--%>
<%--                }catch (e) {--%>
<%--                    try{--%>
<%--                        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");--%>
<%--                    }catch (e2) {httpRequest = null;}--%>

<%--                }--%>
<%--            }--%>
<%--            else if(window.XMLHttpRequest){--%>
<%--                httpRequest = new window.XMLHttpRequest();--%>
<%--            }--%>
<%--            return httpRequest;--%>


<%--        }--%>

<%--        //ȸ������â�� ���̵� �Է¶��� ���� �����´�.--%>
<%--        function pValue(){--%>
<%--            document.getElementById("userId").value = opener.document.userInfo.id.value;--%>
<%--        }--%>

<%--        //���̵� �ߺ�üũ--%>
<%--        function idCheck(){--%>
<%--            var id = document.getElementById("userId").value;--%>
<%--            if(!id){--%>
<%--                alert("���̵� �Է����� �ʾҽ��ϴ�.");--%>
<%--                return false;--%>
<%--            }else if((id < "0" || id > "9")&& (id > "A" || id > "Z")&& (id < "a"|| id > "z")){--%>
<%--                alert("�ѱ� �� Ư�����ڴ� ���̵�� ����Ͻ� �� �����ϴ�.");--%>
<%--                return false;--%>
<%--            }--%>
<%--            else{--%>
<%--                var param="id=" + id--%>
<%--                httpRequest = getXMLHttpRequest();--%>
<%--                httpRequest.onreadystatechange = callback;--%>
<%--                httpRequest.open("POST", "MemberIdCheckAction.do", true);--%>
<%--                httpRequest.setRequestHeader('Content-Type', application/'application/x-www-form-urlencoded');--%>
<%--                httpRequest.send(param);--%>
<%--            }--%>
<%--        }--%>

<%--        function callback(){--%>
<%--            if(httpRequest.readyState == 4){--%>
<%--                //������� �����´�.--%>
<%--                var resultText = httpRequest.responseText;--%>
<%--                if(resultText == 0){--%>
<%--                    alert("����� �� ���� ���̵� �Դϴ�.");--%>
<%--                    document.getElementById("cancelBtn").style.visibility='visible';--%>
<%--                    document.getElementById("useBtn").style.visibility='hidden';--%>
<%--                    document.getElementById("msg").innerHTML="";--%>
<%--                }--%>
<%--                else if (resultText == 1){--%>
<%--                    document.getElementById("cancelBtn").style.visibility='hidden';--%>
<%--                    document.getElementById("useBtn").style.visibility='visible';--%>
<%--                    document.getElementById("msg").innerHTML ="��밡���� ���̵��Դϴ�."--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>

<%--        //����ϱ� Ŭ���� �θ�â���ΰ� ����--%>
<%--        function sendCheckValue(){--%>
<%--            opener.document.userInfo.idDuplication.value = "idCheck";--%>
<%--            opener.document.userInfo.id.value = document.getElementById("userId").value;--%>

<%--            if(opener != null){--%>
<%--            opener.chkFrom = null;--%>
<%--            self.close();--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>


<%--</head>--%>


<%--<body onload="pValue()">--%>
<%--<div id="wrap">--%>
<%--    <b><font size="4">���̵� �ߺ� üũ</font></b>--%>

<%--    <hr size="1" width="400">--%>
<%--    <br>--%>
<%--    <div id="chk">--%>
<%--        <form id="checkForm">--%>
<%--            <input type="text" name="idinput" id="userId">--%>
<%--            <input type="button" value="�ߺ� Ȯ��" onclick="idCheck()">--%>

<%--        </form>--%>
<%--        <div id="msg"></div>--%>
<%--        <br>--%>
<%--        <input id="cancelBtn" type="button" value="���" onclick="window.close()">--%>
<%--        <input id="useBtn" type="button" value="����ϱ�" onclick="sendCheckValue()">--%>
<%--    </div>--%>


<%--</div>--%>



<%--</body>--%>



<%--</html>--%>
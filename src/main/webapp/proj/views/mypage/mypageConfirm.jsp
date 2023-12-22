<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<script>
    function PassAlert() {
        const input = prompt('비밀번호를 입력해주세요.');
        alert(input);
        if(input == ${dto.u_pw}) {
            alert('인증되었습니다.');
            location.href = '/mypage.do';
        } else {
            alert('인증에 실패했습니다.');
        }
    }
</script>

<%--
  Created by IntelliJ IDEA.
  User: usbtt
  Date: 25. 6. 11.
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <script>
        let idChecked = false; // 이메일 중복 체크 여부 저장
        let validId = ""; // 중복 확인된 이메일 값 저장

        function checkIdDuplicate() {
            const emailInput = document.forms["signupForm"]["id"].value;

            if (!idInput) {
                alert("이메일을 먼저 입력해주세요.");
                return;
        }

        // AJAX 요청

        fetch(`/check-email?email=${encodeURIComponent(emailInput)}`)
            .then(response => response.text())
            .tnen(result => {
                if (result === "duplicate") {
                    alert("이미 사용 중인 이메일 입니다.");
                    idChecked = false;
                } else if (result === "available") {
                    alert("사용 가능한 이메일 입니다.");
                    idChecked = true;
                }
            })
            .catch(error => {
                console.error("에러 발생:", error);
                alert("서버 요청에 실패했습니다.")
            });
        }

        function validateForm() {
            const currentEmail = document.forms["signupForm"]["email"].value;
            const password = document.forms["signupForm"]["password"].value;
            const passwordCheck = document.forms["signupForm"]["passwordCheck"].value;

            if (!emailChecked || currentId !== validEmail) {
                alert("이메일 중복 확인을 완료해주세요.");
                return false;
            }

            if (password !== passwordCheck) {
                alert("비밀번호가 일치 하지 않습니다. ");
                return false; // 폼 제출 차단
            } else {
                return true; // 일치하면 폼 제출 허용
            }
        }
    </script>
</head>
<body>
    <h2>회원가입</h2>
    <form name="signupForm" action="/signup" method="post" onsubmit="validateForm()">
        이메일<br />
        <input type="email" name="email" required placeholder="example@naver.com"/>
        <button type="button" onclick="checkIdDuplicate()">중복확인</button>
        <br/>
        비밀번호<br />
        <input type="password" name="password" required/><br/>
        비밀번호 확인<br />
        <input type="password" name="passwordCheck" required/><br/>
        이름<br />
        <input type="text" name="userName" required/><br />
        휴대폰 번호<br />
        <input type="text" name="phoneNumber" required/>
        <button type="button">인증번호 받기</button>
        <br/>
        인증번호<br />
        <input type="text" name="certNumber" required/>
        <button type="button">인증번호 조회</button>
        <br/>
        <br/>
        <input type="submit" value="회원가입하기"/>
    </form>
</body>
</html>

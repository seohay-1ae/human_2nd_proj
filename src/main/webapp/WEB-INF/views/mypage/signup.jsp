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
        let emailChecked = false; // 이메일 중복 체크 여부 저장
        let validEmail = ""; // 중복 확인된 이메일 값 저장

        // 이메일 중복 확인 함수
                function checkEmailDuplicate() {
                    const emailInput = document.forms["signupForm"]["email"].value;

                    if (!emailInput) {
                                    alert("이메일을 먼저 입력해주세요.");
                                    return;
                            }

                    fetch("/check-email?email=" + encodeURIComponent(emailInput))
                        .then(response => response.json())
                        .then(data => {
                            if (data.exists) {
                                alert("이미 사용 중인 이메일입니다.");
                                emailChecked = false;
                            } else {
                                alert("사용 가능한 이메일입니다.");
                                emailChecked = true;
                                validEmail = emailInput;
                            }
                        })
                        .catch(error => {
                            console.error("에러 발생:", error);
                            alert("이메일 확인 중 오류가 발생했습니다.");
                        });
                }

        // 폼 유효성 검사 로직
            function validateForm() {
                const currentEmail = document.forms["signupForm"]["email"].value;
                const password = document.forms["signupForm"]["password"].value;
                const password_check = document.forms["signupForm"]["password_check"].value;

                if (!emailChecked || currentEmail !== validEmail) {
                    alert("이메일 중복 확인을 완료해주세요.");
                    return false;
                }

                if (password !== password_check) {
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
    <form name="signupForm" action="/signup" method="post" onsubmit="return validateForm()">
        이메일<br />
        <input type="email" name="email" required placeholder="example@naver.com"/>
        <button type="button" onclick="checkEmailDuplicate()">중복확인</button>
        <br/>
        비밀번호<br />
        <input type="password" name="password" required/><br/>
        비밀번호 확인<br />
        <input type="password" name="password_check" required/><br/>
        이름<br />
        <input type="text" name="username" required/><br />
        휴대폰 번호<br />
        <input type="text" name="phone_number" required/>
        <button type="button">인증번호 받기</button>
        <br/>
        인증번호<br />
        <input type="text" name="cert_number" required/>
        <button type="button">인증번호 조회</button>
        <br/>
        <br/>
        <input type="submit" value="회원가입하기"/>
    </form>
</body>
</html>

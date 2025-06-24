// 인증번호 요청
function sendCode() {
    const email = $("#email").val();
    if (!email) {
        alert("이메일을 입력하세요.");
        return;
    }

    $.ajax({
        type: "POST",
        url: "/sendCode",
        data: { email: email },
        // message = @ResponseBody 리턴값
        success: function (message) {
            alert(message);
        },
        error: function () {
            alert("인증번호 전송 실패");
        }
    });
}

// 인증번호 확인
function verifyCode() {
    const email = $("#email").val();
    const verifyCode = $("#verifyCode").val();

    $.ajax({
        type: "POST",
        url: "/verifyCode",
        data: {
            email: email,
            code: verifyCode
        },
        success: function (message) {
            if (message === "인증 성공") {
                alert("인증 성공");
                $("#resetPwSection").show();
                $("#verifyEmail").val(email);
            } else {
                alert("인증 실패");
            }
        },
        error: function () {
            alert("서버 오류");
        }
    });
}

// 비밀번호 일치 검사
$(function () {
    $("#resetPwForm").submit(function (e) {
        const pw1 = $("#newPw").val();
        const pw2 = $("#confirmPw").val();
        if (pw1 !== pw2) {
            e.preventDefault();
            alert("비밀번호가 일치하지 않습니다.");
        }
    });
});
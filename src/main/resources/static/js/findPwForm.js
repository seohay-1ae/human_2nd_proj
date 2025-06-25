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
            alert("인증번호 전송에 실패했습니다.");
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
                alert("확인되었습니다.");
                $("#resetPwSection").show();
                $("#verifyEmail").val(email);
            } else {
                alert("인증에 실패히였습니다. 다시 시도해주세요.");
            }
        },
        error: function () {
            alert("서버 오류입니다. 관리자에게 문의하세요.");
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
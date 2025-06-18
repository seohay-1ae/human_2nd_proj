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
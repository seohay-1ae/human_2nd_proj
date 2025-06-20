//        let emailChecked = false; // 이메일 중복 체크 여부 저장
//        let validEmail = ""; // 중복 확인된 이메일 값 저장
        let generatedCertNumber = ""; // 난수로 생성된 인증번호 값 저장
        let phoneCertified = false; // 인증번호 확인 체크 여부 저장

        // 이메일 중복 확인 함수
//                function checkEmailDuplicate() {
//                    const emailInput = document.forms["signUpForm"]["email"];
//                    const email = emailInput.value.trim(); //유지 보수 이유로 따로 변수를 지정해서 다시 사용
//                    // 이메일 양식 검사 정규식
//                    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
//
//                    // 이메일 공란 및 양식 확인
//                    if (!email) {
//                        alert("이메일을 먼저 입력해주세요.");
//                        emailInput.focus();
//                        return;
//                    } else if (!emailRegex.test(email)) {
//                        alert("잘못된 이메일 양식입니다. 예: example@domain.com");
//                        emailInput.focus();
//                        return;
//                    }

                    // 이메일 중복 체크를 위한 AJAX 요청
//                    fetch("/check-email?email=" + encodeURIComponent(email))
//                        .then(response => response.json())
//                        .then(data => {
//                            if (data.exists) {
//                                alert("이미 사용 중인 이메일입니다.");
//                                emailChecked = false;
//                            } else {
//                                alert("사용 가능한 이메일입니다.");
//                                emailChecked = true;
//                                validEmail = email;
//                            }
//                        })
//                        .catch(error => {
//                            console.error("에러 발생:", error);
//                            alert("이메일 확인 중 오류가 발생했습니다.");
//                        });
//                }

        // 인증번호 받기
            function sendCertNumber() {
                const phoneInput = document.forms["findEmailForm"]["phone_number"];
                const phone = phoneInput.value.trim();

                // 기본 유효셩 검사
                const phoneRegex = /^01[016789][0-9]{7,8}$/; // 한국 휴대폰 번호 형식
                if (!phoneRegex.test(phone)) {
                    alert("올바른 휴대폰 번호를 입력해주세요. 예: 01012345678");
                    phoneInput.focus();
                    return;
                }

                // 인증번호 6자리 난수 생성
                generatedCertNumber = Math.floor(100000 + Math.random() * 900000).toString();
                alert("인증번호: " + generatedCertNumber + "\n(프젝용 테스트)");

                // 실제 구현 시 이곳에서 SMS API 호출
            }

        // 인증 번호 확인
            function verifyCertNumber() {
                const certInput = document.forms["findEmailForm"]["cert_number"];
                const cert = certInput.value.trim();

                if (cert === "") {
                    alert("인증번호를 입력해주세요.");
                    return;
                }

                if (cert === generatedCertNumber) {
                    alert("인증이 완료되었습니다.");
                    phoneCertified = true;
                } else {
                    alert("인증번호가 올바르지 않습니다.");
                    phoneCertified = false;
                }
            }

        // 최종 폼 제출 시 유효성 확인 로직
            function validateForm() {
//                const currentEmail = document.forms["findEmailForm"]["email"].value;
//                const password = document.forms["findEmailForm"]["password"].value;
//                const password_check = document.forms["findEmailForm"]["password_check"].value;
                const currentCert = document.forms["findEmailForm"]["cert_number"].value;

//                if (!emailChecked || currentEmail !== validEmail) {
//                    alert("이메일 중복 확인을 완료해주세요.");
//                    return false; // 폼 제출 차단
//                }

//                if (password !== password_check) {
//                    alert("비밀번호가 일치 하지 않습니다. ");
//                    return false; // 폼 제출 차단
//                }

                if (!phoneCertified || currentCert !== generatedCertNumber) {
                    alert("휴대폰 인증을 완료해주세요.");
                    return false; // 폼 제출 차단
                }
                return true; //모든 검사를 통과한 경우에만 폼 제출
            }

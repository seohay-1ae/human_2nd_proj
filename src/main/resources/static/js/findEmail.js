        let generatedCertNumber = ""; // 난수로 생성된 인증번호 값 저장
        let phoneCertified = false; // 인증번호 확인 체크 여부 저장

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
                alert("인증번호: " + generatedCertNumber);

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
                    alert("확인되었습니다.");
                    phoneCertified = true;
                } else {
                    alert("인증번호가 올바르지 않습니다.");
                    phoneCertified = false;
                }
            }

        // 최종 폼 제출 시 유효성 확인 로직
            function validateForm() {
                const currentCert = document.forms["findEmailForm"]["cert_number"].value;

                if (!phoneCertified || currentCert !== generatedCertNumber) {
                    alert("휴대폰 인증을 완료해주세요.");
                    return false; // 폼 제출 차단
                }
                return true; //모든 검사를 통과한 경우에만 폼 제출
            }

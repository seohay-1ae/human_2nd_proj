<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>제목</title>

    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/각 페이지에서만 쓰이는 css(만들것).css"/>--%>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; padding: 30px; }
        h2 { text-align: center; margin-bottom: 30px; }
        h3 { margin-top: 25px; color: #2f65f8; }
        p, li { margin-bottom: 10px; }
        ul { padding-left: 20px; }
    </style>
</head>

<body>
<nav class="top-nav">
    <div class="title">
        약관 및 정책
    </div>
</nav>
<div class="page-container">
    <div class="page-content">
        <%--        양옆으로 마진 20 필요할때--%>
        <div class="container">
            <h2>TravelQuest 약관 및 정책</h2> <%-- 상단 제목 출력 --%>

            <section>
                <h3>제1조 (목적)</h3>
                <p>이 약관은 TravelQuest(이하 “회사”)가 제공하는 위치 기반 여행 서비스 및 부가서비스(이하 “서비스”)의 이용조건 및 절차, 회사와 회원 간의 권리, 의무, 책임사항 및 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
            </section>

            <section>
                <h3>제2조 (정의)</h3>
                <ul>
                    <li>“회원”이란 본 약관에 동의하고 회사가 제공하는 서비스를 이용하는 자를 말합니다.</li>
                    <li>“여행 뱃지”란 위치기반 인증 또는 미션 완료 시 지급되는 디지털 보상을 말합니다.</li>
                    <li>“마이페이지”란 회원정보 확인, 아바타 설정, 획득 뱃지 확인 등이 가능한 개인 공간을 말합니다.</li>
                    <li>“게시물”이란 회원이 서비스 내에 게시한 텍스트, 이미지, 영상 등 일체의 콘텐츠를 말합니다.</li>
                </ul>
            </section>

            <section>
                <h3>제3조 (약관의 명시와 설명 및 개정)</h3>
                <p>회사는 본 약관의 내용을 회원이 알 수 있도록 서비스 초기화면 또는 연결화면에 게시합니다.</p>
                <p>회사는 필요한 경우 관련 법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</p>
            </section>

            <section>
                <h3>제4조 (서비스의 제공 및 변경)</h3>
                <p>회사는 다음의 서비스를 제공합니다.</p>
                <ul>
                    <li>위치기반 여행 뱃지 제공 서비스</li>
                    <li>미션 수행 기반 리워드 서비스</li>
                    <li>커뮤니티 및 후기 공유 서비스</li>
                    <li>회원별 아바타 설정 및 마이페이지</li>
                </ul>
                <p>회사는 서비스의 품질 향상 등을 위하여 변경할 수 있으며, 변경 시 사전에 공지합니다.</p>
            </section>

            <section>
                <h3>제5조 (회원가입)</h3>
                <p>이용자는 회사가 정한 가입 양식에 따라 회원정보를 입력하고 본 약관에 동의함으로써 회원가입을 신청합니다.</p>
                <p>회사는 신청자의 정보를 확인 후 승낙하며, 특별한 사유가 없는 한 신청을 거부하지 않습니다.</p>
            </section>

            <section>
                <h3>제6조 (회원 탈퇴 및 자격 상실)</h3>
                <p>회원은 언제든지 탈퇴를 요청할 수 있으며, 회사는 즉시 처리합니다.</p>
                <p>다음 각 호에 해당하는 경우, 회사는 회원 자격을 제한 또는 상실시킬 수 있습니다.</p>
                <ul>
                    <li>허위 정보 제공</li>
                    <li>타인의 권리 침해 또는 명예 훼손</li>
                    <li>서비스 운영 방해 행위</li>
                </ul>
            </section>

            <section>
                <h3>제7조 (회원의 의무)</h3>
                <ul>
                    <li>회원은 관계 법령 및 본 약관에서 규정한 사항을 준수해야 합니다.</li>
                    <li>회원은 회사의 사전 동의 없이 서비스를 영리 목적으로 이용할 수 없습니다.</li>
                    <li>회원은 본인의 계정 정보를 철저히 관리할 책임이 있으며, 이를 제3자에게 제공해서는 안 됩니다.</li>
                </ul>
            </section>

            <section>
                <h3>제8조 (개인정보 보호)</h3>
                <p>회사는 회원의 개인정보 보호를 위해 관련 법령이 정하는 바에 따라 최선을 다합니다. 자세한 사항은 개인정보처리방침에 따릅니다.</p>
            </section>

            <section>
                <h3>제9조 (지적재산권)</h3>
                <p>회사가 작성한 콘텐츠에 대한 지적재산권은 회사에 귀속합니다.</p>
                <p>회원이 게시한 콘텐츠는 회원 본인에게 권리가 있으며, 회사는 서비스 운영 목적 범위 내에서 이를 활용할 수 있습니다.</p>
            </section>

            <section>
                <h3>제10조 (위치기반서비스 관련 사항)</h3>
                <p>회사는 위치정보를 이용하여 뱃지 지급 등의 서비스를 제공합니다.</p>
                <p>회원은 서비스 이용 중 자신의 위치정보 수집·이용에 동의한 것으로 간주합니다.</p>
                <p>회원은 언제든지 위치정보 수집 동의를 철회할 수 있습니다.</p>
            </section>

            <section>
                <h3>제11조 (계약해지 및 환불)</h3>
                <p>회사는 회원이 유료서비스를 이용한 경우, 환불 기준 및 절차를 별도로 정하여 안내합니다.</p>
            </section>

            <section>
                <h3>제12조 (책임 제한)</h3>
                <p>회사는 천재지변, 네트워크 오류 등 불가항력적 사유로 인한 서비스 중단에 대하여 책임을 지지 않습니다.</p>
                <p>회사는 회원 간 또는 회원과 제3자 간 분쟁에 개입하지 않으며, 그에 따른 손해에 대해 책임지지 않습니다.</p>
            </section>

            <section>
                <h3>시행일</h3>
                <p>본 약관은 2025년 6월 19일부터 공고 후 2025년 6월 26일부터 시행합니다.</p>
            </section>
        </div>
    </div>
</div>

<!-- 하단 nav바 필수 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    <!-- js 작성 -->
</script>
</body>
</html>
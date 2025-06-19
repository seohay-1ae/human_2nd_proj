# 📦 Team Project Starter

DB.jar

⚠️⚠️⚠️push가 안 될 때⚠️⚠️⚠️
https://ysy2000.tistory.com/151

---
## 공통 요소 삽입 방법 (헤더 / 푸터 / 스타일)

각 .jsp에서 아래와 같이 공통 요소를 포함합니다:

```jsp
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>제목</title>

  <!-- 공통 및 페이지별 CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/> <!-- (필수) -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/<!--각 페이지에서만 쓰이는 css(만들것).css -->"/>
</head>

<body>
  <!-- 상단 네비게이션 -->
  <nav class="top-nav">

      <!-- 로고 넣을 때 -->
      <div class="logo">
          <a href="${pageContext.request.contextPath}/">
              <img src="${pageContext.request.contextPath}/logo.png" alt="logo"/>
          </a>
      </div>
      <!-- 로고 넣을 때 -->

      <!-- 뒤로가기 넣을 때 -->
      <div class="back-button">
          <a href="/<!-- 경로는 맞춰서 수정 -->">← </a> 
      </div>
      <!-- 뒤로가기 넣을 때 -->

      <!-- 타이틀 넣을 때 -->
      <div class="title">
          마이페이지
      </div>
      <!-- 타이틀 넣을 때 -->

    </nav>
    <!-- 상단 네비게이션 -->

  <div class="page-container"> <!-- (필수) -->
    <div class="page-content"> <!-- (필수) -->
      <div class="container"> <!-- (양옆으로 마진20 필요할 때) -->
        <!-- html작성 -->
      </div>
    </div>
 </div>

  <!-- 하단 nav바 -->
  <jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/> <!-- (필수) -->

  <script>
    <!-- js 작성 -->
  </script>
</body>
</html>
```
---

## 🧑‍💻 팀원 작업 가이드

### ✅ 기본 작업 순서 (숙지)

1. 저장소 클론
2. 인텔리제이 해당 폴더로 열기
3. 본인 브랜치로 이동
4. 빌드 그래들 후 개발 시작

---

## 🚀 자동세팅 사용법(최초1회) ⚠️⚠️⚠️(따라하세요)

### 1. 저장소 클론

아래 명령어를 **CMD**에서 한 줄씩 입력하세요 **⚠️(띄어쓰기 주의)**

```bash
d:
mkdir db_jar
cd db_jar
git clone https://github.com/DBJARa/DBjar-project.git .
```

> `.`은 현재 디렉토리에 저장소를 복제하겠다는 의미입니다.

<br> <br>

### 2. 인텔리제이 추천 플러그인
![image](https://github.com/user-attachments/assets/dfc9ada4-c982-4b79-bc5a-a283b24f39e3)
![image](https://github.com/user-attachments/assets/ee0a5975-0350-41fe-83cb-5c1d4664fbbc)
![image](https://github.com/user-attachments/assets/fb908737-0faa-4dbf-ae82-898a3fb8e77b)

>nyang progress, pet 제외
<br> <br>


### 3. 인텔리제이 해당 폴더로 열기

<br> <br>

### 4. 본인 브랜치로 이동
![image](https://github.com/user-attachments/assets/9d1db82d-3258-4981-a87e-315c9246c3c2)

<br> <br>


## 🔄 팀 협업 Git 작업 가이드

**최신 코드 유지 & 충돌 방지를 위한 팀 개발 규칙**

### 📌 브랜치 전략

| 브랜치     | 용도                                             |
| ---------- | ----------------------------------------------- |
| `main`     | 최종 배포용 코드                                  |
| `dev`      | 팀 작업을 병합하는 중간 브랜치 (PM이 머지 담당)    |
| `본인이름`  | 본인이 작업하는 브랜치                           |

```
dev 브랜치 기준 폴더구조


```

---

### ✅ 팀원 작업 순서 (⚠️VSCode 터미널에서 이것만 직접하면 됨) (⚠️⚠️⚠️꼭꼭 숙지하고 항상 보고 하세요⚠️⚠️⚠️)

#### 1. `dev` 브랜치에서 최신 코드 가져오기

```bash
git checkout dev        # dev로 이동
git pull origin dev     # dev의 최신 내용 내려받기
```

#### 2. 작업 후 커밋 (현재 브랜치 확인 필수!)

```bash
git checkout 본인브랜치               # 본인 브랜치로 이동
git status                           # 현재 브랜치 한번 더 확인 (선택사항)
카테고리 폴더에서 페이지 작업하기
git add .                            # 변경된 파일 모두 추가
git commit -m "작업 내용 메세지"
```

#### 3. 푸시 전 `dev` 최신화 & 반영

```bash
git checkout dev           # dev 브랜치로 이동
git pull origin dev        # ⚠️최신 dev 내려받기

git checkout 본인브랜치     # 다시 본인 브랜치로 이동
git merge dev              # 최신 dev 내용을 본인 브랜치에 병합
```

#### 4. 작업 브랜치 푸시

```bash
git push                  # 브랜치에 최종 작업 푸시
```

---

### 📤 병합 흐름 (여기서부터는 그냥 설명)

```bash
본인 브랜치 → dev → main
```

- **팀원**: `본인 브랜치 → dev` 브랜치까지만 작업
- `dev → main` 병합은 **PM이 담당**

---

### ⚠️ 주의사항

- ❌ `main`, `dev` 브랜치에는 직접 작업하지 마세요.
- ✅ 작업 전/푸시 전 **반드시 dev 최신화 → 병합** 진행.
- 📝 Pull Request는 **본인 브랜치 → dev**로 생성해주세요.

---

Happy Coding! ✨

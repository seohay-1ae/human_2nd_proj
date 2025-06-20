<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${regionKr} ${subregionKr} 관광지 리스트</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        #locationList {
            list-style: none;
            padding: 1rem;
        }

        #locationList li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 1rem;

            margin-bottom: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #eee;
        }

        .location-text {
            flex: 1;
        }

        .location-text strong {
            display: block;
            font-size: 16px;
            margin-bottom: 0.3rem;
        }

        .location-text span {
            font-size: 14px;
            color: #555;
        }

        #locationList img {
            width: 100px;
            height: auto;
            object-fit: cover;
            border-radius: 4px;
        }
    </style>

</head>
<body>
<nav class="top-nav">
    <div class="back-button">
        <a href="/region/${region}">← </a>
    </div>
    <div class="title">
        ${regionKr} ${subregionKr} 관광지 리스트
    </div>
</nav>

<div class="page-container">
    <div class="page-content">
            <ul id="locationList"></ul>
    </div>
</div>
<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function () {
    const region = '${region}';
    const subregion = '${subregion}';

    fetch(`/api/locations?region=${region}&subregion=${subregion}`)
        .then(res => res.json())
        .then(locations => {
            console.log(locations);
            const list = document.getElementById('locationList');

            if (locations.length === 0) {
                list.innerHTML = '<li>관광지가 없습니다.</li>';
                return;
            }

            locations.forEach(loc => {
                const li = document.createElement('li');

                const textDiv = document.createElement('div');
                textDiv.className = 'location-text';
                textDiv.innerHTML = `<strong>\${loc.title}</strong><br> <span style="font-size:12px;">\${loc.addr1}</span>`;
                li.appendChild(textDiv);

                if (loc.firstimage) {
                    const img = document.createElement('img');
                    img.src = loc.firstimage;
                    img.alt = loc.title;
                    img.width = 100;
                    li.appendChild(img);
                }
                list.appendChild(li);
            });

        })
        .catch(err => {
            console.error(err);
        });
    });
</script>
</body>
</html>


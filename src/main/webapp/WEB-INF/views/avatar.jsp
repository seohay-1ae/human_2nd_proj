<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Avatar</title>
    <style>
        .avatar {
            position: relative;
            width: 200px;
            height: 200px;
        }

        .layer {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
        }

        .hands {
            z-index: 10;
        }

        .skin {
            z-index: 20;
        }

        .line {
            z-index: 30;
        }

        .bottoms {
            z-index: 40;
        }

        .tops {
            z-index: 50;
        }

        /*.face { z-index: 60; }*/
        .hats {
            z-index: 70;
        }
    </style>
</head>
<body>
<h2>나의 아바타</h2>

<div class="avatar">
    <img src="/avatars/line.png" class="layer line"/>
    <img src="/avatars/skins/01.png" class="layer skin"/>
    <img src="/avatars/hands/01.png" class="layer hands"/>
    <img src="/avatars/bottoms/02.png" class="layer bottoms"/>
    <img src="/avatars/tops/04.png" class="layer tops"/>
    <img src="/avatars/hats/01.png" class="layer hats"/>
</div>
</body>
</html>

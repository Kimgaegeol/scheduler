<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/profile.css">
</head>
<body>

    <div id="all_box">
        <header id="header_box">
            <button id="back_btn">➜</button>
        </header>
        <img id="profile_image" src="../image/profile_icon.png" alt="">
        <main>
            <section id="info_box" class="box">
                <p class="info">이름:&emsp;&ensp;김재걸</p>
                <p class="info">전화번호:&emsp;&ensp;010-5592-1087</p>
                <p id="info_id" class="info">ID:&emsp;&ensp;stageus1234</p>
            </section>
            <section id="password_change_box" class="box">
                <p id="password_change_text">비밀번호 변경</p>
                <input id="password_change" type="password" placeholder="Password">
                <div id="password_change_check_text" class="red">" 영문,숫자 모두 포함 4~20글자 "</div>
                <button id="password_change_finish_btn" class="btn">확인</button>
            </section>
            <section id="btn_box">
                <button id="logout_btn" class="btn">로그아웃</button>
                <button id="user_delete_btn" class="btn">회원탈퇴</button>
            </section>
        </main>
    </div>


    <div id="modal_background">

        <div id="password_change_modal_box" class="modal_box">
            <p id="password_change_text" class="modal_text">변경하시겠습니까?</p>
            <div id="password_change_btn_box" class="modal_btn_box">
                <button id="password_change_accept_btn" class="modal_btn">확인</button>
                <button id="password_change_cancel_btn" class="modal_btn">취소</button>
            </div>
        </div>

        <div id="logout_modal_box" class="modal_box">
            <p id="logout_text" class="modal_text">로그아웃 하시겠습니까?</p>
            <div id="logout_btn_box" class="modal_btn_box">
                <button id="logout_accept_btn" class="modal_btn">확인</button>
                <button id="logout_cancel_btn" class="modal_btn">취소</button>
            </div>
        </div>

        <div id="user_delete_modal_box" class="modal_box">
            <p id="user_delete_text" class="modal_text">정말 탈퇴하시겠습니까 ?</p>
            <div id="user_delete_btn_box" class="modal_btn_box">
                <button id="user_delete_accept_btn" class="modal_btn">확인</button>
                <button id="user_delete_cancel_btn" class="modal_btn">취소</button>
            </div>
        </div>

    </div>

    <script src="../js/profile.js"></script>

</body>
</html>
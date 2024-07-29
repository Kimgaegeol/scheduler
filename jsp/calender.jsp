<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/calendar.css">
</head>
<body>

    <div class="container">

        <button class="view_all_btn">전체보기</button>
        <img class="profile_icon" src="../image/profile_icon.png" alt="">
        <div class="header">
                <button id="prev_month_btn" class="nav-btn go-prev">&lt;</button>
                <button id="today_month_btn" class="year-month"></button>
                <button id="next_month_btn" class="nav-btn go-next">&gt;</button>
        </div>

        <div class="main">
            <div class="days">
                <div class="day">Sun</div>
                <div class="day">Mon</div>
                <div class="day">Tue</div>
                <div class="day">Wed</div>
                <div class="day">Thu</div>
                <div class="day">Fri</div>
                <div class="day">Sat</div>
            </div>
            <div class="dates"></div>
        </div>
    </div>

    <div id="modal_background"> 
        <div id="modal_box">
            <button id="accept_btn">확인</button>
            <div id="date_box">
                <div id="year_box" class="date_change_box">
                    <button id="next_year_btn" class="date_btn">▲</button>
                    <p id="year_text" class="date_text">2024</p>
                    <button id="prev_year_sbtn" class="date_btn">▼</button>
                </div>
                <div id="month_box" class="date_change_box">
                    <button id="next_month_btn" class="date_btn">▲</button>
                    <p id="month_text" class="date_text">July</p>
                    <button id="prev_month_btn" class="date_btn">▼</button>
                </div>
            </div>
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

    </div>

    <script src="../js/calendar.js"></script>

</body>
</html>
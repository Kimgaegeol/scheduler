<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>


<%
if(session.getAttribute("user_idx") == null) {
%>
    <script>
        alert("세션이 만료되었습니다.");
        location.href = "./index.jsp";
    </script>
<%
}
else {
    // 사용자 정보는 모두 session을 통해 정보를 받을 예정. 
    request.setCharacterEncoding("utf-8");

    String year = request.getParameter("year");
    String month = request.getParameter("month");

    String idx = (String)session.getAttribute("user_idx");
    String id = (String)session.getAttribute("user_id");
    String pw = (String)session.getAttribute("user_pw");
    String name = (String)session.getAttribute("user_name");
    String phone = (String)session.getAttribute("user_phone");
%>

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
            <button id="back_btn" onclick="backBtnEvent(<%=year%>,<%=month%>)">➜</button>
        </header>
        <img id="profile_image" src="../image/profile_icon.png" alt="">
        <main>
            <section id="info_box" class="box">
                <p class="info">이름:&emsp;&ensp;<%=name%></p>
                <p class="info">전화번호:&emsp;&ensp;<%=phone%></p>
                <p id="info_id" class="info">ID:&emsp;&ensp;<%=id%></p>
            </section>
            <section id="password_change_box" class="box">
                <p id="password_change_text">비밀번호 변경</p>
                <input id="password_change" type="password" placeholder="Password">
                <div id="password_change_check_text" class="red">" 영문,숫자 모두 포함 4~20글자 "</div>
                <button id="password_change_finish_btn" class="btn" onclick="passwordChangeFinishBtnEvent(<%=year%>,<%=month%>)">확인</button>
            </section>
            <section id="btn_box">
                <button id="logout_btn" class="btn" onclick="logoutBtnEvent()">로그아웃</button>
                <button id="user_delete_btn" class="btn" onclick="userDeleteBtnEvent()">회원탈퇴</button>
            </section>
        </main>
    </div>


    <div id="modal_background">

        <div id="password_change_modal_box" class="modal_box">
            <p id="password_change_text" class="modal_text">변경하시겠습니까?</p>
            <div id="password_change_btn_box" class="modal_btn_box">
                <button id="password_change_accept_btn" class="modal_btn" onclick="passwordChangeAcceptBtnEvent(<%=year%>,<%=month%>)">확인</button>
                <button id="password_change_cancel_btn" class="modal_btn" onclick="passwordChangeCancelBtnEvent()">취소</button>
            </div>
        </div>

        <div id="logout_modal_box" class="modal_box">
            <p id="logout_text" class="modal_text">로그아웃 하시겠습니까?</p>
            <div id="logout_btn_box" class="modal_btn_box">
                <button id="logout_accept_btn" class="modal_btn" onclick="logoutAcceptBtnEvent()">확인</button>
                <button id="logout_cancel_btn" class="modal_btn" onclick="logoutCancelBtnEvent()">취소</button>
            </div>
        </div>

        <div id="user_delete_modal_box" class="modal_box">
            <p id="user_delete_text" class="modal_text">정말 탈퇴하시겠습니까 ?</p>
            <div id="user_delete_btn_box" class="modal_btn_box">
                <button id="user_delete_accept_btn" class="modal_btn" onclick="userDeleteAcceptBtnEvent()">확인</button>
                <button id="user_delete_cancel_btn" class="modal_btn" onclick="userDeleteCancelBtnEvent()">취소</button>
            </div>
        </div>

    </div>

    <script src="../js/profile.js"></script>

</body>
</html>
<%
}
%>
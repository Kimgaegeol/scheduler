<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    request.setCharacterEncoding("utf-8");

    int year = Integer.valueOf(request.getParameter("year"));
    int month = Integer.valueOf(request.getParameter("month"));
    int day = Integer.valueOf(request.getParameter("day")); 
    int dateIdx = Integer.valueOf(request.getParameter("date_idx"));

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");
    //없는 date 값이었을 경우 생성하고 dateIdx를 가져옴
    if (dateIdx == -1) {
        String dateInsertString = "INSERT INTO date(user_idx,year,month,day,total_schedule) VALUES (?,?,?,?,?)";
        PreparedStatement dateInsertQuery = connect.prepareStatement(dateInsertString);
        dateInsertQuery.setString(1, "7");
        dateInsertQuery.setString(2, String.valueOf(year));
        dateInsertQuery.setString(3, String.valueOf(month));
        dateInsertQuery.setString(4, String.valueOf(day));
        dateInsertQuery.setString(5, "0");
        dateInsertQuery.executeUpdate();

        //date_idx값을 가져옴
        String dateSelectString = "SELECT idx FROM date WHERE user_idx = ? AND year = ? AND month = ? AND day = ?";
        PreparedStatement dateSelectQuery = connect.prepareStatement(dateSelectString);
        dateSelectQuery.setString(1, "7");
        dateSelectQuery.setString(2, String.valueOf(year));
        dateSelectQuery.setString(3, String.valueOf(month));
        dateSelectQuery.setString(4, String.valueOf(day));
        ResultSet dateSelectResult = dateSelectQuery.executeQuery();

        while(dateSelectResult.next()) {
            dateIdx = Integer.valueOf(dateSelectResult.getString("idx"));
        }
    }

    String scheduleString = "SELECT * FROM schedule WHERE date_idx = ? ORDER BY time, minute";
    PreparedStatement scheduleQuery = connect.prepareStatement(scheduleString);
    scheduleQuery.setString(1, String.valueOf(dateIdx));
    ResultSet scheduleResult = scheduleQuery.executeQuery();

%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" type="text/css" href="../css/schedule.css">
</head>
<body>
        <div id="all_box">
            <header id="header_box">
                <p id="date"><%=month%>월 <%=day%>일</p>
                <section id="btn_box">
                    <button id="view_all_btn">전체보기</button>
                    <button id="back_btn">➜</button>
                </section>
            </header>
            <main>
                <section id="add_schedule_box" class="schedule_box">
                     <button id="add_schedule_time_btn" class="add_schedule_btn add_schedule">0</button>
                     <button id="add_schedule_minute_btn" class="add_schedule_btn add_schedule">0</button>
                     <input id="add_schedule_input" class="add_schedule" type="text" placeholder="할 일 입력">
                     <button id="add_schedule_finish_btn" class="add_schedule" onclick="addScheduleBtnEvent(<%=year%>,<%=month%>,<%=day%>,<%=dateIdx%>)">추가</button>
                </section>
<%
while(scheduleResult.next()) {
%>
                <section class="schedule_box">
                    <p id="check_schedule_time" class="check_schedule_btn check_schedule"><%=scheduleResult.getString("time")%></p>
                    <p id="check_schedule_minute" class="check_schedule_btn check_schedule"><%=scheduleResult.getString("minute")%></p>
                    <p id="check_schedule_text" class="check_schedule"><%=scheduleResult.getString("content")%></p>
                    <button id="schedule_modify_btn" class="check_schedule">수정</button>
                    <button id="schedule_delete_btn" class="check_schedule">삭제</button>
                </section>
<%
}
%>
            </main>
        </div>

        <div id="modal_background">
            <div id="time_modal" class="modal_box">
                <div id="am_pm_box">
                    <button id="am_btn" class="am_pm_btn">AM</button>
                    <button id="pm_btn" class="am_pm_btn">PM</button>
                </div>
                <div id="first_time_box" class="time_modal_box">
                    <button id="time_btn1" class="time_btn" onclick="timeBtnEvent(event)">0</button>
                    <button id="time_btn2" class="time_btn" onclick="timeBtnEvent(event)">1</button>
                    <button id="time_btn3" class="time_btn" onclick="timeBtnEvent(event)">2</button>
                    <button id="time_btn4" class="time_btn" onclick="timeBtnEvent(event)">3</button>
                    <button id="time_btn5" class="time_btn" onclick="timeBtnEvent(event)">4</button>
                    <button id="time_btn6" class="time_btn" onclick="timeBtnEvent(event)">5</button>
                </div>
                <div id="second_time_box" class="time_modal_box">
                    <button id="time_btn7" class="time_btn" onclick="timeBtnEvent(event)">6</button>
                    <button id="time_btn8" class="time_btn" onclick="timeBtnEvent(event)">7</button>
                    <button id="time_btn9" class="time_btn" onclick="timeBtnEvent(event)">8</button>
                    <button id="time_btn10"class="time_btn" onclick="timeBtnEvent(event)">9</button>
                    <button id="time_btn11" class="time_btn" onclick="timeBtnEvent(event)">10</button>
                    <button id="time_btn12" class="time_btn" onclick="timeBtnEvent(event)">11</button>
                </div>
            </div>
            <div id="minute_modal" class="modal_box">
                <div id="first_minute_box" class="minute_modal_box">
                    <button id="minute_btn1" class="minute_btn" onclick="minuteBtnEvent(event)">0</button>
                    <button id="minute_btn1" class="minute_btn" onclick="minuteBtnEvent(event)">10</button>
                    <button id="minute_btn1" class="minute_btn" onclick="minuteBtnEvent(event)">20</button>
                </div>
                <div id="second_minute_box" class="minute_modal_box">
                    <button id="minute_btn1" class="minute_btn" onclick="minuteBtnEvent(event)">30</button>
                    <button id="minute_btn1" class="minute_btn" onclick="minuteBtnEvent(event)">40</button>
                    <button id="minute_btn1" class="minute_btn" onclick="minuteBtnEvent(event)">50</button>
                </div>
            </div>
        </div>

        <script src="../js/schedule.js"></script>

</body>
</html>

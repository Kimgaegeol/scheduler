<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList"%>


<%!
// 필요한 함수 모아놓은 스크립트
    //년도를 넘겨받아 윤년/평년을 판단해 윤년이면 true, 평년이면 false를 리턴하는 메서드
    boolean isLeapYear(int year) {
        return (year % 4 ==0) && (year % 100 !=0) || (year % 400 ==0);
    }
    //년,월을 넘겨받아 그 달의 마지막 날짜를 리턴하는 메서드
    int lastDay(int year , int month) {
        int[] m = {31,28,31,30,31,30,31,31,30,31,30,31};
        m[1]=isLeapYear(year)? 29:28;
        return m[month - 1];
    }
    //년,월,일을 넘겨받아 1년 1월 1일부터 지나온 날짜의 합계를 리턴하는 메서드
    int totalDay(int year, int month, int day) {
        int sum = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
        for (int i = 1; i < month; i++) {
            sum += lastDay(year,i);
        }
        return sum + day;
    }
    //년,월,일을 넘겨받아 요일을 숫자로 리턴하는 메서드, 일요일(0),월요일(1)....토요일(6)
    int weekDay(int year, int month, int day) {
        return totalDay(year,month,day) % 7;
    }
%>

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
    request.setCharacterEncoding("utf-8");

    String userIdxRule = "^[0-9]+$";
    String yearRule = "^[0-9]+$";
    String monthRule = "^[0-9]+$";

    String userIdx = (String)session.getAttribute("user_idx");
    String gradeIdx = (String)session.getAttribute("user_grade");
    String teamIdx = (String)session.getAttribute("user_team");

    String year = request.getParameter("year");
    String month = request.getParameter("month");

    //각 date의 idx, day, total_schedule 저장할 배열 선언
    ArrayList dateIdxList = new ArrayList();
    ArrayList dayList = new ArrayList();
    ArrayList totalScheduleList = new ArrayList();

    //1일의 요일을 계산(자주 쓰이기 때문에 변수로 선언)
    int first = 0;
    //1일이 출력될 위치 전에 전달의 마지막 날짜들을 넣어주기 위해 전 달날짜의 시작일을 계산
    int start = 0;
    //day값과 생성되는 날짜가 같을 시 total_schedule을 추가해줌 
    //그러기 위해선 listCount선언해줘야함 -> 다음 스케줄 개수를 추가해주기 위해
    int listCount = 0;
    
    if(userIdx.matches(userIdxRule) && year.matches(yearRule) && month.matches(monthRule)) {
        first = weekDay(Integer.valueOf(year),Integer.valueOf(month),1);
        start = Integer.valueOf(month) ==1? lastDay(Integer.valueOf(year)-1, 12)-first : lastDay(Integer.valueOf(year), Integer.valueOf(month)-1)-first;

        Class.forName("org.mariadb.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");

        String totalScheduleString = "SELECT * FROM date WHERE user_idx = ? AND year = ? AND month = ? ORDER BY day";
        PreparedStatement totalScheduleQuery = connect.prepareStatement(totalScheduleString);
        totalScheduleQuery.setString(1, userIdx);
        totalScheduleQuery.setString(2, year);
        totalScheduleQuery.setString(3, month);
        ResultSet totalScheduleResult = totalScheduleQuery.executeQuery();
        //각 리스트에 저장 
        while(totalScheduleResult.next()) {
            dateIdxList.add(totalScheduleResult.getString("idx"));
            dayList.add(totalScheduleResult.getString("day"));
            totalScheduleList.add(totalScheduleResult.getString("total_schedule"));
        }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/calendar.css">
</head>
<body>

    <div class="container">
<%
    if(Integer.valueOf(gradeIdx) == 1) {
%>
        <button class="view_all_off_btn" onclick="viewAllOffBtnEvent(<%=year%>,<%=month%>)">전체보기</button>

<%
    }
%>
        <img class="profile_icon" src="../image/profile_icon.png" onclick="profileBtnEvent(<%=year%>,<%=month%>)">
        <div class="header">
                <button id="prev_month_btn" class="nav-btn go-prev" onclick="preMonthBtnEvent(<%=year%>,<%=month%>)">&lt;</button>
                <button id="today_month_btn" class="year-month" onclick="todayMonthBtnEvent()"><%=year%> <%=month%></button>
                <button id="next_month_btn" class="nav-btn go-next" onclick="nextMonthBtnEvent(<%=year%>,<%=month%>)">&gt;</button>
        </div>

        <table class="main">
            <tr class="days">
                <td class="day">Sun</td>
                <td class="day">Mon</td>
                <td class="day">Tue</td>
                <td class="day">Wed</td>
                <td class="day">Thu</td>
                <td class="day">Fri</td>
                <td class="day">Sat</td>
            </tr>
            <tr class="dates">
<%
    //빈칸채우기
    for(int i=1; i<= first; i++) {
%>
    <td class="date"></td> 
<% } %>

<%
for(int i=1; i <= lastDay(Integer.valueOf(year),Integer.valueOf(month)); i++){
    if(weekDay(Integer.valueOf(year),Integer.valueOf(month),i) == 6 && i != lastDay(Integer.valueOf(year),Integer.valueOf(month))){
%>
                <td class="date">
                    <p><%=i%></p>
<%
        if(dayList.size() > listCount) {     
            if(Integer.parseInt(String.valueOf(dayList.get(listCount))) == i && Integer.parseInt(String.valueOf(totalScheduleList.get(listCount))) != 0) {
%>
                    <button class="total_schedule_btn" onclick="dateBtnEvent(<%=year%>,<%=month%>,<%=i%>,<%=dateIdxList.get(listCount)%>,<%=totalScheduleList.get(listCount)%>)"><%=totalScheduleList.get(listCount)%>개</button>
<%          
                listCount++;
            }
            else if (Integer.parseInt(String.valueOf(dayList.get(listCount))) == i && Integer.parseInt(String.valueOf(totalScheduleList.get(listCount))) == 0) {
%>
                    <button class="total_schedule_btn" onclick="dateBtnEvent(<%=year%>,<%=month%>,<%=i%>,<%=dateIdxList.get(listCount)%>,0)"></button>
<%
                listCount++;
            }
            else {
%>
                    <button class="total_schedule_btn" onclick="dateBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
            }
        }
        else {
%>
                    <button class="total_schedule_btn" onclick="dateBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>

<%
        }
%>
                </td>
            </tr>
            <tr class="dates">

<% } 
    else{
%>
                <td class="date">
                    <p><%=i%></p>
<%
        if(dayList.size() > listCount) {     
            if(Integer.parseInt(String.valueOf(dayList.get(listCount))) == i && Integer.parseInt(String.valueOf(totalScheduleList.get(listCount))) != 0) {
%>
                    <button class="total_schedule_btn" onclick="dateBtnEvent(<%=year%>,<%=month%>,<%=i%>,<%=dateIdxList.get(listCount)%>,<%=totalScheduleList.get(listCount)%>)"><%=totalScheduleList.get(listCount)%>개</button>
<%          
                listCount++;
            } 
            else if (Integer.parseInt(String.valueOf(dayList.get(listCount))) == i && Integer.parseInt(String.valueOf(totalScheduleList.get(listCount))) == 0) {
%>
                    <button class="total_schedule_btn" onclick="dateBtnEvent(<%=year%>,<%=month%>,<%=i%>,<%=dateIdxList.get(listCount)%>,0)"></button>
<%
                listCount++;

            } 
            else {
%>
                    <button class="total_schedule_btn" onclick="dateBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
            }
        } 
        else {
%>
                    <button class="total_schedule_btn" onclick="dateBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>

<%
        }
%>
                </td>
<%
    }
}
%>
        </table>
    </div>

    <div id="modal_background"> 
        <div id="modal_box">
            <button id="accept_btn" onclick="modalAcceptBtnEvent()">확인</button>
            <div id="date_box">
                <div id="year_box" class="date_change_box">
                    <button id="next_year_btn" class="date_btn" onclick="modalNextYearBtnEvent()">▲</button>
                    <p id="year_text" class="date_text"><%=year%></p>
                    <button id="prev_year_sbtn" class="date_btn"onclick="modalPrevYearBtnEvent()">▼</button>
                </div>
                <div id="month_box" class="date_change_box">
                    <button id="next_month_btn" class="date_btn"onclick="modalNextMonthBtnEvent()">▲</button>
                    <p id="month_text" class="date_text"><%=month%></p>
                    <button id="prev_month_btn" class="date_btn"onclick="modalPrevMonthBtnEvent()">▼</button>
                </div>
            </div>
        </div>

    </div>

    <script src="../js/calendar.js"></script>
</body>
</html>
<%
    }
    else {
%>
    <script>
        alert(" 올바르지 않은 접근입니다. ");
        location.href = "./index.jsp";
    </script>
<%
    }
}
%>
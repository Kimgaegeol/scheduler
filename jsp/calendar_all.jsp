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
    request.setCharacterEncoding("utf-8");
    //userIdx, gradeIdx, teamIdx 는 세션값으로 받아올 것.
    String userIdx = "8";
    String gradeIdx = "1";
    String teamIdx = "1";
    //년도와 달을 가져옴
    int year = Integer.valueOf(request.getParameter("year"));
    int month = Integer.valueOf(request.getParameter("month"));
    //1일의 요일을 계산(자주 쓰이기 때문에 변수로 선언)
    int first = weekDay(year,month,1);
    //1일이 출력될 위치 전에 전달의 마지막 날짜들을 넣어주기 위해 전 달날짜의 시작일을 계산
    int start = 0;
    start = month ==1? lastDay(year-1, 12)-first : lastDay(year, month-1)-first;
    //전체 스케줄의 개수를 담은 리스트와 일자 담을 리스트
    ArrayList<Integer> totalDayList = new ArrayList();
    ArrayList<Integer> totalScheduleList = new ArrayList();
    //내 스케줄의 idx를 담은 리스트와 일자 담을 리스트
    ArrayList<Integer> myIdxList = new ArrayList();
    ArrayList<Integer> myDayList = new ArrayList();
    ArrayList<Integer> myTotalScheduleList = new ArrayList();
    //for문 및 if문을 돌리기 위한 count
    int totalCount = 0;
    int myCount = 0;
    
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");

    //내 스케줄 가져오기
    String myString = "SELECT idx, day, total_schedule FROM date WHERE user_idx = ? AND year = ? AND month = ? ORDER BY day";
    PreparedStatement myQuery = connect.prepareStatement(myString);
    myQuery.setString(1, userIdx);
    myQuery.setString(2, String.valueOf(year));
    myQuery.setString(3, String.valueOf(month));
    ResultSet myResult = myQuery.executeQuery();
    while(myResult.next()) {
        myIdxList.add(Integer.valueOf(myResult.getString("idx")));
        myDayList.add(Integer.valueOf(myResult.getString("day")));
        myTotalScheduleList.add(Integer.valueOf(myResult.getString("total_schedule")));
    }
    //전체 스케줄 가져오기
    String totalString = "SELECT date.day, SUM(total_schedule) sum FROM date JOIN account ON date.user_idx = account.idx WHERE account.team_idx = ? GROUP BY date.day ORDER BY date.day";
    PreparedStatement totalQuery = connect.prepareStatement(totalString);
    totalQuery.setString(1, teamIdx);
    ResultSet totalResult = totalQuery.executeQuery();
    while(totalResult.next()) {
        totalDayList.add(Integer.valueOf(totalResult.getString("date.day")));
        totalScheduleList.add(Integer.valueOf(totalResult.getString("sum")));
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
    if(gradeIdx == "1") {
%>
        <button class="view_all_on_btn" onclick="viewAllOnBtnEvent(<%=year%>,<%=month%>)">전체보기</button>

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
for(int i=1; i <= lastDay(year,month); i++){
%>
                <td class="date">
                    <p><%=i%></p>
<%
    //토요일이면 줄바꿔줌
    if(weekDay(year,month,i) == 6 && i != lastDay(year,month)){
        //선택한 달에 데이터 값이 있는 지 확인(size()함수를 사용하기 위함)
        if(totalDayList.size() > totalCount) {
            if(myDayList.size() > myCount){
                if(totalDayList.get(totalCount) == i && myDayList.get(myCount) == i && totalScheduleList.get(totalCount) != 0) {
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,<%=myIdxList.get(myCount)%>,<%=myTotalScheduleList.get(myCount)%>)"><%=totalScheduleList.get(totalCount)%>개</button>
<%
                    totalCount++;
                    myCount++;
                }
                else if(totalDayList.get(totalCount) == i && myDayList.get(myCount) == i && totalScheduleList.get(totalCount) == 0) {
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
                    totalCount++;
                    myCount++;
                }
                else if(totalDayList.get(totalCount) == i && myDayList.get(myCount) != i && totalScheduleList.get(totalCount) != 0) {
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"><%=totalScheduleList.get(totalCount)%>개</button>
<%
                    totalCount++;
                }
                else if(totalDayList.get(totalCount) == i && myDayList.get(myCount) != i && totalScheduleList.get(totalCount) == 0) {
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
                    totalCount++;

                }
                else{
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
                }
            }
            else if(totalDayList.get(totalCount) == i && totalScheduleList.get(totalCount) != 0){
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"><%=totalScheduleList.get(totalCount)%>개</button>
<%
            }
            else if(totalDayList.get(totalCount) == i && totalScheduleList.get(totalCount) == 0){
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
            }
            else{
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
            }
        }
        else{
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
        }
%>
                </td>
            </tr>
            <tr class="dates">
<%
    }
    else{
        //선택한 달에 데이터 값이 있는 지 확인(size()함수를 사용하기 위함)
        if(totalDayList.size() > totalCount) {
            if(myDayList.size() > myCount){
                if(totalDayList.get(totalCount) == i && myDayList.get(myCount) == i && totalScheduleList.get(totalCount) != 0) {
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,<%=myIdxList.get(myCount)%>,<%=myTotalScheduleList.get(myCount)%>)"><%=totalScheduleList.get(totalCount)%>개</button>
<%
                    totalCount++;
                    myCount++;
                }
                else if(totalDayList.get(totalCount) == i && myDayList.get(myCount) == i && totalScheduleList.get(totalCount) == 0) {
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
                    totalCount++;
                    myCount++;
                }
                else if(totalDayList.get(totalCount) == i && myDayList.get(myCount) != i && totalScheduleList.get(totalCount) != 0) {
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"><%=totalScheduleList.get(totalCount)%>개</button>
<%
                    totalCount++;
                }
                else if(totalDayList.get(totalCount) == i && myDayList.get(myCount) != i && totalScheduleList.get(totalCount) == 0) {
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
                    totalCount++;

                }
                else{
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
                }
            }
            else if(totalDayList.get(totalCount) == i && totalScheduleList.get(totalCount) != 0){
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"><%=totalScheduleList.get(totalCount)%>개</button>
<%
            }
            else if(totalDayList.get(totalCount) == i && totalScheduleList.get(totalCount) == 0){
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
            }
            else{
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
<%
            }
        }
        else{
%>
                    <button class="total_schedule_btn" onclick="dateAllBtnEvent(<%=year%>,<%=month%>,<%=i%>,-1,0)"></button>
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
            <button id="accept_btn" onclick="acceptBtnEvent()">확인</button>
            <div id="date_box">
                <div id="year_box" class="date_change_box">
                    <button id="next_year_btn" class="date_btn">▲</button>
                    <p id="year_text" class="date_text"><%=year%></p>
                    <button id="prev_year_sbtn" class="date_btn">▼</button>
                </div>
                <div id="month_box" class="date_change_box">
                    <button id="next_month_btn" class="date_btn">▲</button>
                    <p id="month_text" class="date_text"><%=month%></p>
                    <button id="prev_month_btn" class="date_btn">▼</button>
                </div>
            </div>
        </div>

    </div>

    <script src="../js/calendar.js"></script>
</body>
</html>
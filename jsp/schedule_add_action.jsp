<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    String scheduleRule = "^.{1,200}$";

    request.setCharacterEncoding("utf-8");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    String dateIdx = request.getParameter("date_idx");
    String time = request.getParameter("time");
    String minute = request.getParameter("minute");
    String content = request.getParameter("content");
    int totalSchedule = Integer.valueOf(request.getParameter("total_schedule"));


    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");
    
    if (content.matches(scheduleRule)) {
        //스케줄 추가
        String addScheduleString = "INSERT INTO schedule(date_idx, time, minute, content) VALUES (?,?,?,?)";
        PreparedStatement addScheduleQuery = connect.prepareStatement(addScheduleString);
        addScheduleQuery.setString(1, dateIdx);
        addScheduleQuery.setString(2, time);
        addScheduleQuery.setString(3, minute);
        addScheduleQuery.setString(4, content);
        addScheduleQuery.executeUpdate();
        //스케줄 총 개수 업데이트
        totalSchedule++;
        String totalScheduleUpdateString = "UPDATE date SET total_schedule = ? WHERE idx = ?";
        PreparedStatement totalScheduleUpdateQuery = connect.prepareStatement(totalScheduleUpdateString);
        totalScheduleUpdateQuery.setString(1, String.valueOf(totalSchedule));
        totalScheduleUpdateQuery.setString(2, dateIdx);
        totalScheduleUpdateQuery.executeUpdate();
%>
                <script>
                    location.href = "./schedule.jsp?year=" + <%=year%> + "&month=" + <%=month%> + "&day=" + <%=day%> + "&date_idx=" + <%=dateIdx%> + "&total_schedule=" + <%=totalSchedule%>;
                </script>
<%
    }
    else {
%>
                <script>
                    location.href = "./schedule.jsp?year=" + <%=year%> + "&month=" + <%=month%> + "&day=" + <%=day%> + "&date_idx=" + <%=dateIdx%>;
                    alert(" 예상치 못한 오류가 발생했습니다. ");
                </script>
<%      
    }
%>
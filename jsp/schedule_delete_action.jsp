<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%
    if(session.getAttribute("user_idx") == null) {
%>
    <script>
        alert("세션이 만료되었습니다.");
        location.href = "./index.jsp";
    </script>
<%
    }
    request.setCharacterEncoding("utf-8");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day"); 
    String dateIdx = request.getParameter("date_idx");
    int totalSchedule = Integer.valueOf(request.getParameter("total_schedule"));
    String scheduleIdx = request.getParameter("schedule_idx");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");
    //스케줄 삭제
    String scheduleDeleteString = "DELETE FROM schedule WHERE idx = ?";
    PreparedStatement scheduleDeleteQuery = connect.prepareStatement(scheduleDeleteString);
    scheduleDeleteQuery.setString(1, scheduleIdx);
    scheduleDeleteQuery.executeUpdate();
    //스케줄 총 개수 업데이트
    totalSchedule--;
    String totalScheduleUpdateString = "UPDATE date SET total_schedule = ? WHERE idx = ?";
    PreparedStatement totalScheduleUpdateQuery = connect.prepareStatement(totalScheduleUpdateString);
    totalScheduleUpdateQuery.setString(1, String.valueOf(totalSchedule));
    totalScheduleUpdateQuery.setString(2, dateIdx);
    totalScheduleUpdateQuery.executeUpdate();
%>
<script>
    location.href = "../jsp/schedule.jsp?year=" + <%=year%> + "&month=" + <%=month%> + "&day=" + <%=day%> + "&date_idx=" + <%=dateIdx%> + "&total_schedule=" + <%=totalSchedule%>;
</script>
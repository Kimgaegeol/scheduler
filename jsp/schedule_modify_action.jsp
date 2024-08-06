<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%
    if(session.getAttribute("user_idx") == null) {
        session.invalidate();
%>
    <script>
        alert("세션이 만료되었습니다.");
        location.href = "./index.jsp";
    </script>
<%
    }
    //시간,분도 정규표현식 만들어야 함
    String contentRule = "^.{1,200}$";

    request.setCharacterEncoding("utf-8");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    String dateIdx = request.getParameter("date_idx");
    String totalSchedule = request.getParameter("total_schedule");
    String scheduleIdx = request.getParameter("schedule_idx");
    String time = request.getParameter("time");
    String minute = request.getParameter("minute");
    String content = request.getParameter("content");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");

    if (content.matches(contentRule)) {
        String contentUpdateString = "UPDATE schedule SET time = ?, minute = ?, content = ? WHERE idx = ?";
        PreparedStatement contentUpdateQuery = connect.prepareStatement(contentUpdateString);
        contentUpdateQuery.setString(1, time);
        contentUpdateQuery.setString(2, minute);
        contentUpdateQuery.setString(3, content);
        contentUpdateQuery.setString(4, scheduleIdx);
        contentUpdateQuery.executeUpdate();
%>
    <script>
        location.href = "../jsp/schedule.jsp?year=" + <%=year%> + "&month=" + <%=month%> + "&day=" + <%=day%> + "&date_idx=" + <%=dateIdx%> + "&total_schedule=" + <%=totalSchedule%>;
    </script>
<%
    }
    else {
%>
    <script>
        location.href = "../jsp/schedule.jsp?year=" + <%=year%> + "&month=" + <%=month%> + "&day=" + <%=day%> + "&date_idx=" + <%=dateIdx%> + "&total_schedule=" + <%=totalSchedule%>;
        alert(" 제약조건을 만족해주세요. ")
    </script>
<%      
    }
%>
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
    request.setCharacterEncoding("utf-8");
    String idx = (String)session.getAttribute("user_idx");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");
    //스케줄 삭제
    String scheduleDeleteString = "DELETE FROM account WHERE idx = ?";
    PreparedStatement scheduleDeleteQuery = connect.prepareStatement(scheduleDeleteString);
    scheduleDeleteQuery.setString(1, idx);
    scheduleDeleteQuery.executeUpdate();
    session.invalidate();
%>
<script>
    location.href = "../jsp/index.jsp";
</script>
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
    String pwRule = "^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}+$";

    request.setCharacterEncoding("utf-8");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String passwordChangeText = request.getParameter("password_change_text");

    String idx = (String)session.getAttribute("user_idx");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");

    if (passwordChangeText.matches(pwRule)) {
        String passwordChangeString = "UPDATE account SET pw = ? WHERE idx = ?";
        PreparedStatement passwordChangeQuery = connect.prepareStatement(passwordChangeString);
        passwordChangeQuery.setString(1, passwordChangeText);
        passwordChangeQuery.setString(2, idx);
        passwordChangeQuery.executeUpdate();
        session.invalidate();
%>
    <script>
        location.href = "../jsp/index.jsp";
        alert(" 비밀번호 변경 성공!. ")
    </script>
<%
    }
    else {
%>
    <script>
        location.href = "../jsp/profile.jsp?year=" + year + "&month=" + month;
        alert(" 제약조건을 만족해주세요. ")
    </script>
<%      
    }
%>
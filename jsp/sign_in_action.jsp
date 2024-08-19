<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>


<%
    String idRule = "^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}+$";
    String pwRule = "^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}+$";

    request.setCharacterEncoding("utf-8");
    String idText = request.getParameter("id");
    String pwText = request.getParameter("pw");
    
    if (idText.matches(idRule) && pwText.matches(pwRule)) {
        Class.forName("org.mariadb.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");
        
        String signInString = "SELECT * FROM account WHERE id = ? AND pw = ?";
        PreparedStatement signInQuery = connect.prepareStatement(signInString);
        signInQuery.setString(1, idText);
        signInQuery.setString(2, pwText);
        ResultSet signInResult = signInQuery.executeQuery();
        //현재 날짜를 받아줌
        if(signInResult.next()) {
            session.setAttribute("user_idx", signInResult.getString("idx"));
            session.setAttribute("user_grade", signInResult.getString("grade_idx"));
            session.setAttribute("user_team", signInResult.getString("team_idx"));
            session.setAttribute("user_id", signInResult.getString("id"));
            session.setAttribute("user_pw", signInResult.getString("pw"));
            session.setAttribute("user_name", signInResult.getString("name"));
            session.setAttribute("user_phone", signInResult.getString("phone"));

            Date date = new Date();
            int year = date.getYear() + 1900;
            int month = date.getMonth() + 1;
%>
            <script>
                location.href = "./calendar.jsp?year=" + <%=year%> + "&month=" + <%=month%>;
            </script>  
<%
        } else {
%>
            <script>
                location.href = "./index.jsp"
                alert("존재하지 않는 계정입니다!")
            </script>
<%
        }
    } else {
%>
        <script>
                alert(" 제약조건을 확인해주세요. ")
                location.href = "./index.jsp"
        </script>  
<% } %>
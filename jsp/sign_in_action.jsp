<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    String idRule = "^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}+$";
    String pwRule = "^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}+$";

    request.setCharacterEncoding("utf-8");
    String idText = request.getParameter("id");
    String pwText = request.getParameter("pw");


    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");
    
    if (idText.matches(idRule) && pwText.matches(pwRule)) {
        String signInString = "SELECT * FROM account WHERE id = ? AND pw = ?";
        PreparedStatement signInQuery = connect.prepareStatement(signInString);
        signInQuery.setString(1, idText);
        signInQuery.setString(2, pwText);
        ResultSet signInResult = signInQuery.executeQuery();
        if(signInResult.next()) {
%>
            <script>
                location.href = "./calender.jsp"
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
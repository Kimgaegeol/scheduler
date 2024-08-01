<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    String phoneRule = "^[\\d]{2,3}-[\\d]{3,4}-[\\d]{4}+$";

    request.setCharacterEncoding("utf-8");
    String phoneText = request.getParameter("phone");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");
    //전화번호 정규표현식 만족 확인
    if (phoneText.matches(phoneRule)) {
        //아이디 찾기
        String idSearchString = "SELECT id FROM account WHERE phone = ?";
        PreparedStatement idSearchQuery = connect.prepareStatement(idSearchString);
        idSearchQuery.setString(1, phoneText);
        ResultSet idSearchResult = idSearchQuery.executeQuery();

        if (idSearchResult.next()) {
            String idText = idSearchResult.getString("id");
%>
            <script>
                var win = window.open("", "PopupWin", "width=500,height=600");
                win.document.write("<p>찾으신 아이디는 \" <%=idText%> \" 입니다.</p>");
                location.href="./search.jsp";
            </script>

<%
        } else {
%>
            <script>
                location.href="./search.jsp"
                alert(" 존재하지 않는 아이디입니다! ");
            </script>
<%
        }
    } else {
%>
        <script>
            location.href="./search.jsp"
            alert(" 제약조건을 확인해주세요. ");
        </script>
<%
    }
%>
<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    String idRule = "^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}+$";
    String phoneRule = "^[\\d]{2,3}-[\\d]{3,4}-[\\d]{4}+$";

    request.setCharacterEncoding("utf-8");
    String idText = request.getParameter("id");
    String phoneText = request.getParameter("phone");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");
    //전화번호, 아이디 정규표현식 만족 확인
    if (idText.matches(idRule) &&phoneText.matches(phoneRule)) {
        //비밀번호 찾기
        String pwSearchString = "SELECT pw FROM account WHERE id = ? AND phone = ?";
        PreparedStatement pwSearchQuery = connect.prepareStatement(pwSearchString);
        pwSearchQuery.setString(1, idText);
        pwSearchQuery.setString(2, phoneText);
        ResultSet pwSearchResult = pwSearchQuery.executeQuery();

        if (pwSearchResult.next()) {
            String pwText = pwSearchResult.getString("pw");
%>
            <script>
                var win = window.open("", "PopupWin", "width=500,height=600");
                win.document.write("<p>찾으신 비밀번호는 \" <%=pwText%> \" 입니다.</p>");
                location.href="./search.jsp";
            </script>

<%
        } else {
%>
            <script>
                location.href="./search.jsp"
                alert(" 존재하지 않는 비밀번호입니다! ");
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
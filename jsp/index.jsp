<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");

    String teamSql = "SELECT * FROM team ORDER BY idx";
    PreparedStatement teamQuery = connect.prepareStatement(teamSql);
    ResultSet teamResult = teamQuery.executeQuery();

    String gradeSql = "SELECT * FROM grade ORDER BY idx";
    PreparedStatement gradeQuery = connect.prepareStatement(gradeSql);
    ResultSet gradeResult = gradeQuery.executeQuery();
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
    <div class="container right-panel-active">
      
        <!-- Sign In -->
        <div class="container__form container--signin">
          <form action="#" class="form" id="form2">
            <h2 class="form__title">Sign In</h2>
            <input id="sign_in_id" type="text" placeholder="Id" class="input" />
            <div id="sign_in_id_check_text" class="red">" 영문,숫자 모두 포함 4~20글자 "</div>
            <input id="sign_in_pw" type="password" placeholder="Password" class="input" />
            <div id="sign_in_pw_check_text" class="red">" 영문,숫자 모두 포함 4~20글자 "</div>
            <button id="search_btn" class="location_text" type="button" onclick="searchBtnEvent()">Forgot your password?</button>
            <button id="sign_in_finish_btn" class="btn finish_btn" type="button">Sign In</button>
          </form>
        </div>
        <!-- Sign Up -->
        <div class="container__form container--signup">
          <form action="#" class="form" id="form1">
            <h2 class="form__title">Sign Up</h2>
            <input id="sign_up_id" type="text" placeholder="Id" class="input" />
            <div id="sign_up_id_check_text" class="red">" 영문,숫자 모두 포함 4~20글자 "</div>
            <input id="sign_up_pw" type="password" placeholder="Password" class="input" />
            <div id="sign_up_pw_check_text" class="red">" 영문,숫자 모두 포함 4~20글자 "</div>
            <input id="sign_up_name" type="text" placeholder="Name" class="input" />
            <div id="sign_up_name_check_text" class="red">" 영문 또는 한글로만 1~20글자 "</div>
            <input id="sign_up_phone" type="tel" placeholder="PhoneNumber" class="input" />
            <div id="sign_up_phone_check_text" class="red">"&ensp;'-'포함&ensp;"</div>
            <select name="team_select" id="sign_up_team" class="input">
<%            while(teamResult.next()) { %>
              <option value=<%=teamResult.getString("idx")%>><%=teamResult.getString("name")%></option>
<%            } %>
            </select>
            <select name="grade_select" id="sign_up_grade" class="input">
<%            while(gradeResult.next()) { %>
              <option value=<%=gradeResult.getString("idx")%>><%=gradeResult.getString("name")%></option>
<%            } %>
            </select>
            <button id="sign_up_finish_btn" class="btn finish_btn" type="button">Sign Up</button>
          </form>
        </div>
      
        <!-- Overlay -->
        <div class="container__overlay">
          <div class="overlay">
            <div class="overlay__panel overlay--left">
              <button class="btn" id="signIn">Sign In</button>
            </div>
            <div class="overlay__panel overlay--right">
              <button class="btn" id="signUp">Sign Up</button>
            </div>
          </div>
        </div>
      </div>

      <script src="../js/sign_in.js"></script>
      <script src="../js/sign_up.js"></script>
</body>
</html>
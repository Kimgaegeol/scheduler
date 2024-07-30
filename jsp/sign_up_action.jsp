<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    String idRule = "^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}+$";
    String pwRule = "^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}+$";
    String nameRule = "^[0-9a-zA-Zㄱ-ㅎ가-힣 ]{1,20}+$";
    String phoneRule = "^[\\d]{2,3}-[\\d]{3,4}-[\\d]{4}+$";
    String teamIdxRule = "^[0-9]*$";
    String gradeIdxRule = "^[0-9]*$";

    request.setCharacterEncoding("utf-8");
    String idText = request.getParameter("id");
    String pwText = request.getParameter("pw");
    String nameText = request.getParameter("name");
    String phoneText = request.getParameter("phone");
    String teamIdx = request.getParameter("teamIdx");
    String gradeIdx = request.getParameter("gradeIdx");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler", "stageus", "1234");
    
    if (idText.matches(idRule) && pwText.matches(pwRule) && nameText.matches(nameRule) && phoneText.matches(phoneRule) && teamIdx.matches(teamIdxRule) && gradeIdx.matches(gradeIdxRule)) {
        //아이디 중복찾기 과정 -> 정규표현식을 만족할 때만 검사
        String idSearchString = "SELECT idx FROM account WHERE id = ?";
        PreparedStatement idSearchQuery = connect.prepareStatement(idSearchString);
        idSearchQuery.setString(1, idText);
        ResultSet idSearchResult = idSearchQuery.executeQuery();
        if (!idSearchResult.next()) {
            //전화번호 중복찾기 과정 -> 정규표현식, 아이디 중복찾기 만족할 때만 검사
            String phoneSearchString = "SELECT idx FROM account WHERE phone = ?";
            PreparedStatement phoneSearchQuery = connect.prepareStatement(phoneSearchString);
            phoneSearchQuery.setString(1, phoneText);
            ResultSet phoneSearchResult = phoneSearchQuery.executeQuery();
            if(!phoneSearchResult.next()) {
                //회원가입 과정 -> 정규표현식, 아이디 중복찾기, 전화번호 중복찾기 만족할 때만 검사
                String signUpString = "INSERT INTO account(grade_idx, team_idx, id, pw, name, phone) VALUES (?,?,?,?,?,?)";
                PreparedStatement signUpQuery = connect.prepareStatement(signUpString);
                signUpQuery.setString(1, gradeIdx);
                signUpQuery.setString(2, teamIdx);
                signUpQuery.setString(3, idText);
                signUpQuery.setString(4, pwText);
                signUpQuery.setString(5, nameText);
                signUpQuery.setString(6, phoneText);

                signUpQuery.executeUpdate();
%>
                <script>
                    location.href="./index.jsp"
                    alert(" 회원가입 성공! ");
                </script>

<%
            } else {
%>
            <script>
                location.href="./index.jsp"
                alert(" 중복된 전화번호입니다! ");
            </script>
<%
            }
        } else {
%>
            <script>
                location.href="./index.jsp"
                alert(" 중복된 아이디입니다! ");
            </script>
<%
        }
    } else {
%>
            <script>
                location.href="./index.jsp"
                alert(" 제약조건을 확인해주세요. ");
            </script>
<%
    }
%>